Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B2E3A88F7
	for <lists+amd-gfx@lfdr.de>; Tue, 15 Jun 2021 20:55:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 562786E43D;
	Tue, 15 Jun 2021 18:55:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4E7E89C85
 for <amd-gfx@lists.freedesktop.org>; Tue, 15 Jun 2021 18:55:46 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 102-20020a9d0eef0000b02903fccc5b733fso15353584otj.4
 for <amd-gfx@lists.freedesktop.org>; Tue, 15 Jun 2021 11:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x9+/35J+RUpfwc+bz5tSQcHpzvl8u8ys0zMq+odXn3k=;
 b=e/JRGwNvIRRlA33ZPLtJ41dpy/FnLURCXtlZalPle6ZdDH4UEXFHsKQAcJYuDAe9Ye
 2i71EoRc/RcxXBJFEpJw3Ptb601/LDEu4R1Q2G1ZLwcej03o8tAAvTQ5IFWRgP0k8b4+
 fTyAQxnmP3jkQA2JsOGrNCsOi0EmPHrFq2KbPTumsPs8r6KBg8Yp49p8waM0E/5TlJpU
 erx7DPzL39dOtutKNpsIbOsSnjT3LnZMFcer2LPk49GNw2icRu6ew1TGDviaqeILmSi1
 ZqU3O9NgEgpyjdw4BiRotA9hwmB9nwXHy1Ah8PfV7K+mrtvbCUD4WEr7uXSuyOM0B8yl
 I0aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x9+/35J+RUpfwc+bz5tSQcHpzvl8u8ys0zMq+odXn3k=;
 b=TdU6lSQibbh1XGqGmoL2DM1c0ZUEqjEINfsHOduhn8Cs+3EFpjXTaTo4Edcgj69piZ
 5Hm8xesF6gnAdD+CbW9/DlRq5orKJHad6KutUtDg6QJw1iHo6g+lzoPjKCX2l6h/2Q7Q
 fK1MDHNc0vsitQdCC1EZoo+Ye8U2WC+GHo11MEyiEkkKiQOwxljf5nPrEnlUK8tuCeBU
 8XxL23I5DpQwvyphtG3Ed4Ie1C5UOfjgsyA01qlpdFXFybzflJrs6XWKID3u2RIaLc0o
 6AbPMEb/URoOY58zln36C3Wv/sQEB9Ul9YpHTVDh2tnHVkWeO5I/FpSUikUiARKcT1eQ
 4+cw==
X-Gm-Message-State: AOAM531PclH/J/mnO+g5PMjgTis3ymsUhN3hMVYOu/as+U9d3sgRPe+t
 aRtxj4GyxfnQWQe5zmBXSV3XIiPo7guKfEmc5wQ=
X-Google-Smtp-Source: ABdhPJwot5R5KbvOwntyr0pvNxuHu584wYfveZ0PlNhlljaRiKJETrNTu6JO+m5sxh10PMex4AbFjwpY8YTMPBQQuVs=
X-Received: by 2002:a05:6830:33ef:: with SMTP id
 i15mr533671otu.311.1623783345685; 
 Tue, 15 Jun 2021 11:55:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210614174632.20818-1-luben.tuikov@amd.com>
 <20210614174632.20818-37-luben.tuikov@amd.com>
In-Reply-To: <20210614174632.20818-37-luben.tuikov@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 15 Jun 2021 14:55:34 -0400
Message-ID: <CADnq5_MFMAea-TGx-AqU4TNNoaKdMf_+gC4WrisyDvPWY_9icA@mail.gmail.com>
Subject: Re: [PATCH 36/40] drm/amdgpu: Optimizations to EEPROM RAS table I/O
To: Luben Tuikov <luben.tuikov@amd.com>
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
Cc: Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Mon, Jun 14, 2021 at 1:47 PM Luben Tuikov <luben.tuikov@amd.com> wrote:
>
> Read and write the table in one go, then using a
> separate stage to decode or encode the data and
> reading/writing the table, as opposed to on the
> fly, which keeps the I2C bus busy. Use a single
> read/write to read/write the table or at most two
> if the number of records we're reading/writing
> wraps around.
>
> Check the check-sum of a table in EEPROM on init.
>
> When updating the table header signature, when the
> threshold was increased on boot, also update the
> check-sum at that time.
>
> Split functionality between read and write, which
> simplifies the code and exposes areas of
> optimization and complexity.

Is there a way to split this patch into several smaller patches?  It's
so big I'm having a hard time understanding them all in a single
context.

Alex

>
> Cc: Alexander Deucher <Alexander.Deucher@amd.com>
> Cc: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
> Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.c    |  20 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.h    |  23 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c       |  20 +-
>  .../gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c    | 903 +++++++++++-------
>  .../gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.h    |  53 +-
>  5 files changed, 655 insertions(+), 364 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.c
> index a4815af111ed12..4c3c65a5acae9b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.c
> @@ -176,8 +176,8 @@ static int __amdgpu_eeprom_xfer(struct i2c_adapter *i2c_adap, u32 eeprom_addr,
>   *
>   * Returns the number of bytes read/written; -errno on error.
>   */
> -int amdgpu_eeprom_xfer(struct i2c_adapter *i2c_adap, u32 eeprom_addr,
> -                      u8 *eeprom_buf, u16 buf_size, bool read)
> +static int amdgpu_eeprom_xfer(struct i2c_adapter *i2c_adap, u32 eeprom_addr,
> +                             u8 *eeprom_buf, u16 buf_size, bool read)
>  {
>         const struct i2c_adapter_quirks *quirks = i2c_adap->quirks;
>         u16 limit;
> @@ -221,3 +221,19 @@ int amdgpu_eeprom_xfer(struct i2c_adapter *i2c_adap, u32 eeprom_addr,
>                 return res;
>         }
>  }
> +
> +int amdgpu_eeprom_read(struct i2c_adapter *i2c_adap,
> +                      u32 eeprom_addr, u8 *eeprom_buf,
> +                      u16 bytes)
> +{
> +       return amdgpu_eeprom_xfer(i2c_adap, eeprom_addr, eeprom_buf, bytes,
> +                                 true);
> +}
> +
> +int amdgpu_eeprom_write(struct i2c_adapter *i2c_adap,
> +                       u32 eeprom_addr, u8 *eeprom_buf,
> +                       u16 bytes)
> +{
> +       return amdgpu_eeprom_xfer(i2c_adap, eeprom_addr, eeprom_buf, bytes,
> +                                 false);
> +}
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.h
> index 966b434f0de2b7..6935adb2be1f1c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_eeprom.h
> @@ -26,23 +26,12 @@
>
>  #include <linux/i2c.h>
>
> -int amdgpu_eeprom_xfer(struct i2c_adapter *i2c_adap, u32 eeprom_addr,
> -                      u8 *eeprom_buf, u16 bytes, bool read);
> +int amdgpu_eeprom_read(struct i2c_adapter *i2c_adap,
> +                      u32 eeprom_addr, u8 *eeprom_buf,
> +                      u16 bytes);
>
> -static inline int amdgpu_eeprom_read(struct i2c_adapter *i2c_adap,
> -                                    u32 eeprom_addr, u8 *eeprom_buf,
> -                                    u16 bytes)
> -{
> -       return amdgpu_eeprom_xfer(i2c_adap, eeprom_addr, eeprom_buf, bytes,
> -                                 true);
> -}
> -
> -static inline int amdgpu_eeprom_write(struct i2c_adapter *i2c_adap,
> -                                     u32 eeprom_addr, u8 *eeprom_buf,
> -                                     u16 bytes)
> -{
> -       return amdgpu_eeprom_xfer(i2c_adap, eeprom_addr, eeprom_buf, bytes,
> -                                 false);
> -}
> +int amdgpu_eeprom_write(struct i2c_adapter *i2c_adap,
> +                       u32 eeprom_addr, u8 *eeprom_buf,
> +                       u16 bytes);
>
>  #endif
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> index ecdf2d80eee8f0..37e52cf0ce1d92 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> @@ -451,7 +451,7 @@ static ssize_t amdgpu_ras_debugfs_eeprom_write(struct file *f,
>         ret = amdgpu_ras_eeprom_reset_table(
>                 &(amdgpu_ras_get_context(adev)->eeprom_control));
>
> -       if (ret > 0) {
> +       if (!ret) {
>                 /* Something was written to EEPROM.
>                  */
>                 amdgpu_ras_get_context(adev)->flags = RAS_DEFAULT_FLAGS;
> @@ -1818,12 +1818,12 @@ int amdgpu_ras_save_bad_pages(struct amdgpu_device *adev)
>
>         control = &con->eeprom_control;
>         data = con->eh_data;
> -       save_count = data->count - control->num_recs;
> +       save_count = data->count - control->ras_num_recs;
>         /* only new entries are saved */
>         if (save_count > 0) {
> -               if (amdgpu_ras_eeprom_write(control,
> -                                           &data->bps[control->num_recs],
> -                                           save_count)) {
> +               if (amdgpu_ras_eeprom_append(control,
> +                                            &data->bps[control->ras_num_recs],
> +                                            save_count)) {
>                         dev_err(adev->dev, "Failed to save EEPROM table data!");
>                         return -EIO;
>                 }
> @@ -1846,18 +1846,18 @@ static int amdgpu_ras_load_bad_pages(struct amdgpu_device *adev)
>         int ret;
>
>         /* no bad page record, skip eeprom access */
> -       if (control->num_recs == 0 || amdgpu_bad_page_threshold == 0)
> +       if (control->ras_num_recs == 0 || amdgpu_bad_page_threshold == 0)
>                 return 0;
>
> -       bps = kcalloc(control->num_recs, sizeof(*bps), GFP_KERNEL);
> +       bps = kcalloc(control->ras_num_recs, sizeof(*bps), GFP_KERNEL);
>         if (!bps)
>                 return -ENOMEM;
>
> -       ret = amdgpu_ras_eeprom_read(control, bps, control->num_recs);
> +       ret = amdgpu_ras_eeprom_read(control, bps, control->ras_num_recs);
>         if (ret)
>                 dev_err(adev->dev, "Failed to load EEPROM table records!");
>         else
> -               ret = amdgpu_ras_add_bad_pages(adev, bps, control->num_recs);
> +               ret = amdgpu_ras_add_bad_pages(adev, bps, control->ras_num_recs);
>
>         kfree(bps);
>         return ret;
> @@ -1974,7 +1974,7 @@ int amdgpu_ras_recovery_init(struct amdgpu_device *adev)
>         if (exc_err_limit || ret)
>                 goto free;
>
> -       if (con->eeprom_control.num_recs) {
> +       if (con->eeprom_control.ras_num_recs) {
>                 ret = amdgpu_ras_load_bad_pages(adev);
>                 if (ret)
>                         goto free;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c
> index 21e1e59e4857ff..dc4a845a32404c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c
> @@ -52,11 +52,27 @@
>
>  /* Assume 2-Mbit size EEPROM and take up the whole space. */
>  #define RAS_TBL_SIZE_BYTES      (256 * 1024)
> -#define RAS_HDR_START           0
> +#define RAS_TABLE_START         0
> +#define RAS_HDR_START           RAS_TABLE_START
>  #define RAS_RECORD_START        (RAS_HDR_START + RAS_TABLE_HEADER_SIZE)
>  #define RAS_MAX_RECORD_COUNT    ((RAS_TBL_SIZE_BYTES - RAS_TABLE_HEADER_SIZE) \
>                                  / RAS_TABLE_RECORD_SIZE)
>
> +/* Given a zero-based index of an EEPROM RAS record, yields the EEPROM
> + * offset off of RAS_TABLE_START.  That is, this is something you can
> + * add to control->i2c_address, and then tell I2C layer to read
> + * from/write to there. _N is the so called absolute index,
> + * because it starts right after the table header.
> + */
> +#define RAS_INDEX_TO_OFFSET(_C, _N) ((_C)->ras_record_offset + \
> +                                    (_N) * RAS_TABLE_RECORD_SIZE)
> +
> +#define RAS_OFFSET_TO_INDEX(_C, _O) (((_O) - \
> +                                     (_C)->ras_record_offset) / RAS_TABLE_RECORD_SIZE)
> +
> +#define RAS_NUM_RECS(_tbl_hdr)  (((_tbl_hdr)->tbl_size - \
> +                                 RAS_TABLE_HEADER_SIZE) / RAS_TABLE_RECORD_SIZE)
> +
>  #define to_amdgpu_device(x) (container_of(x, struct amdgpu_ras, eeprom_control))->adev
>
>  static bool __is_ras_eeprom_supported(struct amdgpu_device *adev)
> @@ -117,10 +133,11 @@ static bool __get_eeprom_i2c_addr(struct amdgpu_device *adev,
>         return true;
>  }
>
> -static void __encode_table_header_to_buff(struct amdgpu_ras_eeprom_table_header *hdr,
> -                                         unsigned char *buff)
> +static void
> +__encode_table_header_to_buf(struct amdgpu_ras_eeprom_table_header *hdr,
> +                            unsigned char *buf)
>  {
> -       uint32_t *pp = (uint32_t *) buff;
> +       u32 *pp = (uint32_t *)buf;
>
>         pp[0] = cpu_to_le32(hdr->header);
>         pp[1] = cpu_to_le32(hdr->version);
> @@ -129,10 +146,11 @@ static void __encode_table_header_to_buff(struct amdgpu_ras_eeprom_table_header
>         pp[4] = cpu_to_le32(hdr->checksum);
>  }
>
> -static void __decode_table_header_from_buff(struct amdgpu_ras_eeprom_table_header *hdr,
> -                                         unsigned char *buff)
> +static void
> +__decode_table_header_from_buf(struct amdgpu_ras_eeprom_table_header *hdr,
> +                              unsigned char *buf)
>  {
> -       uint32_t *pp = (uint32_t *)buff;
> +       u32 *pp = (uint32_t *)buf;
>
>         hdr->header           = le32_to_cpu(pp[0]);
>         hdr->version          = le32_to_cpu(pp[1]);
> @@ -141,276 +159,166 @@ static void __decode_table_header_from_buff(struct amdgpu_ras_eeprom_table_heade
>         hdr->checksum         = le32_to_cpu(pp[4]);
>  }
>
> -static int __write_table_header(struct amdgpu_ras_eeprom_control *control,
> -                               unsigned char *buff)
> +static int __write_table_header(struct amdgpu_ras_eeprom_control *control)
>  {
> -       int ret = 0;
> +       u8 buf[RAS_TABLE_HEADER_SIZE];
>         struct amdgpu_device *adev = to_amdgpu_device(control);
> +       int res;
>
> -       __encode_table_header_to_buff(&control->tbl_hdr, buff);
> +       memset(buf, 0, sizeof(buf));
> +       __encode_table_header_to_buf(&control->tbl_hdr, buf);
>
>         /* i2c may be unstable in gpu reset */
>         down_read(&adev->reset_sem);
> -       ret = amdgpu_eeprom_write(&adev->pm.smu_i2c,
> -                                 control->i2c_address + RAS_HDR_START,
> -                                 buff, RAS_TABLE_HEADER_SIZE);
> +       res = amdgpu_eeprom_write(&adev->pm.smu_i2c,
> +                                 control->i2c_address +
> +                                 control->ras_header_offset,
> +                                 buf, RAS_TABLE_HEADER_SIZE);
>         up_read(&adev->reset_sem);
>
> -       if (ret < 1)
> -               DRM_ERROR("Failed to write EEPROM table header, ret:%d", ret);
> +       if (res < 0) {
> +               DRM_ERROR("Failed to write EEPROM table header:%d", res);
> +       } else if (res < RAS_TABLE_HEADER_SIZE) {
> +               DRM_ERROR("Short write:%d out of %d\n",
> +                         res, RAS_TABLE_HEADER_SIZE);
> +               res = -EIO;
> +       } else {
> +               res = 0;
> +       }
>
> -       return ret;
> +       return res;
>  }
>
>  static u8 __calc_hdr_byte_sum(const struct amdgpu_ras_eeprom_control *control)
>  {
> -       int i;
> -       u8 hdr_sum = 0;
> -       u8  *p;
> +       int ii;
> +       u8  *pp, csum;
>         size_t sz;
>
>         /* Header checksum, skip checksum field in the calculation */
>         sz = sizeof(control->tbl_hdr) - sizeof(control->tbl_hdr.checksum);
> -       p = (u8 *) &control->tbl_hdr;
> -       for (i = 0; i < sz; i++, p++)
> -               hdr_sum += *p;
> -
> -       return hdr_sum;
> -}
> -
> -static u8 __calc_recs_byte_sum(const struct eeprom_table_record *record,
> -                              const int num)
> -{
> -       int i, j;
> -       u8  tbl_sum = 0;
> -
> -       if (!record)
> -               return 0;
> -
> -       /* Records checksum */
> -       for (i = 0; i < num; i++) {
> -               u8 *p = (u8 *) &record[i];
> -
> -               for (j = 0; j < sizeof(*record); j++, p++)
> -                       tbl_sum += *p;
> -       }
> -
> -       return tbl_sum;
> -}
> -
> -static inline u8
> -__calc_tbl_byte_sum(struct amdgpu_ras_eeprom_control *control,
> -                   struct eeprom_table_record *records, int num)
> -{
> -       return __calc_hdr_byte_sum(control) +
> -               __calc_recs_byte_sum(records, num);
> -}
> -
> -static void __update_tbl_checksum(struct amdgpu_ras_eeprom_control *control,
> -                                 struct eeprom_table_record *records, int num)
> -{
> -       u8 v;
> -
> -       control->tbl_byte_sum = __calc_tbl_byte_sum(control, records, num);
> -       /* Avoid 32-bit sign extension. */
> -       v = -control->tbl_byte_sum;
> -       control->tbl_hdr.checksum = v;
> -}
> -
> -static bool __verify_tbl_checksum(struct amdgpu_ras_eeprom_control *control,
> -                                 struct eeprom_table_record *records,
> -                                 int num)
> -{
> -       u8 result;
> -
> -       control->tbl_byte_sum = __calc_tbl_byte_sum(control, records, num);
> +       pp = (u8 *) &control->tbl_hdr;
> +       csum = 0;
> +       for (ii = 0; ii < sz; ii++, pp++)
> +               csum += *pp;
>
> -       result = (u8)control->tbl_hdr.checksum + control->tbl_byte_sum;
> -       if (result) {
> -               DRM_WARN("RAS table checksum mismatch: stored:0x%02X wants:0x%02hhX",
> -                        control->tbl_hdr.checksum,
> -                        -control->tbl_byte_sum);
> -               return false;
> -       }
> -
> -       return true;
> +       return csum;
>  }
>
>  static int amdgpu_ras_eeprom_correct_header_tag(
>         struct amdgpu_ras_eeprom_control *control,
>         uint32_t header)
>  {
> -       unsigned char buff[RAS_TABLE_HEADER_SIZE];
>         struct amdgpu_ras_eeprom_table_header *hdr = &control->tbl_hdr;
> -       int ret = 0;
> -
> -       memset(buff, 0, RAS_TABLE_HEADER_SIZE);
> -
> -       mutex_lock(&control->tbl_mutex);
> +       u8 *hh;
> +       int res;
> +       u8 csum;
> +
> +       csum = -hdr->checksum;
> +
> +       hh = (void *) &hdr->header;
> +       csum -= (hh[0] + hh[1] + hh[2] + hh[3]);
> +       hh = (void *) &header;
> +       csum += hh[0] + hh[1] + hh[2] + hh[3];
> +       csum = -csum;
> +       mutex_lock(&control->ras_tbl_mutex);
>         hdr->header = header;
> -       ret = __write_table_header(control, buff);
> -       mutex_unlock(&control->tbl_mutex);
> +       hdr->checksum = csum;
> +       res = __write_table_header(control);
> +       mutex_unlock(&control->ras_tbl_mutex);
>
> -       return ret;
> +       return res;
>  }
>
> +/**
> + * amdgpu_ras_eeprom_reset_table -- Reset the RAS EEPROM table
> + * @control: pointer to control structure
> + *
> + * Reset the contents of the header of the RAS EEPROM table.
> + * Return 0 on success, -errno on error.
> + */
>  int amdgpu_ras_eeprom_reset_table(struct amdgpu_ras_eeprom_control *control)
>  {
> -       unsigned char buff[RAS_TABLE_HEADER_SIZE] = { 0 };
>         struct amdgpu_ras_eeprom_table_header *hdr = &control->tbl_hdr;
> -       int ret = 0;
> +       u8 csum;
> +       int res;
>
> -       mutex_lock(&control->tbl_mutex);
> +       mutex_lock(&control->ras_tbl_mutex);
>
>         hdr->header = RAS_TABLE_HDR_VAL;
>         hdr->version = RAS_TABLE_VER;
>         hdr->first_rec_offset = RAS_RECORD_START;
>         hdr->tbl_size = RAS_TABLE_HEADER_SIZE;
>
> -       __update_tbl_checksum(control, NULL, 0);
> -       control->next_addr = RAS_RECORD_START;
> -       ret = __write_table_header(control, buff);
> +       csum = __calc_hdr_byte_sum(control);
> +       csum = -csum;
> +       hdr->checksum = csum;
> +       res = __write_table_header(control);
>
> -       mutex_unlock(&control->tbl_mutex);
> +       control->ras_num_recs = 0;
> +       control->ras_fri = 0;
>
> -       return ret;
> +       mutex_unlock(&control->ras_tbl_mutex);
>
> +       return res;
>  }
>
> -int amdgpu_ras_eeprom_init(struct amdgpu_ras_eeprom_control *control,
> -                          bool *exceed_err_limit)
> -{
> -       int ret = 0;
> -       struct amdgpu_device *adev = to_amdgpu_device(control);
> -       unsigned char buff[RAS_TABLE_HEADER_SIZE] = { 0 };
> -       struct amdgpu_ras_eeprom_table_header *hdr = &control->tbl_hdr;
> -       struct amdgpu_ras *ras = amdgpu_ras_get_context(adev);
> -
> -       *exceed_err_limit = false;
> -
> -       if (!__is_ras_eeprom_supported(adev))
> -               return 0;
> -
> -       /* Verify i2c adapter is initialized */
> -       if (!adev->pm.smu_i2c.algo)
> -               return -ENOENT;
> -
> -       if (!__get_eeprom_i2c_addr(adev, control))
> -               return -EINVAL;
> -
> -       mutex_init(&control->tbl_mutex);
> -
> -       /* Read/Create table header from EEPROM address 0 */
> -       ret = amdgpu_eeprom_read(&adev->pm.smu_i2c,
> -                                control->i2c_address + RAS_HDR_START,
> -                                buff, RAS_TABLE_HEADER_SIZE);
> -       if (ret < 1) {
> -               DRM_ERROR("Failed to read EEPROM table header, ret:%d", ret);
> -               return ret;
> -       }
> -
> -       __decode_table_header_from_buff(hdr, buff);
> -
> -       if (hdr->header == RAS_TABLE_HDR_VAL) {
> -               control->num_recs = (hdr->tbl_size - RAS_TABLE_HEADER_SIZE) /
> -                                   RAS_TABLE_RECORD_SIZE;
> -               control->tbl_byte_sum = __calc_hdr_byte_sum(control);
> -               control->next_addr = RAS_RECORD_START;
> -
> -               DRM_DEBUG_DRIVER("Found existing EEPROM table with %d records",
> -                                control->num_recs);
> -
> -       } else if ((hdr->header == RAS_TABLE_HDR_BAD) &&
> -                       (amdgpu_bad_page_threshold != 0)) {
> -               if (ras->bad_page_cnt_threshold > control->num_recs) {
> -                       dev_info(adev->dev, "Using one valid bigger bad page "
> -                               "threshold and correcting eeprom header tag.\n");
> -                       ret = amdgpu_ras_eeprom_correct_header_tag(control,
> -                                                       RAS_TABLE_HDR_VAL);
> -               } else {
> -                       *exceed_err_limit = true;
> -                       dev_err(adev->dev, "Exceeding the bad_page_threshold parameter, "
> -                               "disabling the GPU.\n");
> -               }
> -       } else {
> -               DRM_INFO("Creating new EEPROM table");
> -
> -               ret = amdgpu_ras_eeprom_reset_table(control);
> -       }
> -
> -       return ret > 0 ? 0 : -EIO;
> -}
> -
> -static void __encode_table_record_to_buff(struct amdgpu_ras_eeprom_control *control,
> -                                         struct eeprom_table_record *record,
> -                                         unsigned char *buff)
> +static void
> +__encode_table_record_to_buf(struct amdgpu_ras_eeprom_control *control,
> +                            struct eeprom_table_record *record,
> +                            unsigned char *buf)
>  {
>         __le64 tmp = 0;
>         int i = 0;
>
>         /* Next are all record fields according to EEPROM page spec in LE foramt */
> -       buff[i++] = record->err_type;
> +       buf[i++] = record->err_type;
>
> -       buff[i++] = record->bank;
> +       buf[i++] = record->bank;
>
>         tmp = cpu_to_le64(record->ts);
> -       memcpy(buff + i, &tmp, 8);
> +       memcpy(buf + i, &tmp, 8);
>         i += 8;
>
>         tmp = cpu_to_le64((record->offset & 0xffffffffffff));
> -       memcpy(buff + i, &tmp, 6);
> +       memcpy(buf + i, &tmp, 6);
>         i += 6;
>
> -       buff[i++] = record->mem_channel;
> -       buff[i++] = record->mcumc_id;
> +       buf[i++] = record->mem_channel;
> +       buf[i++] = record->mcumc_id;
>
>         tmp = cpu_to_le64((record->retired_page & 0xffffffffffff));
> -       memcpy(buff + i, &tmp, 6);
> +       memcpy(buf + i, &tmp, 6);
>  }
>
> -static void __decode_table_record_from_buff(struct amdgpu_ras_eeprom_control *control,
> -                                           struct eeprom_table_record *record,
> -                                           unsigned char *buff)
> +static void
> +__decode_table_record_from_buf(struct amdgpu_ras_eeprom_control *control,
> +                              struct eeprom_table_record *record,
> +                              unsigned char *buf)
>  {
>         __le64 tmp = 0;
>         int i =  0;
>
>         /* Next are all record fields according to EEPROM page spec in LE foramt */
> -       record->err_type = buff[i++];
> +       record->err_type = buf[i++];
>
> -       record->bank = buff[i++];
> +       record->bank = buf[i++];
>
> -       memcpy(&tmp, buff + i, 8);
> +       memcpy(&tmp, buf + i, 8);
>         record->ts = le64_to_cpu(tmp);
>         i += 8;
>
> -       memcpy(&tmp, buff + i, 6);
> +       memcpy(&tmp, buf + i, 6);
>         record->offset = (le64_to_cpu(tmp) & 0xffffffffffff);
>         i += 6;
>
> -       record->mem_channel = buff[i++];
> -       record->mcumc_id = buff[i++];
> +       record->mem_channel = buf[i++];
> +       record->mcumc_id = buf[i++];
>
> -       memcpy(&tmp, buff + i,  6);
> +       memcpy(&tmp, buf + i,  6);
>         record->retired_page = (le64_to_cpu(tmp) & 0xffffffffffff);
>  }
>
> -/*
> - * When reaching end of EEPROM memory jump back to 0 record address
> - */
> -static uint32_t __correct_eeprom_dest_address(uint32_t curr_address)
> -{
> -       u32 next_address = curr_address + RAS_TABLE_RECORD_SIZE;
> -
> -       /* When all EEPROM memory used jump back to 0 address */
> -       if (next_address >= RAS_TBL_SIZE_BYTES) {
> -               DRM_INFO("Reached end of EEPROM memory, wrap around to 0.");
> -               return RAS_RECORD_START;
> -       }
> -
> -       return curr_address;
> -}
> -
>  bool amdgpu_ras_eeprom_check_err_threshold(struct amdgpu_device *adev)
>  {
>         struct amdgpu_ras *con = amdgpu_ras_get_context(adev);
> @@ -427,145 +335,398 @@ bool amdgpu_ras_eeprom_check_err_threshold(struct amdgpu_device *adev)
>
>         if (con->eeprom_control.tbl_hdr.header == RAS_TABLE_HDR_BAD) {
>                 dev_warn(adev->dev, "This GPU is in BAD status.");
> -               dev_warn(adev->dev, "Please retire it or setting one bigger "
> -                               "threshold value when reloading driver.\n");
> +               dev_warn(adev->dev, "Please retire it or set a larger "
> +                        "threshold value when reloading driver.\n");
>                 return true;
>         }
>
>         return false;
>  }
>
> -static int amdgpu_ras_eeprom_xfer(struct amdgpu_ras_eeprom_control *control,
> -                                 struct eeprom_table_record *records,
> -                                 const u32 num, bool write)
> +/**
> + * __amdgpu_ras_eeprom_write -- write indexed from buffer to EEPROM
> + * @control: pointer to control structure
> + * @buf: pointer to buffer containing data to write
> + * @fri: start writing at this index
> + * @num: number of records to write
> + *
> + * The caller must hold the table mutex in @control.
> + * Return 0 on success, -errno otherwise.
> + */
> +static int __amdgpu_ras_eeprom_write(struct amdgpu_ras_eeprom_control *control,
> +                                    u8 *buf, const u32 fri, const u32 num)
>  {
> -       int i, ret = 0;
> -       unsigned char *buffs, *buff;
> -       struct eeprom_table_record *record;
>         struct amdgpu_device *adev = to_amdgpu_device(control);
> -       struct amdgpu_ras *ras = amdgpu_ras_get_context(adev);
> +       u32 buf_size;
> +       int res;
>
> -       if (!__is_ras_eeprom_supported(adev))
> -               return 0;
> +       /* i2c may be unstable in gpu reset */
> +       down_read(&adev->reset_sem);
> +       buf_size = num * RAS_TABLE_RECORD_SIZE;
> +       res = amdgpu_eeprom_write(&adev->pm.smu_i2c,
> +                                 control->i2c_address +
> +                                 RAS_INDEX_TO_OFFSET(control, fri),
> +                                 buf, buf_size);
> +       up_read(&adev->reset_sem);
> +       if (res < 0) {
> +               DRM_ERROR("Writing %d EEPROM table records error:%d",
> +                         num, res);
> +       } else if (res < buf_size) {
> +               /* Short write, return error.
> +                */
> +               DRM_ERROR("Wrote %d records out of %d",
> +                         res / RAS_TABLE_RECORD_SIZE, num);
> +               res = -EIO;
> +       } else {
> +               res = 0;
> +       }
> +
> +       return res;
> +}
> +
> +static int
> +amdgpu_ras_eeprom_append_table(struct amdgpu_ras_eeprom_control *control,
> +                              struct eeprom_table_record *record,
> +                              const u32 num)
> +{
> +       u32 a, b, i;
> +       u8 *buf, *pp;
> +       int res;
>
> -       buffs = kcalloc(num, RAS_TABLE_RECORD_SIZE, GFP_KERNEL);
> -       if (!buffs)
> +       buf = kcalloc(num, RAS_TABLE_RECORD_SIZE, GFP_KERNEL);
> +       if (!buf)
>                 return -ENOMEM;
>
> -       mutex_lock(&control->tbl_mutex);
> +       /* Encode all of them in one go.
> +        */
> +       pp = buf;
> +       for (i = 0; i < num; i++, pp += RAS_TABLE_RECORD_SIZE)
> +               __encode_table_record_to_buf(control, &record[i], pp);
> +
> +       /* a, first record index to write into.
> +        * b, last record index to write into.
> +        * a = first index to read (fri) + number of records in the table,
> +        * b = a + @num - 1.
> +        * Let N = control->ras_max_num_record_count, then we have,
> +        * case 0: 0 <= a <= b < N,
> +        *   just append @num records starting at a;
> +        * case 1: 0 <= a < N <= b,
> +        *   append (N - a) records starting at a, and
> +        *   append the remainder,  b % N + 1, starting at 0.
> +        * case 2: 0 <= fri < N <= a <= b, then modulo N we get two subcases,
> +        * case 2a: 0 <= a <= b < N
> +        *   append num records starting at a; and fix fri if b overwrote it,
> +        *   and since a <= b, if b overwrote it then a must've also,
> +        *   and if b didn't overwrite it, then a didn't also.
> +        * case 2b: 0 <= b < a < N
> +        *   write num records starting at a, which wraps around 0=N
> +        *   and overwrite fri unconditionally. Now from case 2a,
> +        *   this means that b eclipsed fri to overwrite it and wrap
> +        *   around 0 again, i.e. b = 2N+r pre modulo N, so we unconditionally
> +        *   set fri = b + 1 (mod N).
> +        * Now, since fri is updated in every case, except the trivial case 0,
> +        * the number of records present in the table after writing, is,
> +        * num_recs - 1 = b - fri (mod N), and we take the positive value,
> +        * by adding an arbitrary multiple of N before taking the modulo N
> +        * as shown below.
> +        */
> +       a = control->ras_fri + control->ras_num_recs;
> +       b = a + num  - 1;
> +       if (b < control->ras_max_record_count) {
> +               res = __amdgpu_ras_eeprom_write(control, buf, a, num);
> +       } else if (a < control->ras_max_record_count) {
> +               u32 g0, g1;
> +
> +               g0 = control->ras_max_record_count - a;
> +               g1 = b % control->ras_max_record_count + 1;
> +               res = __amdgpu_ras_eeprom_write(control, buf, a, g0);
> +               if (res)
> +                       goto Out;
> +               res = __amdgpu_ras_eeprom_write(control,
> +                                               buf + g0 * RAS_TABLE_RECORD_SIZE,
> +                                               0, g1);
> +               if (res)
> +                       goto Out;
> +               if (g1 > control->ras_fri)
> +                       control->ras_fri = g1 % control->ras_max_record_count;
> +       } else {
> +               a %= control->ras_max_record_count;
> +               b %= control->ras_max_record_count;
> +
> +               if (a <= b) {
> +                       /* Note that, b - a + 1 = num. */
> +                       res = __amdgpu_ras_eeprom_write(control, buf, a, num);
> +                       if (res)
> +                               goto Out;
> +                       if (b >= control->ras_fri)
> +                               control->ras_fri = (b + 1) % control->ras_max_record_count;
> +               } else {
> +                       u32 g0, g1;
> +
> +                       /* b < a, which means, we write from
> +                        * a to the end of the table, and from
> +                        * the start of the table to b.
> +                        */
> +                       g0 = control->ras_max_record_count - a;
> +                       g1 = b + 1;
> +                       res = __amdgpu_ras_eeprom_write(control, buf, a, g0);
> +                       if (res)
> +                               goto Out;
> +                       res = __amdgpu_ras_eeprom_write(control,
> +                                                       buf + g0 * RAS_TABLE_RECORD_SIZE,
> +                                                       0, g1);
> +                       if (res)
> +                               goto Out;
> +                       control->ras_fri = g1 % control->ras_max_record_count;
> +               }
> +       }
> +       control->ras_num_recs = 1 + (control->ras_max_record_count + b
> +                                    - control->ras_fri)
> +               % control->ras_max_record_count;
> +Out:
> +       kfree(buf);
> +       return res;
> +}
> +
> +static int
> +amdgpu_ras_eeprom_update_header(struct amdgpu_ras_eeprom_control *control)
> +{
> +       struct amdgpu_device *adev = to_amdgpu_device(control);
> +       struct amdgpu_ras *ras = amdgpu_ras_get_context(adev);
> +       u8 *buf, *pp, csum;
> +       u32 buf_size;
> +       int res;
>
> -       /*
> -        * If saved bad pages number exceeds the bad page threshold for
> -        * the whole VRAM, update table header to mark the BAD GPU tag
> -        * and schedule one ras recovery after eeprom write is done,
> -        * this can avoid the missing for latest records.
> -        *
> -        * This new header will be picked up and checked in the bootup
> -        * by ras recovery, which may break bootup process to notify
> -        * user this GPU is in bad state and to retire such GPU for
> -        * further check.
> +       /* Modify the header if it exceeds.
>          */
> -       if (write && (amdgpu_bad_page_threshold != 0) &&
> -               ((control->num_recs + num) >= ras->bad_page_cnt_threshold)) {
> +       if (amdgpu_bad_page_threshold != 0 &&
> +           control->ras_num_recs >= ras->bad_page_cnt_threshold) {
>                 dev_warn(adev->dev,
> -                       "Saved bad pages(%d) reaches threshold value(%d).\n",
> -                       control->num_recs + num, ras->bad_page_cnt_threshold);
> +                       "Saved bad pages %d reaches threshold value %d\n",
> +                       control->ras_num_recs, ras->bad_page_cnt_threshold);
>                 control->tbl_hdr.header = RAS_TABLE_HDR_BAD;
>         }
>
> -       /* In case of overflow just start from beginning to not lose newest records */
> -       if (write &&
> -           (control->next_addr +
> -            RAS_TABLE_RECORD_SIZE * num >= RAS_TBL_SIZE_BYTES))
> -               control->next_addr = RAS_RECORD_START;
> +       control->tbl_hdr.version = RAS_TABLE_VER;
> +       control->tbl_hdr.first_rec_offset = RAS_INDEX_TO_OFFSET(control, control->ras_fri);
> +       control->tbl_hdr.tbl_size = RAS_TABLE_HEADER_SIZE + control->ras_num_recs * RAS_TABLE_RECORD_SIZE;
> +       control->tbl_hdr.checksum = 0;
> +
> +       buf_size = control->ras_num_recs * RAS_TABLE_RECORD_SIZE;
> +       buf = kcalloc(control->ras_num_recs, RAS_TABLE_RECORD_SIZE, GFP_KERNEL);
> +       if (!buf) {
> +               DRM_ERROR("allocating memory for table of size %d bytes failed\n",
> +                         control->tbl_hdr.tbl_size);
> +               res = -ENOMEM;
> +               goto Out;
> +       }
>
> -       /*
> -        * TODO Currently makes EEPROM writes for each record, this creates
> -        * internal fragmentation. Optimized the code to do full page write of
> -        * 256b
> +       down_read(&adev->reset_sem);
> +       res = amdgpu_eeprom_read(&adev->pm.smu_i2c,
> +                                control->i2c_address +
> +                                control->ras_record_offset,
> +                                buf, buf_size);
> +       up_read(&adev->reset_sem);
> +       if (res < 0) {
> +               DRM_ERROR("EEPROM failed reading records:%d\n",
> +                         res);
> +               goto Out;
> +       } else if (res < buf_size) {
> +               DRM_ERROR("EEPROM read %d out of %d bytes\n",
> +                         res, buf_size);
> +               res = -EIO;
> +               goto Out;
> +       }
> +
> +       /* Recalc the checksum.
>          */
> -       for (i = 0; i < num; i++) {
> -               buff = &buffs[i * RAS_TABLE_RECORD_SIZE];
> -               record = &records[i];
> +       csum = 0;
> +       for (pp = buf; pp < buf + buf_size; pp++)
> +               csum += *pp;
> +
> +       csum += __calc_hdr_byte_sum(control);
> +       /* avoid sign extension when assigning to "checksum" */
> +       csum = -csum;
> +       control->tbl_hdr.checksum = csum;
> +       res = __write_table_header(control);
> +Out:
> +       kfree(buf);
> +       return res;
> +}
>
> -               control->next_addr = __correct_eeprom_dest_address(control->next_addr);
> +/**
> + * amdgpu_ras_eeprom_append -- append records to the EEPROM RAS table
> + * @control: pointer to control structure
> + * @record: array of records to append
> + * @num: number of records in @record array
> + *
> + * Append @num records to the table, calculate the checksum and write
> + * the table back to EEPROM. The maximum number of records that
> + * can be appended is between 1 and control->ras_max_record_count,
> + * regardless of how many records are already stored in the table.
> + *
> + * Return 0 on success or if EEPROM is not supported, -errno on error.
> + */
> +int amdgpu_ras_eeprom_append(struct amdgpu_ras_eeprom_control *control,
> +                            struct eeprom_table_record *record,
> +                            const u32 num)
> +{
> +       struct amdgpu_device *adev = to_amdgpu_device(control);
> +       int res;
>
> -               /* EEPROM table content is stored in LE format */
> -               if (write)
> -                       __encode_table_record_to_buff(control, record, buff);
> +       if (!__is_ras_eeprom_supported(adev))
> +               return 0;
>
> -               /* i2c may be unstable in gpu reset */
> -               down_read(&adev->reset_sem);
> -               ret = amdgpu_eeprom_xfer(&adev->pm.smu_i2c,
> -                                        control->i2c_address + control->next_addr,
> -                                        buff, RAS_TABLE_RECORD_SIZE, !write);
> -               up_read(&adev->reset_sem);
> +       if (num == 0) {
> +               DRM_ERROR("will not append 0 records\n");
> +               return -EINVAL;
> +       } else if (num > control->ras_max_record_count) {
> +               DRM_ERROR("cannot append %d records than the size of table %d\n",
> +                         num, control->ras_max_record_count);
> +               return -EINVAL;
> +       }
>
> -               if (ret < 1) {
> -                       DRM_ERROR("Failed to process EEPROM table records, ret:%d", ret);
> +       mutex_lock(&control->ras_tbl_mutex);
>
> -                       /* TODO Restore prev next EEPROM address ? */
> -                       goto free_buff;
> -               }
> -               /*
> -                * The destination EEPROM address might need to be corrected to account
> -                * for page or entire memory wrapping
> -                */
> -               control->next_addr += RAS_TABLE_RECORD_SIZE;
> -       }
> +       res = amdgpu_ras_eeprom_append_table(control, record, num);
> +       if (!res)
> +               res = amdgpu_ras_eeprom_update_header(control);
>
> -       if (!write) {
> -               for (i = 0; i < num; i++) {
> -                       buff = &buffs[i * RAS_TABLE_RECORD_SIZE];
> -                       record = &records[i];
> +       mutex_unlock(&control->ras_tbl_mutex);
> +       return res;
> +}
>
> -                       __decode_table_record_from_buff(control, record, buff);
> -               }
> -       }
> +/**
> + * __amdgpu_ras_eeprom_read -- read indexed from EEPROM into buffer
> + * @control: pointer to control structure
> + * @buf: pointer to buffer to read into
> + * @fri: first record index, start reading at this index, absolute index
> + * @num: number of records to read
> + *
> + * The caller must hold the table mutex in @control.
> + * Return 0 on success, -errno otherwise.
> + */
> +static int __amdgpu_ras_eeprom_read(struct amdgpu_ras_eeprom_control *control,
> +                                   u8 *buf, const u32 fri, const u32 num)
> +{
> +       struct amdgpu_device *adev = to_amdgpu_device(control);
> +       u32 buf_size;
> +       int res;
>
> -       if (write) {
> -               /*
> -                * Update table header with size and CRC and account for table
> -                * wrap around where the assumption is that we treat it as empty
> -                * table
> -                *
> -                * TODO - Check the assumption is correct
> +       /* i2c may be unstable in gpu reset */
> +       down_read(&adev->reset_sem);
> +       buf_size = num * RAS_TABLE_RECORD_SIZE;
> +       res = amdgpu_eeprom_read(&adev->pm.smu_i2c,
> +                                control->i2c_address +
> +                                RAS_INDEX_TO_OFFSET(control, fri),
> +                                buf, buf_size);
> +       up_read(&adev->reset_sem);
> +       if (res < 0) {
> +               DRM_ERROR("Reading %d EEPROM table records error:%d",
> +                         num, res);
> +       } else if (res < buf_size) {
> +               /* Short read, return error.
>                  */
> -               control->num_recs += num;
> -               control->num_recs %= RAS_MAX_RECORD_COUNT;
> -               control->tbl_hdr.tbl_size += RAS_TABLE_RECORD_SIZE * num;
> -               if (control->tbl_hdr.tbl_size > RAS_TBL_SIZE_BYTES)
> -                       control->tbl_hdr.tbl_size = RAS_TABLE_HEADER_SIZE +
> -                       control->num_recs * RAS_TABLE_RECORD_SIZE;
> -
> -               __update_tbl_checksum(control, records, num);
> -               __write_table_header(control, buffs);
> -       } else if (!__verify_tbl_checksum(control, records, num)) {
> -               DRM_WARN("EEPROM Table checksum mismatch!");
> -               /* TODO Uncomment when EEPROM read/write is relliable */
> -               /* ret = -EIO; */
> +               DRM_ERROR("Read %d records out of %d",
> +                         res / RAS_TABLE_RECORD_SIZE, num);
> +               res = -EIO;
> +       } else {
> +               res = 0;
>         }
>
> -free_buff:
> -       kfree(buffs);
> -
> -       mutex_unlock(&control->tbl_mutex);
> -
> -       return ret == num ? 0 : -EIO;
> +       return res;
>  }
>
> +/**
> + * amdgpu_ras_eeprom_read -- read EEPROM
> + * @control: pointer to control structure
> + * @record: array of records to read into
> + * @num: number of records in @record
> + *
> + * Reads num records from the RAS table in EEPROM and
> + * writes the data into @record array.
> + *
> + * Returns 0 on success, -errno on error.
> + */
>  int amdgpu_ras_eeprom_read(struct amdgpu_ras_eeprom_control *control,
> -                          struct eeprom_table_record *records,
> +                          struct eeprom_table_record *record,
>                            const u32 num)
>  {
> -       return amdgpu_ras_eeprom_xfer(control, records, num, false);
> -}
> +       struct amdgpu_device *adev = to_amdgpu_device(control);
> +       int i, res;
> +       u8 *buf, *pp;
> +       u32 g0, g1;
>
> -int amdgpu_ras_eeprom_write(struct amdgpu_ras_eeprom_control *control,
> -                           struct eeprom_table_record *records,
> -                           const u32 num)
> -{
> -       return amdgpu_ras_eeprom_xfer(control, records, num, true);
> +       if (!__is_ras_eeprom_supported(adev))
> +               return 0;
> +
> +       if (num == 0) {
> +               DRM_ERROR("will not read 0 records\n");
> +               return -EINVAL;
> +       } else if (num > control->ras_num_recs) {
> +               DRM_ERROR("too many records to read:%d available:%d\n",
> +                         num, control->ras_num_recs);
> +               return -EINVAL;
> +       }
> +
> +       buf = kcalloc(num, RAS_TABLE_RECORD_SIZE, GFP_KERNEL);
> +       if (!buf)
> +               return -ENOMEM;
> +
> +       /* Determine how many records to read, from the first record
> +        * index, fri, to the end of the table, and from the beginning
> +        * of the table, such that the total number of records is
> +        * @num, and we handle wrap around when fri > 0 and
> +        * fri + num > RAS_MAX_RECORD_COUNT.
> +        *
> +        * First we compute the index of the last element
> +        * which would be fetched from each region,
> +        * g0 is in [fri, fri + num - 1], and
> +        * g1 is in [0, RAS_MAX_RECORD_COUNT - 1].
> +        * Then, if g0 < RAS_MAX_RECORD_COUNT, the index of
> +        * the last element to fetch, we set g0 to _the number_
> +        * of elements to fetch, @num, since we know that the last
> +        * indexed to be fetched does not exceed the table.
> +        *
> +        * If, however, g0 >= RAS_MAX_RECORD_COUNT, then
> +        * we set g0 to the number of elements to read
> +        * until the end of the table, and g1 to the number of
> +        * elements to read from the beginning of the table.
> +        */
> +       g0 = control->ras_fri + num - 1;
> +       g1 = g0 % control->ras_max_record_count;
> +       if (g0 < control->ras_max_record_count) {
> +               g0 = num;
> +               g1 = 0;
> +       } else {
> +               g0 = control->ras_max_record_count - control->ras_fri;
> +               g1 += 1;
> +       }
> +
> +       mutex_lock(&control->ras_tbl_mutex);
> +       res = __amdgpu_ras_eeprom_read(control, buf, control->ras_fri, g0);
> +       if (res)
> +               goto Out;
> +       if (g1) {
> +               res = __amdgpu_ras_eeprom_read(control,
> +                                              buf + g0 * RAS_TABLE_RECORD_SIZE,
> +                                              0, g1);
> +               if (res)
> +                       goto Out;
> +       }
> +
> +       res = 0;
> +
> +       /* Read up everything? Then transform.
> +        */
> +       pp = buf;
> +       for (i = 0; i < num; i++, pp += RAS_TABLE_RECORD_SIZE)
> +               __decode_table_record_from_buf(control, &record[i], pp);
> +Out:
> +       kfree(buf);
> +       mutex_unlock(&control->ras_tbl_mutex);
> +
> +       return res;
>  }
>
>  inline uint32_t amdgpu_ras_eeprom_max_record_count(void)
> @@ -573,35 +734,131 @@ inline uint32_t amdgpu_ras_eeprom_max_record_count(void)
>         return RAS_MAX_RECORD_COUNT;
>  }
>
> -/* Used for testing if bugs encountered */
> -#if 0
> -void amdgpu_ras_eeprom_test(struct amdgpu_ras_eeprom_control *control)
> +/**
> + * __verify_ras_table_checksum -- verify the RAS EEPROM table checksum
> + * @control: pointer to control structure
> + *
> + * Check the checksum of the stored in EEPROM RAS table.
> + *
> + * Return 0 if the checksum is correct,
> + * positive if it is not correct, and
> + * -errno on I/O error.
> + */
> +static int __verify_ras_table_checksum(struct amdgpu_ras_eeprom_control *control)
>  {
> -       int i;
> -       struct eeprom_table_record *recs = kcalloc(1, sizeof(*recs), GFP_KERNEL);
> +       struct amdgpu_device *adev = to_amdgpu_device(control);
> +       int res;
> +       u8  csum, *buf, *pp;
> +       u32 buf_size;
> +
> +       buf_size = RAS_TABLE_HEADER_SIZE +
> +               control->ras_num_recs * RAS_TABLE_RECORD_SIZE;
> +       buf = kzalloc(buf_size, GFP_KERNEL);
> +       if (!buf) {
> +               DRM_ERROR("Out of memory checking RAS table checksum.\n");
> +               return -ENOMEM;
> +       }
>
> -       if (!recs)
> -               return;
> +       res = amdgpu_eeprom_read(&adev->pm.smu_i2c,
> +                                control->i2c_address +
> +                                control->ras_header_offset,
> +                                buf, buf_size);
> +       if (res < buf_size) {
> +               DRM_ERROR("Partial read for checksum, res:%d\n", res);
> +               /* On partial reads, return -EIO.
> +                */
> +               if (res >= 0)
> +                       res = -EIO;
> +               goto Out;
> +       }
> +
> +       csum = 0;
> +       for (pp = buf; pp < buf + buf_size; pp++)
> +               csum += *pp;
> +Out:
> +       kfree(buf);
> +       return res < 0 ? res : csum;
> +}
>
> -       for (i = 0; i < 1 ; i++) {
> -               recs[i].address = 0xdeadbeef;
> -               recs[i].retired_page = i;
> +int amdgpu_ras_eeprom_init(struct amdgpu_ras_eeprom_control *control,
> +                          bool *exceed_err_limit)
> +{
> +       struct amdgpu_device *adev = to_amdgpu_device(control);
> +       unsigned char buf[RAS_TABLE_HEADER_SIZE] = { 0 };
> +       struct amdgpu_ras_eeprom_table_header *hdr = &control->tbl_hdr;
> +       struct amdgpu_ras *ras = amdgpu_ras_get_context(adev);
> +       int res;
> +
> +       *exceed_err_limit = false;
> +
> +       if (!__is_ras_eeprom_supported(adev))
> +               return 0;
> +
> +       /* Verify i2c adapter is initialized */
> +       if (!adev->pm.smu_i2c.algo)
> +               return -ENOENT;
> +
> +       if (!__get_eeprom_i2c_addr(adev, control))
> +               return -EINVAL;
> +
> +       control->ras_header_offset = RAS_HDR_START;
> +       control->ras_record_offset = RAS_RECORD_START;
> +       control->ras_max_record_count  = RAS_MAX_RECORD_COUNT;
> +       mutex_init(&control->ras_tbl_mutex);
> +
> +       /* Read the table header from EEPROM address */
> +       res = amdgpu_eeprom_read(&adev->pm.smu_i2c,
> +                                control->i2c_address + control->ras_header_offset,
> +                                buf, RAS_TABLE_HEADER_SIZE);
> +       if (res < RAS_TABLE_HEADER_SIZE) {
> +               DRM_ERROR("Failed to read EEPROM table header, res:%d", res);
> +               return res >= 0 ? -EIO : res;
>         }
>
> -       if (!amdgpu_ras_eeprom_write(control, recs, 1)) {
> +       __decode_table_header_from_buf(hdr, buf);
>
> -               memset(recs, 0, sizeof(*recs) * 1);
> +       control->ras_num_recs = RAS_NUM_RECS(hdr);
> +       control->ras_fri = RAS_OFFSET_TO_INDEX(control, hdr->first_rec_offset);
>
> -               control->next_addr = RAS_RECORD_START;
> +       if (hdr->header == RAS_TABLE_HDR_VAL) {
> +               DRM_DEBUG_DRIVER("Found existing EEPROM table with %d records",
> +                                control->ras_num_recs);
> +               res = __verify_ras_table_checksum(control);
> +               if (res)
> +                       DRM_ERROR("RAS table incorrect checksum or error:%d\n",
> +                                 res);
> +       } else if (hdr->header == RAS_TABLE_HDR_BAD &&
> +                  amdgpu_bad_page_threshold != 0) {
> +               res = __verify_ras_table_checksum(control);
> +               if (res)
> +                       DRM_ERROR("RAS Table incorrect checksum or error:%d\n",
> +                                 res);
> +               if (ras->bad_page_cnt_threshold > control->ras_num_recs) {
> +                       /* This means that, the threshold was increased since
> +                        * the last time the system was booted, and now,
> +                        * ras->bad_page_cnt_threshold - control->num_recs > 0,
> +                        * so that at least one more record can be saved,
> +                        * before the page count threshold is reached.
> +                        */
> +                       dev_info(adev->dev,
> +                                "records:%d threshold:%d, resetting "
> +                                "RAS table header signature",
> +                                control->ras_num_recs,
> +                                ras->bad_page_cnt_threshold);
> +                       res = amdgpu_ras_eeprom_correct_header_tag(control,
> +                                                                  RAS_TABLE_HDR_VAL);
> +               } else {
> +                       *exceed_err_limit = true;
> +                       dev_err(adev->dev,
> +                               "RAS records:%d exceed threshold:%d, "
> +                               "maybe retire this GPU?",
> +                               control->ras_num_recs, ras->bad_page_cnt_threshold);
> +               }
> +       } else {
> +               DRM_INFO("Creating a new EEPROM table");
>
> -               if (!amdgpu_ras_eeprom_read(control, recs)) {
> -                       for (i = 0; i < 1; i++)
> -                               DRM_INFO("rec.address :0x%llx, rec.retired_page :%llu",
> -                                        recs[i].address, recs[i].retired_page);
> -               } else
> -                       DRM_ERROR("Failed in reading from table");
> +               res = amdgpu_ras_eeprom_reset_table(control);
> +       }
>
> -       } else
> -               DRM_ERROR("Failed in writing to table");
> +       return res < 0 ? res : 0;
>  }
> -#endif
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.h
> index 504729b8053759..edb0195ea2eb8c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.h
> @@ -28,7 +28,7 @@
>
>  struct amdgpu_device;
>
> -enum amdgpu_ras_eeprom_err_type{
> +enum amdgpu_ras_eeprom_err_type {
>         AMDGPU_RAS_EEPROM_ERR_PLACE_HOLDER,
>         AMDGPU_RAS_EEPROM_ERR_RECOVERABLE,
>         AMDGPU_RAS_EEPROM_ERR_NON_RECOVERABLE
> @@ -40,15 +40,45 @@ struct amdgpu_ras_eeprom_table_header {
>         uint32_t first_rec_offset;
>         uint32_t tbl_size;
>         uint32_t checksum;
> -}__attribute__((__packed__));
> +} __packed;
>
>  struct amdgpu_ras_eeprom_control {
>         struct amdgpu_ras_eeprom_table_header tbl_hdr;
> -       u32 i2c_address; /* Base I2C 19-bit memory address */
> -       uint32_t next_addr;
> -       unsigned int num_recs;
> -       struct mutex tbl_mutex;
> -       u8 tbl_byte_sum;
> +
> +       /* Base I2C EEPPROM 19-bit memory address,
> +        * where the table is located. For more information,
> +        * see top of amdgpu_eeprom.c.
> +        */
> +       u32 i2c_address;
> +
> +       /* The byte offset off of @i2c_address
> +        * where the table header is found,
> +        * and where the records start--always
> +        * right after the header.
> +        */
> +       u32 ras_header_offset;
> +       u32 ras_record_offset;
> +
> +       /* Number of records in the table.
> +        */
> +       u32 ras_num_recs;
> +
> +       /* First record index to read, 0-based.
> +        * Range is [0, num_recs-1]. This is
> +        * an absolute index, starting right after
> +        * the table header.
> +        */
> +       u32 ras_fri;
> +
> +       /* Maximum possible number of records
> +        * we could store, i.e. the maximum capacity
> +        * of the table.
> +        */
> +       u32 ras_max_record_count;
> +
> +       /* Protect table access via this mutex.
> +        */
> +       struct mutex ras_tbl_mutex;
>  };
>
>  /*
> @@ -77,7 +107,8 @@ struct eeprom_table_record {
>  }__attribute__((__packed__));
>
>  int amdgpu_ras_eeprom_init(struct amdgpu_ras_eeprom_control *control,
> -                       bool *exceed_err_limit);
> +                          bool *exceed_err_limit);
> +
>  int amdgpu_ras_eeprom_reset_table(struct amdgpu_ras_eeprom_control *control);
>
>  bool amdgpu_ras_eeprom_check_err_threshold(struct amdgpu_device *adev);
> @@ -85,11 +116,9 @@ bool amdgpu_ras_eeprom_check_err_threshold(struct amdgpu_device *adev);
>  int amdgpu_ras_eeprom_read(struct amdgpu_ras_eeprom_control *control,
>                            struct eeprom_table_record *records, const u32 num);
>
> -int amdgpu_ras_eeprom_write(struct amdgpu_ras_eeprom_control *control,
> -                           struct eeprom_table_record *records, const u32 num);
> +int amdgpu_ras_eeprom_append(struct amdgpu_ras_eeprom_control *control,
> +                            struct eeprom_table_record *records, const u32 num);
>
>  inline uint32_t amdgpu_ras_eeprom_max_record_count(void);
>
> -void amdgpu_ras_eeprom_test(struct amdgpu_ras_eeprom_control *control);
> -
>  #endif // _AMDGPU_RAS_EEPROM_H
> --
> 2.32.0
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
