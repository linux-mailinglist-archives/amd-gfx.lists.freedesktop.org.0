Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4vk/JF7ZPmpIMQkAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jun 2026 21:56:14 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A1D6CFEEF
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jun 2026 21:56:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Dkekvm9P;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20260327:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C5A810F710;
	Fri, 26 Jun 2026 19:56:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85D1D10F70E
 for <amd-gfx@lists.freedesktop.org>; Fri, 26 Jun 2026 19:56:11 +0000 (UTC)
Received: by mail-dl1-f51.google.com with SMTP id
 a92af1059eb24-137eb8e3491so97781c88.3
 for <amd-gfx@lists.freedesktop.org>; Fri, 26 Jun 2026 12:56:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782503771; cv=none;
 d=google.com; s=arc-20260327;
 b=miGBGGycYJUzNK0sufTJ3iDPwHk6LCFH3S0G36ErQCDs+imeD/Hdw78ZdvGK2Huoj3
 NXetZWnEAYeFBbNKJ9kX9yrchr3RuMd2c5ouVYn4orRyJC/LBUk9zhwdT2VI0+TDRsOJ
 ojBF2/kU5fcfC/gaDsOryvZ8Jh9QSAVDpu78t+DrzN+M9WddfuwE01OhHFClnswRTQh2
 3uFL/RzGYTgczY2inK4KoQNkuCmdRsleyIGA6Qte0QhWBH8qRiZAn0hjSZRn9IKafDAv
 869Va+en9KmWln/yXFn70E85ZbQn0XMF0mM/w0ts9f9dUfk1/s3c4zV/htO1ju4z58nE
 v/TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=sJ0bRQFmrXV02nza/52ulNaFUUJXNDnENX/m22gz2KM=;
 fh=advj4YxN8NmzRI1C4RdCPL3MlBHBQPZW0GAWMPKaSnc=;
 b=XnDvux4In5w4hBS1nCSBgamSQvKkXvhMtrPP0hZ70rJZeOtSpbgprckwRQc45Qdsxf
 8UB5UwK2+gNOPPGcT/J4kNVuoJFjbCJz9XpIGDTh2m8B3BtDCVA7lN1RuIK88ziCKZd9
 9dqR+fPlJFU/HR7vKd73H3LvGadqtfF73PbKHh9vd1S3jPFin57UA5sWRAVIfTjJKCDm
 Syd791MlXcyDYuJr4Mu/dx1iOuX3r41K0T6TGrPmEj7ceoX85bpZgldk0w+H9JzAhAmG
 4LbyHcRR8qI274HB5Dl3IJeN75CajfmTgtutZkJPusVxWmcJ9ygCmr4FsvhkalAbEtj3
 ObXw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782503771; x=1783108571; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=sJ0bRQFmrXV02nza/52ulNaFUUJXNDnENX/m22gz2KM=;
 b=Dkekvm9P1QlEc/AMEGheLkzFh9xCA5BYgnPFKxPYAHsPI/LKZStag1lpiR7TqxMrNO
 KqkeeaYe7lh+2l0P0/SDfH5QyRijOos7G1OuTZxuhOiZPjyqgrq7gl5CRC3ujFYVTEKH
 /H6Us0PwaSCBZrlpJ9l8p3uvKy/+GaZJ343FFgqCFtHF086TvZlJcP8yRVKEQG9/nq3g
 jadpox9mM1Pc3zoaN5dydmMUHlYiY3jtaXQuk9poyQeBxGGpYHCDmi7ts9F0lDLHZ5Xh
 B6WuxU2WjTUyvLxHPZOh/u2w1+Ywyf+dLp3mVxmR43sDzb+EeKT6z0tkpTiUIQZ9oJ2g
 dEPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782503771; x=1783108571;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=sJ0bRQFmrXV02nza/52ulNaFUUJXNDnENX/m22gz2KM=;
 b=UJ4HfE+KYtNmj0IAjU6DGrMnnMc1yFeGAt6XLVTHyABRScLWTWn4sXCNpsA98jDsud
 tl7y/RdsMc2bbrprwW7UGB5tbxbxovlSI7zN/hl7f6HqPbBMpw0xMaeH9VAzLyjPxdUA
 usIjfqvxCJsoWdfxzDupATvHBKQDRQnLb61FWDcCet7TIkonYpPnS3KYmasA67oHwCjW
 1kJWK8S77YouuhJz74ypnZ5197lfN3X/xCHLZzH2HsmdW94Z1XyzMN66bkZ5R9rgXmcU
 DE7mepCByKwaR8vNs8vyAFNXuDsESZ2Z+jlryN+eixjgYc8RC3Vqef3ObnMqpRLEuwDW
 a1mQ==
X-Gm-Message-State: AOJu0YzZTSLl2QjQSGN9udTfoEVEUGzISKdmFi2gkzB+4zT6fr1sh2bf
 XsQe6R2qTJ4hauODLeBu1RPnOFk1CEyUTSow/mM39KuvqHBQWRFVMzx6xcPTfCZcCw/YuJL639c
 hRPph2MtjeeaHeFNRNpRVKjvkJxV7VjGBTg==
X-Gm-Gg: AfdE7cltJq9Jo4PIdvYjQwyE5S0io8Z7d1WOxxN8Pm8//w1BIfq1Qv6jqcpEvA8w8sY
 h1Xv1oDrijx+iwgn2VqCxeMKq6eHT7Wkj36aiAtzz/CoWb0nn4a8Q3A8zrYA8qSDuPnq+aDg6NK
 fSxpEeHQL0B271l/vzr7ySRWxBl9AzR+KjPo4Um2tSHxdRgAiu/g5ANf7Ki6j8Yj5ZNGa15jCVt
 7ZYdv5sdn256XWRNtEx0XfECjrVHcwqdbL1Ew/jovrIe0FcnFgo4scd+K+kNm8HvwrhO1nQDyb6
 aTCQcEWtKlbtMGYo++hDvZWnCqOrYp9EelFivvPlfCdZD5q2sRYhaJZrvIE=
X-Received: by 2002:a05:7022:7a6:b0:139:a686:462a with SMTP id
 a92af1059eb24-139dbaa5c02mr2919350c88.4.1782503770772; Fri, 26 Jun 2026
 12:56:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260625141641.1826100-1-David.Francis@amd.com>
In-Reply-To: <20260625141641.1826100-1-David.Francis@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 26 Jun 2026 15:55:59 -0400
X-Gm-Features: AVVi8Ce471z52d_Xn6Q8rVIurCstLfulzS3LldLe06qy7Lm1Tsobs7LaAFgc3A0
Message-ID: <CADnq5_MFEEyitCw0XcR-c69cLB-9b-8Ma-Qbid_4C8wC=7QOHg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdkfd: Use kvmalloc_array to allocate arrays
To: David Francis <David.Francis@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20260327:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:David.Francis@amd.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E1A1D6CFEEF

On Thu, Jun 25, 2026 at 10:24=E2=80=AFAM David Francis <David.Francis@amd.c=
om> wrote:
>
> There were a few instances in kfd_chardev.c of kvzalloc being
> used to allocate memory for an array.
>
> Switch those to kvmalloc_array, which
> - is the standard way of doing this
> - does a check for the mul overflowing

I think kvcalloc() would be preferable as otherwise you lose the 0 init.

Alex

>
> Signed-off-by: David Francis <David.Francis@amd.com>
> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/a=
md/amdkfd/kfd_chardev.c
> index ab9e53dc8deb..dbfb574f4fed 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -1917,13 +1917,13 @@ static int criu_checkpoint_devices(struct kfd_pro=
cess *p,
>         struct kfd_criu_device_bucket *device_buckets =3D NULL;
>         int ret =3D 0, i;
>
> -       device_buckets =3D kvzalloc(num_devices * sizeof(*device_buckets)=
, GFP_KERNEL);
> +       device_buckets =3D kvmalloc_array(num_devices, sizeof(*device_buc=
kets), GFP_KERNEL);
>         if (!device_buckets) {
>                 ret =3D -ENOMEM;
>                 goto exit;
>         }
>
> -       device_priv =3D kvzalloc(num_devices * sizeof(*device_priv), GFP_=
KERNEL);
> +       device_priv =3D kvmalloc_array(num_devices, sizeof(*device_priv),=
 GFP_KERNEL);
>         if (!device_priv) {
>                 ret =3D -ENOMEM;
>                 goto exit;
> @@ -2043,17 +2043,17 @@ static int criu_checkpoint_bos(struct kfd_process=
 *p,
>         int ret =3D 0, pdd_index, bo_index =3D 0, id;
>         void *mem;
>
> -       bo_buckets =3D kvzalloc(num_bos * sizeof(*bo_buckets), GFP_KERNEL=
);
> +       bo_buckets =3D kvmalloc_array(num_bos, sizeof(*bo_buckets), GFP_K=
ERNEL);
>         if (!bo_buckets)
>                 return -ENOMEM;
>
> -       bo_privs =3D kvzalloc(num_bos * sizeof(*bo_privs), GFP_KERNEL);
> +       bo_privs =3D kvmalloc_array(num_bos, sizeof(*bo_privs), GFP_KERNE=
L);
>         if (!bo_privs) {
>                 ret =3D -ENOMEM;
>                 goto exit;
>         }
>
> -       files =3D kvzalloc(num_bos * sizeof(struct file *), GFP_KERNEL);
> +       files =3D kvmalloc_array(num_bos, sizeof(struct file *), GFP_KERN=
EL);
>         if (!files) {
>                 ret =3D -ENOMEM;
>                 goto exit;
> @@ -2584,7 +2584,7 @@ static int criu_restore_bos(struct kfd_process *p,
>         if (!bo_buckets)
>                 return -ENOMEM;
>
> -       files =3D kvzalloc(args->num_bos * sizeof(struct file *), GFP_KER=
NEL);
> +       files =3D kvmalloc_array(args->num_bos, sizeof(struct file *), GF=
P_KERNEL);
>         if (!files) {
>                 ret =3D -ENOMEM;
>                 goto exit;
> --
> 2.34.1
>
