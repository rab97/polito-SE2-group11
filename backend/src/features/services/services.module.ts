import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Service } from './service.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Service])],
})
export class ServicesModule {}