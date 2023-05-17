import { Injectable, Logger } from '@nestjs/common';
import { v4 } from 'uuid';
import { User as IUser } from '../models';
import { User } from '../../database/entities/user.entity';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';

@Injectable()
export class UsersService {
  constructor(
    @InjectRepository(User)
    private readonly userRepository: Repository<User>,
  ) {}

  async findOne(userName: string): Promise<IUser> {
    return await this.userRepository.findOne({
      where: {
        name: userName,
      },
    });
  }

  async createOne({ name, password }: IUser): Promise<IUser> {
    Logger.warn('try to create user');
    console.log(JSON.stringify(name) + JSON.stringify(password) + '4');
    const user = await this.userRepository.create({ name, password });
    return await this.userRepository.save(user);
  }
}
