Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9781A36D2E3
	for <lists+amd-gfx@lfdr.de>; Wed, 28 Apr 2021 09:15:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1C3D6E09A;
	Wed, 28 Apr 2021 07:15:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73CB46E09A
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Apr 2021 07:15:42 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id d14so9091259edc.12
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Apr 2021 00:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=qFXszTZlRoP/SlzqYgK6Q3MF7O5qGSXryW8tQGwvjjU=;
 b=VtQpoxQ97/uthi+Vswuzlxqsh1jk9XIS9AcK0KiQLTgZpaWbsjpDtEdTWRCiHpUBKs
 nwH9QYZFfZfZi/S4/hupC+oRa2wlKd1syxVB5j/+V+qzTWjCCvrayWWYxtLCSw9Puixz
 K9ZVSMO8xvcoNs7E1Bu7cmD2YSvvYzDH3yAoZX4q5GjVftIMwAX321/hDTT+M17R9klV
 7Oax8PFUY9J/1Cx1N637EazhoiZE/hJt0d0zDPUKbPZ/SGG1K5uEAjbkfoYbdPSo8h6a
 N2fGXWjvwvbl5xFjcLR9EeT1n/ditj/xtS1zbm6CMcl9/hJDwJmN4gnBl/KD5iC0Tjti
 T69g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=qFXszTZlRoP/SlzqYgK6Q3MF7O5qGSXryW8tQGwvjjU=;
 b=IjZ7e1tfzNlE5vJ7luMdvnKVAy5qg/MnHPw4q482vF8l9/JFsXo8LgikQQKQr3ihUl
 MZ40a0PjS2ShwriKNseDagC72AKK3p48qSm5Ia1HgrsIBryNAnWUF0hZzy5xWm3I6TAO
 ybxOsy72avMQ67Fne7CrD1t0By/CIr9hQ1kHZ/FgiB+aSI6JQtF//wrfDGAcZv3R7svt
 Xr7PV1azTVmUUcfhQHf5GaWngUgvrY3wS/Ija5p08l6TF1/mZfdrQWmV6dbNV7UqQrT8
 1JqUocrFeZ9JdzEEduKy8MQ/Oom6lgkPT8Ii9bZzi1HlMEiUYArd74Wh3EKX51Prz0ME
 WJpw==
X-Gm-Message-State: AOAM531vp7TVQqh4wAPHW6qZp3GBKrJpBLV88oG+vZioLquN0nSmU4OB
 zh/J7RrpUQDQ3Pb5m7n072U=
X-Google-Smtp-Source: ABdhPJySaqmMFGZOuAAY82RcfRKyL0n0nBbGkMWVPbel0meFGlidRZ7EQYEP/qJHsTF/4Y7xUGGomw==
X-Received: by 2002:aa7:c511:: with SMTP id o17mr8917374edq.335.1619594141050; 
 Wed, 28 Apr 2021 00:15:41 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:5565:6656:893b:2618?
 ([2a02:908:1252:fb60:5565:6656:893b:2618])
 by smtp.gmail.com with ESMTPSA id b22sm4118104edv.96.2021.04.28.00.15.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 00:15:40 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: Add vbios info ioctl interface
To: "Nieto, David M" <David.Nieto@amd.com>,
 "Gu, JiaWei (Will)" <JiaWei.Gu@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20210422023448.24689-1-Jiawei.Gu@amd.com>
 <BE86C24E-8E22-47C8-B737-E7F58F8B9326@amd.com>
 <F593F9B0-C6CB-4245-BC82-0B63F65DF33F@amd.com>
 <84a7de3b-b6a1-2acf-247a-0c93e84db09b@gmail.com>
 <DM6PR12MB4170A07B0FADBEF73D359B6CF8459@DM6PR12MB4170.namprd12.prod.outlook.com>
 <0C1CB3BD-37DD-4F05-9E6E-2DED8A6CD44B@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <27103289-b51a-8e4b-ad09-0169829efeb0@gmail.com>
Date: Wed, 28 Apr 2021 09:15:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <0C1CB3BD-37DD-4F05-9E6E-2DED8A6CD44B@amd.com>
Content-Language: en-US
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "StDenis,
 Tom" <Tom.StDenis@amd.com>
Content-Type: multipart/mixed; boundary="===============1282158499=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============1282158499==
Content-Type: multipart/alternative;
 boundary="------------5DDBBD388BB0C050845652D7"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------5DDBBD388BB0C050845652D7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Well displaying the VBIOS information along with the other firmware in 
userspace is certainly useful.

We should just avoid making strong dependencies on that.

Firmware and VBIOS must always be backward compatible and the driver 
must always work with any released firmware and VBIOS combination.

What we can do is to display a warning when we detect and/or old/buggy 
firmware.

Regards,
Christian.

Am 28.04.21 um 08:47 schrieb Nieto, David M:
>
> Besides system management, it provides parseable details on the VBIOS 
> version and information. This is useful renderer information as the 
> GPU behavior depends not only on the driver version but also on the 
> firmwares running on the GPU.
>
> The AMDGPU_INFO ioctl contains a method to get the versions of the 
> ucode for all the IPs, but for VBIOS, only a way to dump the entire 
> image is provided. While it Is possible to implement the whole logic 
> of VBIOS parsing on userspace, it requires the application to have 
> details on the header and table formats to parse the data. Moreover 
> there is no guarantee that the format and header locations will remain 
> constant across ASIC generations, so the maintainance cost and 
> complexity seems unreasonable.
>
> Providing a simple, and stable interface to the application seems to 
> us like a sensible choice.
>
> Thanks,
>
> David
>
> *From: *amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of 
> "Gu, JiaWei (Will)" <JiaWei.Gu@amd.com>
> *Date: *Thursday, April 22, 2021 at 8:25 PM
> *To: *Christian König <ckoenig.leichtzumerken@gmail.com>, 
> "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
> *Cc: *"Deucher, Alexander" <Alexander.Deucher@amd.com>, "StDenis, Tom" 
> <Tom.StDenis@amd.com>, "Nieto, David M" <David.Nieto@amd.com>
> *Subject: *RE: [PATCH] drm/amdgpu: Add vbios info ioctl interface
>
> [AMD Official Use Only - Internal Distribution Only]
>
> Hi Christian,
>
> It will be used by a user space SMI-lib for GPU status query.
>
> Hi David, please feel free to correct my statement since I’m not sure 
> I have a view of whole picture.
>
> Thanks,
>
> Jiawei
>
> *From:* Christian König <ckoenig.leichtzumerken@gmail.com>
> *Sent:* Thursday, April 22, 2021 9:27 PM
> *To:* Gu, JiaWei (Will) <JiaWei.Gu@amd.com>; amd-gfx@lists.freedesktop.org
> *Cc:* Deucher, Alexander <Alexander.Deucher@amd.com>; StDenis, Tom 
> <Tom.StDenis@amd.com>
> *Subject:* Re: [PATCH] drm/amdgpu: Add vbios info ioctl interface
>
> Is that useful to Vulkan/OpenGL/other clients in any way?
>
> Christian.
>
> Am 22.04.21 um 15:18 schrieb Gu, JiaWei (Will):
>
>       
>
>     CC Tom.
>
>       
>
>         On Apr 22, 2021, at 21:09, Gu, JiaWei (Will)<JiaWei.Gu@amd.com>  <mailto:JiaWei.Gu@amd.com>  wrote:
>
>           
>
>         <[v2][umr]add-vbios-info-query.patch>
>
>         UMR patch which calls this new IOCTL attached.
>
>           
>
>         Best regards,
>
>         Jiawei
>
>           
>
>             On Apr 22, 2021, at 10:34, Jiawei Gu<JiaWei.Gu@amd.com>  <mailto:JiaWei.Gu@amd.com>  wrote:
>
>               
>
>             Add AMDGPU_INFO_VBIOS_INFO subquery id for detailed vbios info.
>
>               
>
>             Signed-off-by: Jiawei Gu<Jiawei.Gu@amd.com>  <mailto:Jiawei.Gu@amd.com>
>
>             ---
>
>             drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c    |  19 +++
>
>             drivers/gpu/drm/amd/amdgpu/atom.c          | 158 +++++++++++++++++++++
>
>             drivers/gpu/drm/amd/amdgpu/atom.h          |  11 ++
>
>             drivers/gpu/drm/amd/include/atomfirmware.h |  16 ++-
>
>             include/uapi/drm/amdgpu_drm.h              |  15 ++
>
>             5 files changed, 213 insertions(+), 6 deletions(-)
>
>               
>
>             diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
>
>             index 39ee88d29cca..a20b016b05ab 100644
>
>             --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
>
>             +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
>
>             @@ -861,6 +861,25 @@ int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
>
>                                                     min((size_t)size, (size_t)(bios_size - bios_offset)))
>
>                                                 ? -EFAULT : 0;
>
>                           }
>
>             +            case AMDGPU_INFO_VBIOS_INFO: {
>
>             +                   struct drm_amdgpu_info_vbios vbios_info = {};
>
>             +                   struct atom_context *atom_context;
>
>             +
>
>             +                   atom_context = adev->mode_info.atom_context;
>
>             +                 memcpy(vbios_info.name, atom_context->name, sizeof(atom_context->name));
>
>             +                 vbios_info.dbdf = PCI_DEVID(adev->pdev->bus->number, adev->pdev->devfn);
>
>             +                 memcpy(vbios_info.vbios_pn, atom_context->vbios_pn, sizeof(atom_context->vbios_pn));
>
>             +                 vbios_info.version = atom_context->version;
>
>             +                 memcpy(vbios_info.date, atom_context->date, sizeof(atom_context->date));
>
>             +                 memcpy(vbios_info.serial, adev->serial, sizeof(adev->serial));
>
>             +                 vbios_info.dev_id = adev->pdev->device;
>
>             +                 vbios_info.rev_id = adev->pdev->revision;
>
>             +                 vbios_info.sub_dev_id = atom_context->sub_dev_id;
>
>             +                 vbios_info.sub_ved_id = atom_context->sub_ved_id;
>
>             +
>
>             +                   return copy_to_user(out, &vbios_info,
>
>             +                                  min((size_t)size, sizeof(vbios_info))) ? -EFAULT : 0;
>
>             +            }
>
>                           default:
>
>                                DRM_DEBUG_KMS("Invalid request %d\n",
>
>                                          info->vbios_info.type);
>
>             diff --git a/drivers/gpu/drm/amd/amdgpu/atom.c b/drivers/gpu/drm/amd/amdgpu/atom.c
>
>             index 3dcb8b32f48b..0e2f0ea13b40 100644
>
>             --- a/drivers/gpu/drm/amd/amdgpu/atom.c
>
>             +++ b/drivers/gpu/drm/amd/amdgpu/atom.c
>
>             @@ -31,6 +31,7 @@
>
>               
>
>             #define ATOM_DEBUG
>
>               
>
>             +#include "atomfirmware.h"
>
>             #include "atom.h"
>
>             #include "atom-names.h"
>
>             #include "atom-bits.h"
>
>             @@ -1299,12 +1300,153 @@ static void atom_index_iio(struct atom_context *ctx, int base)
>
>                   }
>
>             }
>
>               
>
>             +static void atom_get_vbios_name(struct atom_context *ctx)
>
>             +{
>
>             +    unsigned char *p_rom;
>
>             +    unsigned char str_num;
>
>             +    unsigned short off_to_vbios_str;
>
>             +    unsigned char *c_ptr;
>
>             +    int name_size;
>
>             +    int i;
>
>             +
>
>             +    const char *na = "--N/A--";
>
>             +    char *back;
>
>             +
>
>             +    p_rom = ctx->bios;
>
>             +
>
>             +    str_num = *(p_rom + OFFSET_TO_GET_ATOMBIOS_NUMBER_OF_STRINGS);
>
>             +    if (str_num != 0) {
>
>             +            off_to_vbios_str =
>
>             +                   *(unsigned short *)(p_rom + OFFSET_TO_GET_ATOMBIOS_STRING_START);
>
>             +
>
>             +            c_ptr = (unsigned char *)(p_rom + off_to_vbios_str);
>
>             +    } else {
>
>             +            /* do not know where to find name */
>
>             +            memcpy(ctx->name, na, 7);
>
>             +            ctx->name[7] = 0;
>
>             +            return;
>
>             +    }
>
>             +
>
>             +    /*
>
>             +     * skip the atombios strings, usually 4
>
>             +     * 1st is P/N, 2nd is ASIC, 3rd is PCI type, 4th is Memory type
>
>             +     */
>
>             +    for (i = 0; i < str_num; i++) {
>
>             +            while (*c_ptr != 0)
>
>             +                   c_ptr++;
>
>             +            c_ptr++;
>
>             +    }
>
>             +
>
>             +    /* skip the following 2 chars: 0x0D 0x0A */
>
>             +    c_ptr += 2;
>
>             +
>
>             +    name_size = strnlen(c_ptr, STRLEN_LONG - 1);
>
>             +    memcpy(ctx->name, c_ptr, name_size);
>
>             +    back = ctx->name + name_size;
>
>             +    while ((*--back) == ' ')
>
>             +            ;
>
>             +    *(back + 1) = '\0';
>
>             +}
>
>             +
>
>             +static void atom_get_vbios_date(struct atom_context *ctx)
>
>             +{
>
>             +    unsigned char *p_rom;
>
>             +    unsigned char *date_in_rom;
>
>             +
>
>             +    p_rom = ctx->bios;
>
>             +
>
>             +    date_in_rom = p_rom + OFFSET_TO_VBIOS_DATE;
>
>             +
>
>             +    ctx->date[0] = '2';
>
>             +    ctx->date[1] = '0';
>
>             +    ctx->date[2] = date_in_rom[6];
>
>             +    ctx->date[3] = date_in_rom[7];
>
>             +    ctx->date[4] = '/';
>
>             +    ctx->date[5] = date_in_rom[0];
>
>             +    ctx->date[6] = date_in_rom[1];
>
>             +    ctx->date[7] = '/';
>
>             +    ctx->date[8] = date_in_rom[3];
>
>             +    ctx->date[9] = date_in_rom[4];
>
>             +    ctx->date[10] = ' ';
>
>             +    ctx->date[11] = date_in_rom[9];
>
>             +    ctx->date[12] = date_in_rom[10];
>
>             +    ctx->date[13] = date_in_rom[11];
>
>             +    ctx->date[14] = date_in_rom[12];
>
>             +    ctx->date[15] = date_in_rom[13];
>
>             +    ctx->date[16] = '\0';
>
>             +}
>
>             +
>
>             +static unsigned char *atom_find_str_in_rom(struct atom_context *ctx, char *str, int start,
>
>             +                                     int end, int maxlen)
>
>             +{
>
>             +    unsigned long str_off;
>
>             +    unsigned char *p_rom;
>
>             +    unsigned short str_len;
>
>             +
>
>             +    str_off = 0;
>
>             +    str_len = strnlen(str, maxlen);
>
>             +    p_rom = ctx->bios;
>
>             +
>
>             +    for (; start <= end; ++start) {
>
>             +            for (str_off = 0; str_off < str_len; ++str_off) {
>
>             +                   if (str[str_off] != *(p_rom + start + str_off))
>
>             +                        break;
>
>             +            }
>
>             +
>
>             +            if (str_off == str_len || str[str_off] == 0)
>
>             +                   return p_rom + start;
>
>             +    }
>
>             +    return NULL;
>
>             +}
>
>             +
>
>             +static void atom_get_vbios_pn(struct atom_context *ctx)
>
>             +{
>
>             +    unsigned char *p_rom;
>
>             +    unsigned short off_to_vbios_str;
>
>             +    unsigned char *vbios_str;
>
>             +    int count;
>
>             +
>
>             +    off_to_vbios_str = 0;
>
>             +    p_rom = ctx->bios;
>
>             +
>
>             +    if (*(p_rom + OFFSET_TO_GET_ATOMBIOS_NUMBER_OF_STRINGS) != 0) {
>
>             +            off_to_vbios_str =
>
>             +                   *(unsigned short *)(p_rom + OFFSET_TO_GET_ATOMBIOS_STRING_START);
>
>             +
>
>             +            vbios_str = (unsigned char *)(p_rom + off_to_vbios_str);
>
>             +    } else {
>
>             +            vbios_str = p_rom + OFFSET_TO_VBIOS_PART_NUMBER;
>
>             +    }
>
>             +
>
>             +    if (*vbios_str == 0) {
>
>             +            vbios_str = atom_find_str_in_rom(ctx, BIOS_ATOM_PREFIX, 3, 1024, 64);
>
>             +            if (vbios_str == NULL)
>
>             +                   vbios_str += sizeof(BIOS_ATOM_PREFIX) - 1;
>
>             +    }
>
>             +    if (vbios_str != NULL && *vbios_str == 0)
>
>             +            vbios_str++;
>
>             +
>
>             +    if (vbios_str != NULL) {
>
>             +            count = 0;
>
>             +            while ((count < BIOS_STRING_LENGTH) && vbios_str[count] >= ' ' &&
>
>             +                   vbios_str[count] <= 'z') {
>
>             +                 ctx->vbios_pn[count] = vbios_str[count];
>
>             +                   count++;
>
>             +            }
>
>             +
>
>             +            ctx->vbios_pn[count] = 0;
>
>             +    }
>
>             +}
>
>             +
>
>             struct atom_context *amdgpu_atom_parse(struct card_info *card, void *bios)
>
>             {
>
>                   int base;
>
>                   struct atom_context *ctx =
>
>                       kzalloc(sizeof(struct atom_context), GFP_KERNEL);
>
>                   char *str;
>
>             +    struct _ATOM_ROM_HEADER *atom_rom_header;
>
>             +    struct _ATOM_MASTER_DATA_TABLE *master_table;
>
>             +    struct _ATOM_FIRMWARE_INFO *atom_fw_info;
>
>                   u16 idx;
>
>               
>
>                   if (!ctx)
>
>             @@ -1353,6 +1495,22 @@ struct atom_context *amdgpu_atom_parse(struct card_info *card, void *bios)
>
>                        strlcpy(ctx->vbios_version, str, sizeof(ctx->vbios_version));
>
>                   }
>
>               
>
>             +    atom_rom_header = (struct _ATOM_ROM_HEADER *)CSTR(base);
>
>             +    ctx->sub_dev_id = atom_rom_header->usSubsystemVendorID;
>
>             +    ctx->sub_ved_id = atom_rom_header->usSubsystemID;
>
>             +    if (atom_rom_header->usMasterDataTableOffset != 0) {
>
>             +            master_table = (struct _ATOM_MASTER_DATA_TABLE *)
>
>             +                    CSTR(atom_rom_header->usMasterDataTableOffset);
>
>             +            if (master_table->ListOfDataTables.FirmwareInfo != 0) {
>
>             +                   atom_fw_info = (struct _ATOM_FIRMWARE_INFO *)
>
>             +                           CSTR(master_table->ListOfDataTables.FirmwareInfo);
>
>             +                   ctx->version = atom_fw_info->ulFirmwareRevision;
>
>             +            }
>
>             +    }
>
>             +
>
>             +    atom_get_vbios_name(ctx);
>
>             +    atom_get_vbios_pn(ctx);
>
>             +    atom_get_vbios_date(ctx);
>
>               
>
>                   return ctx;
>
>             }
>
>             diff --git a/drivers/gpu/drm/amd/amdgpu/atom.h b/drivers/gpu/drm/amd/amdgpu/atom.h
>
>             index d279759cab47..c729f7ceba4f 100644
>
>             --- a/drivers/gpu/drm/amd/amdgpu/atom.h
>
>             +++ b/drivers/gpu/drm/amd/amdgpu/atom.h
>
>             @@ -112,6 +112,10 @@ struct drm_device;
>
>             #define ATOM_IO_SYSIO              2
>
>             #define ATOM_IO_IIO         0x80
>
>               
>
>             +#define STRLEN_NORMAL             32
>
>             +#define STRLEN_LONG        64
>
>             +#define STRLEN_VERYLONG           254
>
>             +
>
>             struct card_info {
>
>                   struct drm_device *dev;
>
>                   void (* reg_write)(struct card_info *, uint32_t, uint32_t);   /*  filled by driver */
>
>             @@ -140,6 +144,13 @@ struct atom_context {
>
>                   uint32_t *scratch;
>
>                   int scratch_size_bytes;
>
>                   char vbios_version[20];
>
>             +
>
>             +    uint8_t name[STRLEN_LONG];
>
>             +    uint8_t vbios_pn[STRLEN_LONG];
>
>             +    uint32_t version;
>
>             +    uint8_t date[STRLEN_NORMAL];
>
>             +    uint32_t sub_dev_id;
>
>             +    uint32_t sub_ved_id;
>
>             };
>
>               
>
>             extern int amdgpu_atom_debug;
>
>             diff --git a/drivers/gpu/drm/amd/include/atomfirmware.h b/drivers/gpu/drm/amd/include/atomfirmware.h
>
>             index c77ed38c20fb..3a8e404099b0 100644
>
>             --- a/drivers/gpu/drm/amd/include/atomfirmware.h
>
>             +++ b/drivers/gpu/drm/amd/include/atomfirmware.h
>
>             @@ -197,6 +197,8 @@ enum atom_dp_vs_preemph_def{
>
>               DP_VS_LEVEL0_PREEMPH_LEVEL3 = 0x18,
>
>             };
>
>               
>
>             +#define BIOS_ATOM_PREFIX   "ATOMBIOS"
>
>             +#define BIOS_STRING_LENGTH 43
>
>               
>
>             /*
>
>             enum atom_string_def{
>
>             @@ -209,12 +211,14 @@ atom_bios_string          = "ATOM"
>
>             #pragma pack(1)                          /* BIOS data must use byte aligment*/
>
>               
>
>             enum atombios_image_offset{
>
>             -OFFSET_TO_ATOM_ROM_HEADER_POINTER          =0x00000048,
>
>             -OFFSET_TO_ATOM_ROM_IMAGE_SIZE              =0x00000002,
>
>             -OFFSET_TO_ATOMBIOS_ASIC_BUS_MEM_TYPE       =0x94,
>
>             -MAXSIZE_OF_ATOMBIOS_ASIC_BUS_MEM_TYPE      =20,  /*including the terminator 0x0!*/
>
>             -OFFSET_TO_GET_ATOMBIOS_NUMBER_OF_STRINGS   =0x2f,
>
>             -OFFSET_TO_GET_ATOMBIOS_STRING_START        =0x6e,
>
>             +  OFFSET_TO_ATOM_ROM_HEADER_POINTER          = 0x00000048,
>
>             +  OFFSET_TO_ATOM_ROM_IMAGE_SIZE              = 0x00000002,
>
>             +  OFFSET_TO_ATOMBIOS_ASIC_BUS_MEM_TYPE       = 0x94,
>
>             +  MAXSIZE_OF_ATOMBIOS_ASIC_BUS_MEM_TYPE      = 20,  /*including the terminator 0x0!*/
>
>             +  OFFSET_TO_GET_ATOMBIOS_NUMBER_OF_STRINGS   = 0x2f,
>
>             +  OFFSET_TO_GET_ATOMBIOS_STRING_START        = 0x6e,
>
>             +  OFFSET_TO_VBIOS_PART_NUMBER                = 0x80,
>
>             +  OFFSET_TO_VBIOS_DATE                       = 0x50,
>
>             };
>
>               
>
>             /****************************************************************************
>
>             diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdgpu_drm.h
>
>             index 8b832f7458f2..77980445d486 100644
>
>             --- a/include/uapi/drm/amdgpu_drm.h
>
>             +++ b/include/uapi/drm/amdgpu_drm.h
>
>             @@ -758,6 +758,8 @@ struct drm_amdgpu_cs_chunk_data {
>
>                   #define AMDGPU_INFO_VBIOS_SIZE             0x1
>
>                   /* Subquery id: Query vbios image */
>
>                   #define AMDGPU_INFO_VBIOS_IMAGE            0x2
>
>             +    /* Subquery id: Query vbios info */
>
>             +    #define AMDGPU_INFO_VBIOS_INFO             0x3
>
>             /* Query UVD handles */
>
>             #define AMDGPU_INFO_NUM_HANDLES                    0x1C
>
>             /* Query sensor related information */
>
>             @@ -951,6 +953,19 @@ struct drm_amdgpu_info_firmware {
>
>                   __u32 feature;
>
>             };
>
>               
>
>             +struct drm_amdgpu_info_vbios {
>
>             +    __u8 name[64];
>
>             +    __u32 dbdf;
>
>             +    __u8 vbios_pn[64];
>
>             +    __u32 version;
>
>             +    __u8 date[32];
>
>             +    __u8 serial[16];
>
>             +    __u32 dev_id;
>
>             +    __u32 rev_id;
>
>             +    __u32 sub_dev_id;
>
>             +    __u32 sub_ved_id;
>
>             +};
>
>             +
>
>             #define AMDGPU_VRAM_TYPE_UNKNOWN 0
>
>             #define AMDGPU_VRAM_TYPE_GDDR1 1
>
>             #define AMDGPU_VRAM_TYPE_DDR2  2
>
>             -- 
>
>             2.17.1
>
>               
>
>           
>
>       
>
>     _______________________________________________
>
>     amd-gfx mailing list
>
>     amd-gfx@lists.freedesktop.org  <mailto:amd-gfx@lists.freedesktop.org>
>
>     https://lists.freedesktop.org/mailman/listinfo/amd-gfx  <https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&data=04%7C01%7CEmily.Deng%40amd.com%7C5e5aa67d19d34c7ee2a308d90607750b%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637547451371298928%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=vl58TNW%2FAeEe2AvJVH7ayDOjKxVjLzxT58wp1724YNo%3D&reserved=0>
>


--------------5DDBBD388BB0C050845652D7
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    Well displaying the VBIOS information along with the other firmware
    in userspace is certainly useful.<br>
    <br>
    We should just avoid making strong dependencies on that.<br>
    <br>
    Firmware and VBIOS must always be backward compatible and the driver
    must always work with any released firmware and VBIOS combination.<br>
    <br>
    What we can do is to display a warning when we detect and/or
    old/buggy firmware.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <div class="moz-cite-prefix">Am 28.04.21 um 08:47 schrieb Nieto,
      David M:<br>
    </div>
    <blockquote type="cite"
      cite="mid:0C1CB3BD-37DD-4F05-9E6E-2DED8A6CD44B@amd.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta name="Generator" content="Microsoft Word 15 (filtered
        medium)">
      <style>@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}pre
	{mso-style-priority:99;
	mso-style-link:"HTML Preformatted Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:10.0pt;
	font-family:"Courier New";}p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:Consolas;}p.msipheader4d111418, li.msipheader4d111418, div.msipheader4d111418
	{mso-style-name:msipheader4d111418;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}span.EmailStyle21
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}span.EmailStyle22
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}div.WordSection1
	{page:WordSection1;}</style>
      <div class="WordSection1">
        <p class="MsoNormal">Besides system management, it provides
          parseable details on the VBIOS version and information. This
          is useful renderer information as the GPU behavior depends not
          only on the driver version but also on the firmwares running
          on the GPU.<o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal">The AMDGPU_INFO ioctl contains a method to
          get the versions of the ucode for all the IPs, but for VBIOS,
          only a way to dump the entire image is provided. While it Is
          possible to implement the whole logic of VBIOS parsing on
          userspace, it requires the application to have details on the
          header and table formats to parse the data. Moreover there is
          no guarantee that the format and header locations will remain
          constant across ASIC generations, so the maintainance cost and
          complexity seems unreasonable.<o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal">Providing a simple, and stable interface to
          the application seems to us like a sensible choice.<o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <p class="MsoNormal">Thanks,<o:p></o:p></p>
        <p class="MsoNormal">David<o:p></o:p></p>
        <p class="MsoNormal"><o:p> </o:p></p>
        <div style="border:none;border-top:solid #B5C4DF
          1.0pt;padding:3.0pt 0in 0in 0in">
          <p class="MsoNormal"><b><span
                style="font-size:12.0pt;color:black">From: </span></b><span
              style="font-size:12.0pt;color:black">amd-gfx
              <a class="moz-txt-link-rfc2396E" href="mailto:amd-gfx-bounces@lists.freedesktop.org">&lt;amd-gfx-bounces@lists.freedesktop.org&gt;</a> on behalf of
              "Gu, JiaWei (Will)" <a class="moz-txt-link-rfc2396E" href="mailto:JiaWei.Gu@amd.com">&lt;JiaWei.Gu@amd.com&gt;</a><br>
              <b>Date: </b>Thursday, April 22, 2021 at 8:25 PM<br>
              <b>To: </b>Christian König
              <a class="moz-txt-link-rfc2396E" href="mailto:ckoenig.leichtzumerken@gmail.com">&lt;ckoenig.leichtzumerken@gmail.com&gt;</a>,
              <a class="moz-txt-link-rfc2396E" href="mailto:amd-gfx@lists.freedesktop.org">"amd-gfx@lists.freedesktop.org"</a>
              <a class="moz-txt-link-rfc2396E" href="mailto:amd-gfx@lists.freedesktop.org">&lt;amd-gfx@lists.freedesktop.org&gt;</a><br>
              <b>Cc: </b>"Deucher, Alexander"
              <a class="moz-txt-link-rfc2396E" href="mailto:Alexander.Deucher@amd.com">&lt;Alexander.Deucher@amd.com&gt;</a>, "StDenis, Tom"
              <a class="moz-txt-link-rfc2396E" href="mailto:Tom.StDenis@amd.com">&lt;Tom.StDenis@amd.com&gt;</a>, "Nieto, David M"
              <a class="moz-txt-link-rfc2396E" href="mailto:David.Nieto@amd.com">&lt;David.Nieto@amd.com&gt;</a><br>
              <b>Subject: </b>RE: [PATCH] drm/amdgpu: Add vbios info
              ioctl interface<o:p></o:p></span></p>
        </div>
        <div>
          <p class="MsoNormal"><o:p> </o:p></p>
        </div>
        <p class="msipheader4d111418"
          style="margin:0in;margin-bottom:.0001pt"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:#0078D7">[AMD
            Official Use Only - Internal Distribution Only]</span><o:p></o:p></p>
        <p class="MsoNormal"> <o:p></o:p></p>
        <p class="MsoNormal">Hi Christian,<o:p></o:p></p>
        <p class="MsoNormal">It will be used by a user space SMI-lib for
          GPU status query.<o:p></o:p></p>
        <p class="MsoNormal"> <o:p></o:p></p>
        <p class="MsoNormal">Hi David, please feel free to correct my
          statement since I’m not sure I have a view of whole picture.<o:p></o:p></p>
        <p class="MsoNormal"> <o:p></o:p></p>
        <p class="MsoNormal">Thanks,<o:p></o:p></p>
        <p class="MsoNormal">Jiawei<o:p></o:p></p>
        <p class="MsoNormal"> <o:p></o:p></p>
        <div>
          <div style="border:none;border-top:solid #E1E1E1
            1.0pt;padding:3.0pt 0in 0in 0in">
            <p class="MsoNormal"><b>From:</b> Christian König
              <a class="moz-txt-link-rfc2396E" href="mailto:ckoenig.leichtzumerken@gmail.com">&lt;ckoenig.leichtzumerken@gmail.com&gt;</a>
              <br>
              <b>Sent:</b> Thursday, April 22, 2021 9:27 PM<br>
              <b>To:</b> Gu, JiaWei (Will) <a class="moz-txt-link-rfc2396E" href="mailto:JiaWei.Gu@amd.com">&lt;JiaWei.Gu@amd.com&gt;</a>;
              <a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a><br>
              <b>Cc:</b> Deucher, Alexander
              <a class="moz-txt-link-rfc2396E" href="mailto:Alexander.Deucher@amd.com">&lt;Alexander.Deucher@amd.com&gt;</a>; StDenis, Tom
              <a class="moz-txt-link-rfc2396E" href="mailto:Tom.StDenis@amd.com">&lt;Tom.StDenis@amd.com&gt;</a><br>
              <b>Subject:</b> Re: [PATCH] drm/amdgpu: Add vbios info
              ioctl interface<o:p></o:p></p>
          </div>
        </div>
        <p class="MsoNormal"> <o:p></o:p></p>
        <p class="MsoNormal" style="margin-bottom:12.0pt">Is that useful
          to Vulkan/OpenGL/other clients in any way?<br>
          <br>
          Christian.<o:p></o:p></p>
        <div>
          <p class="MsoNormal">Am 22.04.21 um 15:18 schrieb Gu, JiaWei
            (Will):<o:p></o:p></p>
        </div>
        <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
          <pre> <o:p></o:p></pre>
          <pre>CC Tom.<o:p></o:p></pre>
          <pre> <o:p></o:p></pre>
          <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
            <pre>On Apr 22, 2021, at 21:09, Gu, JiaWei (Will) <a href="mailto:JiaWei.Gu@amd.com" moz-do-not-send="true">&lt;JiaWei.Gu@amd.com&gt;</a> wrote:<o:p></o:p></pre>
            <pre> <o:p></o:p></pre>
            <pre>&lt;[v2][umr]add-vbios-info-query.patch&gt;<o:p></o:p></pre>
            <pre>UMR patch which calls this new IOCTL attached.<o:p></o:p></pre>
            <pre> <o:p></o:p></pre>
            <pre>Best regards,<o:p></o:p></pre>
            <pre>Jiawei<o:p></o:p></pre>
            <pre> <o:p></o:p></pre>
            <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
              <pre>On Apr 22, 2021, at 10:34, Jiawei Gu <a href="mailto:JiaWei.Gu@amd.com" moz-do-not-send="true">&lt;JiaWei.Gu@amd.com&gt;</a> wrote:<o:p></o:p></pre>
              <pre> <o:p></o:p></pre>
              <pre>Add AMDGPU_INFO_VBIOS_INFO subquery id for detailed vbios info.<o:p></o:p></pre>
              <pre> <o:p></o:p></pre>
              <pre>Signed-off-by: Jiawei Gu <a href="mailto:Jiawei.Gu@amd.com" moz-do-not-send="true">&lt;Jiawei.Gu@amd.com&gt;</a><o:p></o:p></pre>
              <pre>---<o:p></o:p></pre>
              <pre>drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c    |  19 +++<o:p></o:p></pre>
              <pre>drivers/gpu/drm/amd/amdgpu/atom.c          | 158 +++++++++++++++++++++<o:p></o:p></pre>
              <pre>drivers/gpu/drm/amd/amdgpu/atom.h          |  11 ++<o:p></o:p></pre>
              <pre>drivers/gpu/drm/amd/include/atomfirmware.h |  16 ++-<o:p></o:p></pre>
              <pre>include/uapi/drm/amdgpu_drm.h              |  15 ++<o:p></o:p></pre>
              <pre>5 files changed, 213 insertions(+), 6 deletions(-)<o:p></o:p></pre>
              <pre> <o:p></o:p></pre>
              <pre>diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c<o:p></o:p></pre>
              <pre>index 39ee88d29cca..a20b016b05ab 100644<o:p></o:p></pre>
              <pre>--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c<o:p></o:p></pre>
              <pre>+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c<o:p></o:p></pre>
              <pre>@@ -861,6 +861,25 @@ int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)<o:p></o:p></pre>
              <pre>                                       min((size_t)size, (size_t)(bios_size - bios_offset)))<o:p></o:p></pre>
              <pre>                                   ? -EFAULT : 0;<o:p></o:p></pre>
              <pre>             }<o:p></o:p></pre>
              <pre>+            case AMDGPU_INFO_VBIOS_INFO: {<o:p></o:p></pre>
              <pre>+                   struct drm_amdgpu_info_vbios vbios_info = {};<o:p></o:p></pre>
              <pre>+                   struct atom_context *atom_context;<o:p></o:p></pre>
              <pre>+<o:p></o:p></pre>
              <pre>+                   atom_context = adev-&gt;mode_info.atom_context;<o:p></o:p></pre>
              <pre>+                 memcpy(vbios_info.name, atom_context-&gt;name, sizeof(atom_context-&gt;name));<o:p></o:p></pre>
              <pre>+                 vbios_info.dbdf = PCI_DEVID(adev-&gt;pdev-&gt;bus-&gt;number, adev-&gt;pdev-&gt;devfn);<o:p></o:p></pre>
              <pre>+                 memcpy(vbios_info.vbios_pn, atom_context-&gt;vbios_pn, sizeof(atom_context-&gt;vbios_pn));<o:p></o:p></pre>
              <pre>+                 vbios_info.version = atom_context-&gt;version;<o:p></o:p></pre>
              <pre>+                 memcpy(vbios_info.date, atom_context-&gt;date, sizeof(atom_context-&gt;date));<o:p></o:p></pre>
              <pre>+                 memcpy(vbios_info.serial, adev-&gt;serial, sizeof(adev-&gt;serial));<o:p></o:p></pre>
              <pre>+                 vbios_info.dev_id = adev-&gt;pdev-&gt;device;<o:p></o:p></pre>
              <pre>+                 vbios_info.rev_id = adev-&gt;pdev-&gt;revision;<o:p></o:p></pre>
              <pre>+                 vbios_info.sub_dev_id = atom_context-&gt;sub_dev_id;<o:p></o:p></pre>
              <pre>+                 vbios_info.sub_ved_id = atom_context-&gt;sub_ved_id;<o:p></o:p></pre>
              <pre>+<o:p></o:p></pre>
              <pre>+                   return copy_to_user(out, &amp;vbios_info,<o:p></o:p></pre>
              <pre>+                                  min((size_t)size, sizeof(vbios_info))) ? -EFAULT : 0;<o:p></o:p></pre>
              <pre>+            }<o:p></o:p></pre>
              <pre>             default:<o:p></o:p></pre>
              <pre>                  DRM_DEBUG_KMS("Invalid request %d\n",<o:p></o:p></pre>
              <pre>                            info-&gt;vbios_info.type);<o:p></o:p></pre>
              <pre>diff --git a/drivers/gpu/drm/amd/amdgpu/atom.c b/drivers/gpu/drm/amd/amdgpu/atom.c<o:p></o:p></pre>
              <pre>index 3dcb8b32f48b..0e2f0ea13b40 100644<o:p></o:p></pre>
              <pre>--- a/drivers/gpu/drm/amd/amdgpu/atom.c<o:p></o:p></pre>
              <pre>+++ b/drivers/gpu/drm/amd/amdgpu/atom.c<o:p></o:p></pre>
              <pre>@@ -31,6 +31,7 @@<o:p></o:p></pre>
              <pre> <o:p></o:p></pre>
              <pre>#define ATOM_DEBUG<o:p></o:p></pre>
              <pre> <o:p></o:p></pre>
              <pre>+#include "atomfirmware.h"<o:p></o:p></pre>
              <pre>#include "atom.h"<o:p></o:p></pre>
              <pre>#include "atom-names.h"<o:p></o:p></pre>
              <pre>#include "atom-bits.h"<o:p></o:p></pre>
              <pre>@@ -1299,12 +1300,153 @@ static void atom_index_iio(struct atom_context *ctx, int base)<o:p></o:p></pre>
              <pre>     }<o:p></o:p></pre>
              <pre>}<o:p></o:p></pre>
              <pre> <o:p></o:p></pre>
              <pre>+static void atom_get_vbios_name(struct atom_context *ctx)<o:p></o:p></pre>
              <pre>+{<o:p></o:p></pre>
              <pre>+    unsigned char *p_rom;<o:p></o:p></pre>
              <pre>+    unsigned char str_num;<o:p></o:p></pre>
              <pre>+    unsigned short off_to_vbios_str;<o:p></o:p></pre>
              <pre>+    unsigned char *c_ptr;<o:p></o:p></pre>
              <pre>+    int name_size;<o:p></o:p></pre>
              <pre>+    int i;<o:p></o:p></pre>
              <pre>+<o:p></o:p></pre>
              <pre>+    const char *na = "--N/A--";<o:p></o:p></pre>
              <pre>+    char *back;<o:p></o:p></pre>
              <pre>+<o:p></o:p></pre>
              <pre>+    p_rom = ctx-&gt;bios;<o:p></o:p></pre>
              <pre>+<o:p></o:p></pre>
              <pre>+    str_num = *(p_rom + OFFSET_TO_GET_ATOMBIOS_NUMBER_OF_STRINGS);<o:p></o:p></pre>
              <pre>+    if (str_num != 0) {<o:p></o:p></pre>
              <pre>+            off_to_vbios_str =<o:p></o:p></pre>
              <pre>+                   *(unsigned short *)(p_rom + OFFSET_TO_GET_ATOMBIOS_STRING_START);<o:p></o:p></pre>
              <pre>+<o:p></o:p></pre>
              <pre>+            c_ptr = (unsigned char *)(p_rom + off_to_vbios_str);<o:p></o:p></pre>
              <pre>+    } else {<o:p></o:p></pre>
              <pre>+            /* do not know where to find name */<o:p></o:p></pre>
              <pre>+            memcpy(ctx-&gt;name, na, 7);<o:p></o:p></pre>
              <pre>+            ctx-&gt;name[7] = 0;<o:p></o:p></pre>
              <pre>+            return;<o:p></o:p></pre>
              <pre>+    }<o:p></o:p></pre>
              <pre>+<o:p></o:p></pre>
              <pre>+    /*<o:p></o:p></pre>
              <pre>+     * skip the atombios strings, usually 4<o:p></o:p></pre>
              <pre>+     * 1st is P/N, 2nd is ASIC, 3rd is PCI type, 4th is Memory type<o:p></o:p></pre>
              <pre>+     */<o:p></o:p></pre>
              <pre>+    for (i = 0; i &lt; str_num; i++) {<o:p></o:p></pre>
              <pre>+            while (*c_ptr != 0)<o:p></o:p></pre>
              <pre>+                   c_ptr++;<o:p></o:p></pre>
              <pre>+            c_ptr++;<o:p></o:p></pre>
              <pre>+    }<o:p></o:p></pre>
              <pre>+<o:p></o:p></pre>
              <pre>+    /* skip the following 2 chars: 0x0D 0x0A */<o:p></o:p></pre>
              <pre>+    c_ptr += 2;<o:p></o:p></pre>
              <pre>+<o:p></o:p></pre>
              <pre>+    name_size = strnlen(c_ptr, STRLEN_LONG - 1);<o:p></o:p></pre>
              <pre>+    memcpy(ctx-&gt;name, c_ptr, name_size);<o:p></o:p></pre>
              <pre>+    back = ctx-&gt;name + name_size;<o:p></o:p></pre>
              <pre>+    while ((*--back) == ' ')<o:p></o:p></pre>
              <pre>+            ;<o:p></o:p></pre>
              <pre>+    *(back + 1) = '\0';<o:p></o:p></pre>
              <pre>+}<o:p></o:p></pre>
              <pre>+<o:p></o:p></pre>
              <pre>+static void atom_get_vbios_date(struct atom_context *ctx)<o:p></o:p></pre>
              <pre>+{<o:p></o:p></pre>
              <pre>+    unsigned char *p_rom;<o:p></o:p></pre>
              <pre>+    unsigned char *date_in_rom;<o:p></o:p></pre>
              <pre>+<o:p></o:p></pre>
              <pre>+    p_rom = ctx-&gt;bios;<o:p></o:p></pre>
              <pre>+<o:p></o:p></pre>
              <pre>+    date_in_rom = p_rom + OFFSET_TO_VBIOS_DATE;<o:p></o:p></pre>
              <pre>+<o:p></o:p></pre>
              <pre>+    ctx-&gt;date[0] = '2';<o:p></o:p></pre>
              <pre>+    ctx-&gt;date[1] = '0';<o:p></o:p></pre>
              <pre>+    ctx-&gt;date[2] = date_in_rom[6];<o:p></o:p></pre>
              <pre>+    ctx-&gt;date[3] = date_in_rom[7];<o:p></o:p></pre>
              <pre>+    ctx-&gt;date[4] = '/';<o:p></o:p></pre>
              <pre>+    ctx-&gt;date[5] = date_in_rom[0];<o:p></o:p></pre>
              <pre>+    ctx-&gt;date[6] = date_in_rom[1];<o:p></o:p></pre>
              <pre>+    ctx-&gt;date[7] = '/';<o:p></o:p></pre>
              <pre>+    ctx-&gt;date[8] = date_in_rom[3];<o:p></o:p></pre>
              <pre>+    ctx-&gt;date[9] = date_in_rom[4];<o:p></o:p></pre>
              <pre>+    ctx-&gt;date[10] = ' ';<o:p></o:p></pre>
              <pre>+    ctx-&gt;date[11] = date_in_rom[9];<o:p></o:p></pre>
              <pre>+    ctx-&gt;date[12] = date_in_rom[10];<o:p></o:p></pre>
              <pre>+    ctx-&gt;date[13] = date_in_rom[11];<o:p></o:p></pre>
              <pre>+    ctx-&gt;date[14] = date_in_rom[12];<o:p></o:p></pre>
              <pre>+    ctx-&gt;date[15] = date_in_rom[13];<o:p></o:p></pre>
              <pre>+    ctx-&gt;date[16] = '\0';<o:p></o:p></pre>
              <pre>+}<o:p></o:p></pre>
              <pre>+<o:p></o:p></pre>
              <pre>+static unsigned char *atom_find_str_in_rom(struct atom_context *ctx, char *str, int start,<o:p></o:p></pre>
              <pre>+                                     int end, int maxlen)<o:p></o:p></pre>
              <pre>+{<o:p></o:p></pre>
              <pre>+    unsigned long str_off;<o:p></o:p></pre>
              <pre>+    unsigned char *p_rom;<o:p></o:p></pre>
              <pre>+    unsigned short str_len;<o:p></o:p></pre>
              <pre>+<o:p></o:p></pre>
              <pre>+    str_off = 0;<o:p></o:p></pre>
              <pre>+    str_len = strnlen(str, maxlen);<o:p></o:p></pre>
              <pre>+    p_rom = ctx-&gt;bios;<o:p></o:p></pre>
              <pre>+<o:p></o:p></pre>
              <pre>+    for (; start &lt;= end; ++start) {<o:p></o:p></pre>
              <pre>+            for (str_off = 0; str_off &lt; str_len; ++str_off) {<o:p></o:p></pre>
              <pre>+                   if (str[str_off] != *(p_rom + start + str_off))<o:p></o:p></pre>
              <pre>+                        break;<o:p></o:p></pre>
              <pre>+            }<o:p></o:p></pre>
              <pre>+<o:p></o:p></pre>
              <pre>+            if (str_off == str_len || str[str_off] == 0)<o:p></o:p></pre>
              <pre>+                   return p_rom + start;<o:p></o:p></pre>
              <pre>+    }<o:p></o:p></pre>
              <pre>+    return NULL;<o:p></o:p></pre>
              <pre>+}<o:p></o:p></pre>
              <pre>+<o:p></o:p></pre>
              <pre>+static void atom_get_vbios_pn(struct atom_context *ctx)<o:p></o:p></pre>
              <pre>+{<o:p></o:p></pre>
              <pre>+    unsigned char *p_rom;<o:p></o:p></pre>
              <pre>+    unsigned short off_to_vbios_str;<o:p></o:p></pre>
              <pre>+    unsigned char *vbios_str;<o:p></o:p></pre>
              <pre>+    int count;<o:p></o:p></pre>
              <pre>+<o:p></o:p></pre>
              <pre>+    off_to_vbios_str = 0;<o:p></o:p></pre>
              <pre>+    p_rom = ctx-&gt;bios;<o:p></o:p></pre>
              <pre>+<o:p></o:p></pre>
              <pre>+    if (*(p_rom + OFFSET_TO_GET_ATOMBIOS_NUMBER_OF_STRINGS) != 0) {<o:p></o:p></pre>
              <pre>+            off_to_vbios_str =<o:p></o:p></pre>
              <pre>+                   *(unsigned short *)(p_rom + OFFSET_TO_GET_ATOMBIOS_STRING_START);<o:p></o:p></pre>
              <pre>+<o:p></o:p></pre>
              <pre>+            vbios_str = (unsigned char *)(p_rom + off_to_vbios_str);<o:p></o:p></pre>
              <pre>+    } else {<o:p></o:p></pre>
              <pre>+            vbios_str = p_rom + OFFSET_TO_VBIOS_PART_NUMBER;<o:p></o:p></pre>
              <pre>+    }<o:p></o:p></pre>
              <pre>+<o:p></o:p></pre>
              <pre>+    if (*vbios_str == 0) {<o:p></o:p></pre>
              <pre>+            vbios_str = atom_find_str_in_rom(ctx, BIOS_ATOM_PREFIX, 3, 1024, 64);<o:p></o:p></pre>
              <pre>+            if (vbios_str == NULL)<o:p></o:p></pre>
              <pre>+                   vbios_str += sizeof(BIOS_ATOM_PREFIX) - 1;<o:p></o:p></pre>
              <pre>+    }<o:p></o:p></pre>
              <pre>+    if (vbios_str != NULL &amp;&amp; *vbios_str == 0)<o:p></o:p></pre>
              <pre>+            vbios_str++;<o:p></o:p></pre>
              <pre>+<o:p></o:p></pre>
              <pre>+    if (vbios_str != NULL) {<o:p></o:p></pre>
              <pre>+            count = 0;<o:p></o:p></pre>
              <pre>+            while ((count &lt; BIOS_STRING_LENGTH) &amp;&amp; vbios_str[count] &gt;= ' ' &amp;&amp;<o:p></o:p></pre>
              <pre>+                   vbios_str[count] &lt;= 'z') {<o:p></o:p></pre>
              <pre>+                 ctx-&gt;vbios_pn[count] = vbios_str[count];<o:p></o:p></pre>
              <pre>+                   count++;<o:p></o:p></pre>
              <pre>+            }<o:p></o:p></pre>
              <pre>+<o:p></o:p></pre>
              <pre>+            ctx-&gt;vbios_pn[count] = 0;<o:p></o:p></pre>
              <pre>+    }<o:p></o:p></pre>
              <pre>+}<o:p></o:p></pre>
              <pre>+<o:p></o:p></pre>
              <pre>struct atom_context *amdgpu_atom_parse(struct card_info *card, void *bios)<o:p></o:p></pre>
              <pre>{<o:p></o:p></pre>
              <pre>     int base;<o:p></o:p></pre>
              <pre>     struct atom_context *ctx =<o:p></o:p></pre>
              <pre>         kzalloc(sizeof(struct atom_context), GFP_KERNEL);<o:p></o:p></pre>
              <pre>     char *str;<o:p></o:p></pre>
              <pre>+    struct _ATOM_ROM_HEADER *atom_rom_header;<o:p></o:p></pre>
              <pre>+    struct _ATOM_MASTER_DATA_TABLE *master_table;<o:p></o:p></pre>
              <pre>+    struct _ATOM_FIRMWARE_INFO *atom_fw_info;<o:p></o:p></pre>
              <pre>     u16 idx;<o:p></o:p></pre>
              <pre> <o:p></o:p></pre>
              <pre>     if (!ctx)<o:p></o:p></pre>
              <pre>@@ -1353,6 +1495,22 @@ struct atom_context *amdgpu_atom_parse(struct card_info *card, void *bios)<o:p></o:p></pre>
              <pre>          strlcpy(ctx-&gt;vbios_version, str, sizeof(ctx-&gt;vbios_version));<o:p></o:p></pre>
              <pre>     }<o:p></o:p></pre>
              <pre> <o:p></o:p></pre>
              <pre>+    atom_rom_header = (struct _ATOM_ROM_HEADER *)CSTR(base);<o:p></o:p></pre>
              <pre>+    ctx-&gt;sub_dev_id = atom_rom_header-&gt;usSubsystemVendorID;<o:p></o:p></pre>
              <pre>+    ctx-&gt;sub_ved_id = atom_rom_header-&gt;usSubsystemID;<o:p></o:p></pre>
              <pre>+    if (atom_rom_header-&gt;usMasterDataTableOffset != 0) {<o:p></o:p></pre>
              <pre>+            master_table = (struct _ATOM_MASTER_DATA_TABLE *)<o:p></o:p></pre>
              <pre>+                    CSTR(atom_rom_header-&gt;usMasterDataTableOffset);<o:p></o:p></pre>
              <pre>+            if (master_table-&gt;ListOfDataTables.FirmwareInfo != 0) {<o:p></o:p></pre>
              <pre>+                   atom_fw_info = (struct _ATOM_FIRMWARE_INFO *)<o:p></o:p></pre>
              <pre>+                           CSTR(master_table-&gt;ListOfDataTables.FirmwareInfo);<o:p></o:p></pre>
              <pre>+                   ctx-&gt;version = atom_fw_info-&gt;ulFirmwareRevision;<o:p></o:p></pre>
              <pre>+            }<o:p></o:p></pre>
              <pre>+    }<o:p></o:p></pre>
              <pre>+<o:p></o:p></pre>
              <pre>+    atom_get_vbios_name(ctx);<o:p></o:p></pre>
              <pre>+    atom_get_vbios_pn(ctx);<o:p></o:p></pre>
              <pre>+    atom_get_vbios_date(ctx);<o:p></o:p></pre>
              <pre> <o:p></o:p></pre>
              <pre>     return ctx;<o:p></o:p></pre>
              <pre>}<o:p></o:p></pre>
              <pre>diff --git a/drivers/gpu/drm/amd/amdgpu/atom.h b/drivers/gpu/drm/amd/amdgpu/atom.h<o:p></o:p></pre>
              <pre>index d279759cab47..c729f7ceba4f 100644<o:p></o:p></pre>
              <pre>--- a/drivers/gpu/drm/amd/amdgpu/atom.h<o:p></o:p></pre>
              <pre>+++ b/drivers/gpu/drm/amd/amdgpu/atom.h<o:p></o:p></pre>
              <pre>@@ -112,6 +112,10 @@ struct drm_device;<o:p></o:p></pre>
              <pre>#define ATOM_IO_SYSIO              2<o:p></o:p></pre>
              <pre>#define ATOM_IO_IIO         0x80<o:p></o:p></pre>
              <pre> <o:p></o:p></pre>
              <pre>+#define STRLEN_NORMAL             32<o:p></o:p></pre>
              <pre>+#define STRLEN_LONG        64<o:p></o:p></pre>
              <pre>+#define STRLEN_VERYLONG           254<o:p></o:p></pre>
              <pre>+<o:p></o:p></pre>
              <pre>struct card_info {<o:p></o:p></pre>
              <pre>     struct drm_device *dev;<o:p></o:p></pre>
              <pre>     void (* reg_write)(struct card_info *, uint32_t, uint32_t);   /*  filled by driver */<o:p></o:p></pre>
              <pre>@@ -140,6 +144,13 @@ struct atom_context {<o:p></o:p></pre>
              <pre>     uint32_t *scratch;<o:p></o:p></pre>
              <pre>     int scratch_size_bytes;<o:p></o:p></pre>
              <pre>     char vbios_version[20];<o:p></o:p></pre>
              <pre>+<o:p></o:p></pre>
              <pre>+    uint8_t name[STRLEN_LONG];<o:p></o:p></pre>
              <pre>+    uint8_t vbios_pn[STRLEN_LONG];<o:p></o:p></pre>
              <pre>+    uint32_t version;<o:p></o:p></pre>
              <pre>+    uint8_t date[STRLEN_NORMAL];<o:p></o:p></pre>
              <pre>+    uint32_t sub_dev_id;<o:p></o:p></pre>
              <pre>+    uint32_t sub_ved_id;<o:p></o:p></pre>
              <pre>};<o:p></o:p></pre>
              <pre> <o:p></o:p></pre>
              <pre>extern int amdgpu_atom_debug;<o:p></o:p></pre>
              <pre>diff --git a/drivers/gpu/drm/amd/include/atomfirmware.h b/drivers/gpu/drm/amd/include/atomfirmware.h<o:p></o:p></pre>
              <pre>index c77ed38c20fb..3a8e404099b0 100644<o:p></o:p></pre>
              <pre>--- a/drivers/gpu/drm/amd/include/atomfirmware.h<o:p></o:p></pre>
              <pre>+++ b/drivers/gpu/drm/amd/include/atomfirmware.h<o:p></o:p></pre>
              <pre>@@ -197,6 +197,8 @@ enum atom_dp_vs_preemph_def{<o:p></o:p></pre>
              <pre> DP_VS_LEVEL0_PREEMPH_LEVEL3 = 0x18,<o:p></o:p></pre>
              <pre>};<o:p></o:p></pre>
              <pre> <o:p></o:p></pre>
              <pre>+#define BIOS_ATOM_PREFIX   "ATOMBIOS"<o:p></o:p></pre>
              <pre>+#define BIOS_STRING_LENGTH 43<o:p></o:p></pre>
              <pre> <o:p></o:p></pre>
              <pre>/*<o:p></o:p></pre>
              <pre>enum atom_string_def{<o:p></o:p></pre>
              <pre>@@ -209,12 +211,14 @@ atom_bios_string          = "ATOM"<o:p></o:p></pre>
              <pre>#pragma pack(1)                          /* BIOS data must use byte aligment*/<o:p></o:p></pre>
              <pre> <o:p></o:p></pre>
              <pre>enum atombios_image_offset{<o:p></o:p></pre>
              <pre>-OFFSET_TO_ATOM_ROM_HEADER_POINTER          =0x00000048,<o:p></o:p></pre>
              <pre>-OFFSET_TO_ATOM_ROM_IMAGE_SIZE              =0x00000002,<o:p></o:p></pre>
              <pre>-OFFSET_TO_ATOMBIOS_ASIC_BUS_MEM_TYPE       =0x94,<o:p></o:p></pre>
              <pre>-MAXSIZE_OF_ATOMBIOS_ASIC_BUS_MEM_TYPE      =20,  /*including the terminator 0x0!*/<o:p></o:p></pre>
              <pre>-OFFSET_TO_GET_ATOMBIOS_NUMBER_OF_STRINGS   =0x2f,<o:p></o:p></pre>
              <pre>-OFFSET_TO_GET_ATOMBIOS_STRING_START        =0x6e,<o:p></o:p></pre>
              <pre>+  OFFSET_TO_ATOM_ROM_HEADER_POINTER          = 0x00000048,<o:p></o:p></pre>
              <pre>+  OFFSET_TO_ATOM_ROM_IMAGE_SIZE              = 0x00000002,<o:p></o:p></pre>
              <pre>+  OFFSET_TO_ATOMBIOS_ASIC_BUS_MEM_TYPE       = 0x94,<o:p></o:p></pre>
              <pre>+  MAXSIZE_OF_ATOMBIOS_ASIC_BUS_MEM_TYPE      = 20,  /*including the terminator 0x0!*/<o:p></o:p></pre>
              <pre>+  OFFSET_TO_GET_ATOMBIOS_NUMBER_OF_STRINGS   = 0x2f,<o:p></o:p></pre>
              <pre>+  OFFSET_TO_GET_ATOMBIOS_STRING_START        = 0x6e,<o:p></o:p></pre>
              <pre>+  OFFSET_TO_VBIOS_PART_NUMBER                = 0x80,<o:p></o:p></pre>
              <pre>+  OFFSET_TO_VBIOS_DATE                       = 0x50,<o:p></o:p></pre>
              <pre>};<o:p></o:p></pre>
              <pre> <o:p></o:p></pre>
              <pre>/****************************************************************************   <o:p></o:p></pre>
              <pre>diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdgpu_drm.h<o:p></o:p></pre>
              <pre>index 8b832f7458f2..77980445d486 100644<o:p></o:p></pre>
              <pre>--- a/include/uapi/drm/amdgpu_drm.h<o:p></o:p></pre>
              <pre>+++ b/include/uapi/drm/amdgpu_drm.h<o:p></o:p></pre>
              <pre>@@ -758,6 +758,8 @@ struct drm_amdgpu_cs_chunk_data {<o:p></o:p></pre>
              <pre>     #define AMDGPU_INFO_VBIOS_SIZE             0x1<o:p></o:p></pre>
              <pre>     /* Subquery id: Query vbios image */<o:p></o:p></pre>
              <pre>     #define AMDGPU_INFO_VBIOS_IMAGE            0x2<o:p></o:p></pre>
              <pre>+    /* Subquery id: Query vbios info */<o:p></o:p></pre>
              <pre>+    #define AMDGPU_INFO_VBIOS_INFO             0x3<o:p></o:p></pre>
              <pre>/* Query UVD handles */<o:p></o:p></pre>
              <pre>#define AMDGPU_INFO_NUM_HANDLES                    0x1C<o:p></o:p></pre>
              <pre>/* Query sensor related information */<o:p></o:p></pre>
              <pre>@@ -951,6 +953,19 @@ struct drm_amdgpu_info_firmware {<o:p></o:p></pre>
              <pre>     __u32 feature;<o:p></o:p></pre>
              <pre>};<o:p></o:p></pre>
              <pre> <o:p></o:p></pre>
              <pre>+struct drm_amdgpu_info_vbios {<o:p></o:p></pre>
              <pre>+    __u8 name[64];<o:p></o:p></pre>
              <pre>+    __u32 dbdf;<o:p></o:p></pre>
              <pre>+    __u8 vbios_pn[64];<o:p></o:p></pre>
              <pre>+    __u32 version;<o:p></o:p></pre>
              <pre>+    __u8 date[32];<o:p></o:p></pre>
              <pre>+    __u8 serial[16];<o:p></o:p></pre>
              <pre>+    __u32 dev_id;<o:p></o:p></pre>
              <pre>+    __u32 rev_id;<o:p></o:p></pre>
              <pre>+    __u32 sub_dev_id;<o:p></o:p></pre>
              <pre>+    __u32 sub_ved_id;<o:p></o:p></pre>
              <pre>+};<o:p></o:p></pre>
              <pre>+<o:p></o:p></pre>
              <pre>#define AMDGPU_VRAM_TYPE_UNKNOWN 0<o:p></o:p></pre>
              <pre>#define AMDGPU_VRAM_TYPE_GDDR1 1<o:p></o:p></pre>
              <pre>#define AMDGPU_VRAM_TYPE_DDR2  2<o:p></o:p></pre>
              <pre>-- <o:p></o:p></pre>
              <pre>2.17.1<o:p></o:p></pre>
              <pre> <o:p></o:p></pre>
            </blockquote>
            <pre> <o:p></o:p></pre>
          </blockquote>
          <pre> <o:p></o:p></pre>
          <p class="MsoNormal" style="margin-bottom:12.0pt"> <o:p></o:p></p>
          <pre>_______________________________________________<o:p></o:p></pre>
          <pre>amd-gfx mailing list<o:p></o:p></pre>
          <pre><a href="mailto:amd-gfx@lists.freedesktop.org" moz-do-not-send="true">amd-gfx@lists.freedesktop.org</a><o:p></o:p></pre>
          <pre><a href="https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=04%7C01%7CEmily.Deng%40amd.com%7C5e5aa67d19d34c7ee2a308d90607750b%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637547451371298928%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=vl58TNW%2FAeEe2AvJVH7ayDOjKxVjLzxT58wp1724YNo%3D&amp;reserved=0" moz-do-not-send="true">https://lists.freedesktop.org/mailman/listinfo/amd-gfx</a><o:p></o:p></pre>
        </blockquote>
        <p class="MsoNormal"> <o:p></o:p></p>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------5DDBBD388BB0C050845652D7--

--===============1282158499==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--===============1282158499==--
