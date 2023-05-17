import { Injectable, UnauthorizedException, Logger } from '@nestjs/common';
import { PassportStrategy } from '@nestjs/passport';
import { BasicStrategy as Strategy } from 'passport-http';
import { AuthService } from '../auth.service';

@Injectable()
export class BasicStrategy extends PassportStrategy(Strategy) {
  constructor(private authService: AuthService) {
    super();
  }

  async validate(username: string, pass: string): Promise<any> {
    Logger.warn('validate');
    const user = await this.authService.validateUser(username, pass);
    Logger.warn(JSON.stringify(user));
    if (!user) {
      throw new UnauthorizedException();
    }

    const { password, ...result } = user;

    return result;
  }
}
