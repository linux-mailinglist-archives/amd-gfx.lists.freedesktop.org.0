Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A3B38A930
	for <lists+amd-gfx@lfdr.de>; Thu, 20 May 2021 12:58:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F36FC6F3E4;
	Thu, 20 May 2021 10:58:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 211376F3E4
 for <amd-gfx@lists.freedesktop.org>; Thu, 20 May 2021 10:58:52 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id g7so6691482edm.4
 for <amd-gfx@lists.freedesktop.org>; Thu, 20 May 2021 03:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=JcZD09fRUBScWA71195NBvrSct9THMUa1jyZz/auBJU=;
 b=uX3OmkTVpb9yTqBdtSvjXSKy0vSxnaNJWUzIVi2DtGZ1lX4lZ9kxznQZ74nlwapi0o
 k3Py85R1dNm4CjgKGosShTHUOhCNpRkIBX0nrnrsroIJdlmXGIhELSHIzD7RIeZBv+KB
 fqp1n7F9+MXxIHjPgRAWZufb7Yh3dKMSgy7FMBku1yYrcTKIwWrC41ofM5sJ/nGVbUlh
 K33xyZiVw7sgAzRAq10rG4D9uAKIj6BXkB7QWttxPe3Cewu15sPBMlr7nmrao1mJ2q8+
 SwPrGZPr4A+aGxN1Id/1Jgr+THkALbViH/fWwf2Me937+YuhYmIDduWP9dR8hCSRNdwb
 urQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=JcZD09fRUBScWA71195NBvrSct9THMUa1jyZz/auBJU=;
 b=tEuprr7hP+bQVNhn/N6Ci2DFB4GeSuQoOkq8ytSXH0/0cNgpEgadyeCmLDcaV5m8Mn
 XzFz65BpYauHPg8JRelRBP7qMmCAUSEUg446DNn49c2IE6Y5ToJk+gbQBU1EiUEleoPV
 OZ5ZnQdS+TtVsmNcF/dKvGCwwRKv99OTlPnB+c0dl7qqk3jzKfQKZX2ItlE1+HF8BfYM
 /bMnY8GEPr2mov/oOGUJcyjke6fBnn/fu6Scc2QoRwfXymGJyMvd7APiYrHT9EJV4qPA
 gKaqDTRMGBepUNOZ09bPjfXSO0rg14XSNcVoNYwgzhvQjh1FSe/D4oG/VccdEDu12otR
 9QhQ==
X-Gm-Message-State: AOAM532QX24Ey3UWPUuKNda41CUda2MRbFXingI7Ny9TLGR8MRuJym+l
 IL5tU04uY9obThuLRAYqV5c=
X-Google-Smtp-Source: ABdhPJyj9u99Zcy2Jobcmp6BtKrI47UReXt/4Uz8k/ggFxIYnod/sNO5vc/wn0+dGtKEJ/IdSptctQ==
X-Received: by 2002:a05:6402:845:: with SMTP id b5mr4219189edz.9.1621508330678; 
 Thu, 20 May 2021 03:58:50 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:4635:589e:67a4:e02a?
 ([2a02:908:1252:fb60:4635:589e:67a4:e02a])
 by smtp.gmail.com with ESMTPSA id d17sm1170421ejp.90.2021.05.20.03.58.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 May 2021 03:58:49 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: Add vbios info ioctl interface
To: "Gu, JiaWei (Will)" <JiaWei.Gu@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Nieto, David M" <David.Nieto@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "maraeo@gmail.com" <maraeo@gmail.com>
References: <20210517120804.27052-1-Jiawei.Gu@amd.com>
 <CH0PR12MB5156D238E265426E504B791BF82D9@CH0PR12MB5156.namprd12.prod.outlook.com>
 <51161d6d-a6be-90f0-262d-5215402e25dd@amd.com>
 <CH0PR12MB515644C1FF56458EFCA4B0FBF82C9@CH0PR12MB5156.namprd12.prod.outlook.com>
 <BYAPR12MB2840E231B64B432D709A3B59F42C9@BYAPR12MB2840.namprd12.prod.outlook.com>
 <CH0PR12MB515657CAB5F1DF60A7E689C5F82C9@CH0PR12MB5156.namprd12.prod.outlook.com>
 <BYAPR12MB284005A19E99B1D7AC43ABE5F42C9@BYAPR12MB2840.namprd12.prod.outlook.com>
 <CH0PR12MB515686179ED43BB5CF71AC4AF82C9@CH0PR12MB5156.namprd12.prod.outlook.com>
 <MN2PR12MB4488EAC16AE52CD7160D53F5F72B9@MN2PR12MB4488.namprd12.prod.outlook.com>
 <a4e6d14a-56d6-a138-ef2c-7759822f577a@gmail.com>
 <CH0PR12MB51566149D050B5AEA7DED0A5F82A9@CH0PR12MB5156.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <7f538e1c-43ae-dc63-8b2b-9a47f9bce3fc@gmail.com>
Date: Thu, 20 May 2021 12:58:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CH0PR12MB51566149D050B5AEA7DED0A5F82A9@CH0PR12MB5156.namprd12.prod.outlook.com>
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
Cc: "Deng, Emily" <Emily.Deng@amd.com>
Content-Type: multipart/mixed; boundary="===============1801047705=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============1801047705==
Content-Type: multipart/alternative;
 boundary="------------9E3011F55D0CCC43B3B5EECE"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------9E3011F55D0CCC43B3B5EECE
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

Kudos should go to Nirmoy who mentioned that tool in one of our 
discussions. But, yeah it is rather useful :)

Regards,
Christian.

Am 20.05.21 um 03:30 schrieb Gu, JiaWei (Will):
>
> [AMD Official Use Only - Internal Distribution Only]
>
> Thanks Christian!
>
> Happy to learn new tricks.
>
> Best regards,
>
> Jiawei
>
> *From:* Christian K�nig <ckoenig.leichtzumerken@gmail.com>
> *Sent:* Wednesday, May 19, 2021 9:23 PM
> *To:* Deucher, Alexander <Alexander.Deucher@amd.com>; Gu, JiaWei 
> (Will) <JiaWei.Gu@amd.com>; Nieto, David M <David.Nieto@amd.com>; 
> Koenig, Christian <Christian.Koenig@amd.com>; 
> amd-gfx@lists.freedesktop.org; maraeo@gmail.com
> *Cc:* Deng, Emily <Emily.Deng@amd.com>
> *Subject:* Re: [PATCH] drm/amdgpu: Add vbios info ioctl interface
>
> Good point.
>
> If you want to double check the alignment you can use something like 
> "pahole drivers/gpu/drm/amd/amdgpu/amdgpu.ko -C drm_amdgpu_info_vbios" 
> after building the kernel module.
>
> Regards,
> Christian.
>
> Am 19.05.21 um 15:09 schrieb Deucher, Alexander:
>
>     [Public]
>
>     The structure is not 64 bit aligned.� I think you want something like:
>
>     > +struct drm_amdgpu_info_vbios {
>     > +���� __u8 name[64];
>     > +���� __u8 vbios_pn[64];
>     > +���� __u32 version;
>
>     > +���� __u32 pad;
>
>     > +���� __u8 vbios_ver_str[32];
>     > +���� __u8 date[32];
>     > +};
>
>     ------------------------------------------------------------------------
>
>     *From:*Gu, JiaWei (Will) <JiaWei.Gu@amd.com>
>     <mailto:JiaWei.Gu@amd.com>
>     *Sent:* Tuesday, May 18, 2021 1:58 AM
>     *To:* Nieto, David M <David.Nieto@amd.com>
>     <mailto:David.Nieto@amd.com>; Koenig, Christian
>     <Christian.Koenig@amd.com> <mailto:Christian.Koenig@amd.com>;
>     amd-gfx@lists.freedesktop.org
>     <mailto:amd-gfx@lists.freedesktop.org>
>     <amd-gfx@lists.freedesktop.org>
>     <mailto:amd-gfx@lists.freedesktop.org>; maraeo@gmail.com
>     <mailto:maraeo@gmail.com> <maraeo@gmail.com>
>     <mailto:maraeo@gmail.com>; Deucher, Alexander
>     <Alexander.Deucher@amd.com> <mailto:Alexander.Deucher@amd.com>
>     *Cc:* Deng, Emily <Emily.Deng@amd.com> <mailto:Emily.Deng@amd.com>
>     *Subject:* RE: [PATCH] drm/amdgpu: Add vbios info ioctl interface
>
>     [Public]
>
>     Hi all,
>
>     Then the struct looks like:
>
>     > +struct drm_amdgpu_info_vbios {
>     > +���� __u8 name[64];
>     > +���� __u8 vbios_pn[64];
>     > +���� __u32 version;
>     > +���� __u8 vbios_ver_str[32];
>     > +���� __u8 date[32];
>     > +};
>
>     Sample output:
>
>     vbios name : NAVI12 A0 XT D30501 8GB EVAL 1150e/334m HYN/SAM
>     vbios pn : 113-D3050100-104
>     vbios version : 285409288
>     vbios ver_str : 017.003.000.008.016956
>     vbios date : 2021/05/03 23:32
>
>     Please help double confirm that we�re all fine with it and there�s
>     no need to add & remove anything.
>
>     Best regards,
>
>     Jiawei
>
>     *From:* Nieto, David M <David.Nieto@amd.com>
>     <mailto:David.Nieto@amd.com>
>     *Sent:* Tuesday, May 18, 2021 12:40 PM
>     *To:* Gu, JiaWei (Will) <JiaWei.Gu@amd.com>
>     <mailto:JiaWei.Gu@amd.com>; Koenig, Christian
>     <Christian.Koenig@amd.com> <mailto:Christian.Koenig@amd.com>;
>     amd-gfx@lists.freedesktop.org
>     <mailto:amd-gfx@lists.freedesktop.org>; maraeo@gmail.com
>     <mailto:maraeo@gmail.com>; Deucher, Alexander
>     <Alexander.Deucher@amd.com> <mailto:Alexander.Deucher@amd.com>
>     *Cc:* Deng, Emily <Emily.Deng@amd.com> <mailto:Emily.Deng@amd.com>
>     *Subject:* Re: [PATCH] drm/amdgpu: Add vbios info ioctl interface
>
>     [Public]
>
>     Yes, let's remove that too,
>
>     Thanks,
>
>     David
>
>     ------------------------------------------------------------------------
>
>     *From:*Gu, JiaWei (Will) <JiaWei.Gu@amd.com
>     <mailto:JiaWei.Gu@amd.com>>
>     *Sent:* Monday, May 17, 2021 8:07 PM
>     *To:* Nieto, David M <David.Nieto@amd.com
>     <mailto:David.Nieto@amd.com>>; Koenig, Christian
>     <Christian.Koenig@amd.com <mailto:Christian.Koenig@amd.com>>;
>     amd-gfx@lists.freedesktop.org
>     <mailto:amd-gfx@lists.freedesktop.org>
>     <amd-gfx@lists.freedesktop.org
>     <mailto:amd-gfx@lists.freedesktop.org>>; maraeo@gmail.com
>     <mailto:maraeo@gmail.com> <maraeo@gmail.com
>     <mailto:maraeo@gmail.com>>; Deucher, Alexander
>     <Alexander.Deucher@amd.com <mailto:Alexander.Deucher@amd.com>>
>     *Cc:* Deng, Emily <Emily.Deng@amd.com <mailto:Emily.Deng@amd.com>>
>     *Subject:* RE: [PATCH] drm/amdgpu: Add vbios info ioctl interface
>
>     [AMD Official Use Only - Internal Distribution Only]
>
>     OK let�s remove serial.
>
>     dbdf comes from this:
>
>     vbios_info.dbdf = PCI_DEVID(adev->pdev->bus->number,
>     adev->pdev->devfn);
>
>     I think we can remove dbdf as well.
>
>     Best regards,
>
>     Jiawei
>
>     *From:* Nieto, David M <David.Nieto@amd.com
>     <mailto:David.Nieto@amd.com>>
>     *Sent:* Tuesday, May 18, 2021 10:45 AM
>     *To:* Gu, JiaWei (Will) <JiaWei.Gu@amd.com
>     <mailto:JiaWei.Gu@amd.com>>; Koenig, Christian
>     <Christian.Koenig@amd.com <mailto:Christian.Koenig@amd.com>>;
>     amd-gfx@lists.freedesktop.org
>     <mailto:amd-gfx@lists.freedesktop.org>; maraeo@gmail.com
>     <mailto:maraeo@gmail.com>; Deucher, Alexander
>     <Alexander.Deucher@amd.com <mailto:Alexander.Deucher@amd.com>>
>     *Cc:* Deng, Emily <Emily.Deng@amd.com <mailto:Emily.Deng@amd.com>>
>     *Subject:* Re: [PATCH] drm/amdgpu: Add vbios info ioctl interface
>
>     [AMD Official Use Only - Internal Distribution Only]
>
>     The serial�number is ASIC information, not VBIOS information, and
>     it is still available as a sysfs node... I don't think we should
>     put it there.
>
>     Not sure what dbdf stands for.
>
>     ------------------------------------------------------------------------
>
>     *From:*Gu, JiaWei (Will) <JiaWei.Gu@amd.com
>     <mailto:JiaWei.Gu@amd.com>>
>     *Sent:* Monday, May 17, 2021 7:11 PM
>     *To:* Koenig, Christian <Christian.Koenig@amd.com
>     <mailto:Christian.Koenig@amd.com>>; amd-gfx@lists.freedesktop.org
>     <mailto:amd-gfx@lists.freedesktop.org>
>     <amd-gfx@lists.freedesktop.org
>     <mailto:amd-gfx@lists.freedesktop.org>>; Nieto, David M
>     <David.Nieto@amd.com <mailto:David.Nieto@amd.com>>;
>     maraeo@gmail.com <mailto:maraeo@gmail.com> <maraeo@gmail.com
>     <mailto:maraeo@gmail.com>>; Deucher, Alexander
>     <Alexander.Deucher@amd.com <mailto:Alexander.Deucher@amd.com>>
>     *Cc:* Deng, Emily <Emily.Deng@amd.com <mailto:Emily.Deng@amd.com>>
>     *Subject:* RE: [PATCH] drm/amdgpu: Add vbios info ioctl interface
>
>     [AMD Official Use Only - Internal Distribution Only]
>
>     So I guess the dbdf is also needed to be removed?
>     And how about serial?
>
>     > +struct drm_amdgpu_info_vbios {
>     > +���� __u8 name[64];
>     > +���� __u32 dbdf; // do we need this?
>     > +���� __u8 vbios_pn[64];
>     > +���� __u32 version;
>     > +���� __u8 vbios_ver_str[32];
>     > +���� __u8 date[32];
>     > +���� __u64 serial; // do we need this?
>     > +};
>
>     Best regards,
>     Jiawei
>
>     -----Original Message-----
>     From: Koenig, Christian <Christian.Koenig@amd.com
>     <mailto:Christian.Koenig@amd.com>>
>     Sent: Monday, May 17, 2021 8:26 PM
>     To: Gu, JiaWei (Will) <JiaWei.Gu@amd.com
>     <mailto:JiaWei.Gu@amd.com>>; amd-gfx@lists.freedesktop.org
>     <mailto:amd-gfx@lists.freedesktop.org>; Nieto, David M
>     <David.Nieto@amd.com <mailto:David.Nieto@amd.com>>;
>     maraeo@gmail.com <mailto:maraeo@gmail.com>; Deucher, Alexander
>     <Alexander.Deucher@amd.com <mailto:Alexander.Deucher@amd.com>>
>     Cc: Deng, Emily <Emily.Deng@amd.com <mailto:Emily.Deng@amd.com>>
>     Subject: Re: [PATCH] drm/amdgpu: Add vbios info ioctl interface
>
>     I'm not very familiar with the technical background why we have
>     the fields here once more.
>
>     But of hand we should at least remove everything which is also
>     available from the PCI information.
>
>     E.g. dev_id, rev_id, sub_dev_id, sub_ved_id.
>
>     Regards,
>     Christian.
>
>     Am 17.05.21 um 14:17 schrieb Gu, JiaWei (Will):
>     > [AMD Official Use Only - Internal Distribution Only]
>     >
>     > Hi all,
>     >
>     > Thanks Christian's suggestion.
>     > I reverted the previous patches and squash them into this single
>     one.
>     >
>     > As this patch shows, the current uapi change looks like this:
>     >
>     > +struct drm_amdgpu_info_vbios {
>     > +���� __u8 name[64];
>     > +���� __u32 dbdf;
>     > +���� __u8 vbios_pn[64];
>     > +���� __u32 version;
>     > +���� __u8 vbios_ver_str[32];
>     > +���� __u8 date[32];
>     > +���� __u64 serial;
>     > +���� __u32 dev_id;
>     > +���� __u32 rev_id;
>     > +���� __u32 sub_dev_id;
>     > +���� __u32 sub_ved_id;
>     > +};
>     >
>     > As we know there's some redundant info in this struct.
>     > Please feel free to give any comments or suggestion about what
>     it should & shouldn't include.
>     >
>     > Best regards,
>     > Jiawei
>     >
>     > -----Original Message-----
>     > From: Jiawei Gu <Jiawei.Gu@amd.com <mailto:Jiawei.Gu@amd.com>>
>     > Sent: Monday, May 17, 2021 8:08 PM
>     > To: amd-gfx@lists.freedesktop.org
>     <mailto:amd-gfx@lists.freedesktop.org>; Koenig, Christian
>     > <Christian.Koenig@amd.com <mailto:Christian.Koenig@amd.com>>;
>     Nieto, David M <David.Nieto@amd.com <mailto:David.Nieto@amd.com>>;
>     > maraeo@gmail.com <mailto:maraeo@gmail.com>; Deucher, Alexander
>     <Alexander.Deucher@amd.com <mailto:Alexander.Deucher@amd.com>>
>     > Cc: Deng, Emily <Emily.Deng@amd.com
>     <mailto:Emily.Deng@amd.com>>; Gu, JiaWei (Will)
>     > <JiaWei.Gu@amd.com <mailto:JiaWei.Gu@amd.com>>
>     > Subject: [PATCH] drm/amdgpu: Add vbios info ioctl interface
>     >
>     > Add AMDGPU_INFO_VBIOS_INFO subquery id for detailed vbios info.
>     >
>     > Provides a way for the user application to get the VBIOS
>     information without having to parse the binary.
>     > It is useful for the user to be able to display in a simple way
>     the VBIOS version in their system if they happen to encounter an
>     issue.
>     >
>     > V2:
>     > Use numeric serial.
>     > Parse and expose vbios version string.
>     >
>     > Signed-off-by: Jiawei Gu <Jiawei.Gu@amd.com
>     <mailto:Jiawei.Gu@amd.com>>
>     > Acked-by: Christian K�nig <christian.koenig@amd.com
>     <mailto:christian.koenig@amd.com>>
>     > ---
>     > drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c |� 21 +++
>     > drivers/gpu/drm/amd/amdgpu/atom.c | 174 +++++++++++++++++++++
>     > drivers/gpu/drm/amd/amdgpu/atom.h |� 12 ++
>     > drivers/gpu/drm/amd/include/atomfirmware.h |�� 5 +
>     > include/uapi/drm/amdgpu_drm.h |� 16 ++
>     >�� 5 files changed, 228 insertions(+)
>     >
>     > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
>     > b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
>     > index 8d12e474745a..30e4fed3de22 100644
>     > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
>     > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
>     > @@ -861,6 +861,27 @@ int amdgpu_info_ioctl(struct drm_device
>     *dev, void *data, struct drm_file *filp)
>     >������������������������������������������� min((size_t)size,
>     (size_t)(bios_size - bios_offset)))
>     >��������������������������������������� ? -EFAULT : 0;
>     >��������������� }
>     > +������������ case AMDGPU_INFO_VBIOS_INFO: {
>     > +�������������������� struct drm_amdgpu_info_vbios vbios_info = {};
>     > +�������������������� struct atom_context *atom_context;
>     > +
>     > +�������������������� atom_context = adev->mode_info.atom_context;
>     > + memcpy(vbios_info.name, atom_context->name,
>     sizeof(atom_context->name));
>     > + vbios_info.dbdf = PCI_DEVID(adev->pdev->bus->number,
>     adev->pdev->devfn);
>     > + memcpy(vbios_info.vbios_pn, atom_context->vbios_pn,
>     sizeof(atom_context->vbios_pn));
>     > + vbios_info.version = atom_context->version;
>     > + memcpy(vbios_info.vbios_ver_str, atom_context->vbios_ver_str,
>     > + sizeof(atom_context->vbios_ver_str));
>     > + memcpy(vbios_info.date, atom_context->date,
>     sizeof(atom_context->date));
>     > + vbios_info.serial = adev->unique_id;
>     > + vbios_info.dev_id = adev->pdev->device;
>     > + vbios_info.rev_id = adev->pdev->revision;
>     > + vbios_info.sub_dev_id = atom_context->sub_dev_id;
>     > + vbios_info.sub_ved_id = atom_context->sub_ved_id;
>     > +
>     > +�������������������� return copy_to_user(out, &vbios_info,
>     > + min((size_t)size, sizeof(vbios_info))) ? -EFAULT : 0;
>     > +������������ }
>     >��������������� default:
>     > DRM_DEBUG_KMS("Invalid request %d\n",
>     >��������������������������������������� info->vbios_info.type);
>     > diff --git a/drivers/gpu/drm/amd/amdgpu/atom.c
>     > b/drivers/gpu/drm/amd/amdgpu/atom.c
>     > index 3dcb8b32f48b..542b2c2414e4 100644
>     > --- a/drivers/gpu/drm/amd/amdgpu/atom.c
>     > +++ b/drivers/gpu/drm/amd/amdgpu/atom.c
>     > @@ -31,6 +31,7 @@
>     >
>     >�� #define ATOM_DEBUG
>     >
>     > +#include "atomfirmware.h"
>     >�� #include "atom.h"
>     >�� #include "atom-names.h"
>     >�� #include "atom-bits.h"
>     > @@ -1299,12 +1300,168 @@ static void atom_index_iio(struct
>     atom_context *ctx, int base)
>     >������� }
>     >�� }
>     >
>     > +static void atom_get_vbios_name(struct atom_context *ctx) {
>     > +���� unsigned char *p_rom;
>     > +���� unsigned char str_num;
>     > +���� unsigned short off_to_vbios_str;
>     > +���� unsigned char *c_ptr;
>     > +���� int name_size;
>     > +���� int i;
>     > +
>     > +���� const char *na = "--N/A--";
>     > +���� char *back;
>     > +
>     > +���� p_rom = ctx->bios;
>     > +
>     > +���� str_num = *(p_rom + OFFSET_TO_GET_ATOMBIOS_NUMBER_OF_STRINGS);
>     > +���� if (str_num != 0) {
>     > +������������ off_to_vbios_str =
>     > +�������������������� *(unsigned short *)(p_rom +
>     OFFSET_TO_GET_ATOMBIOS_STRING_START);
>     > +
>     > +������������ c_ptr = (unsigned char *)(p_rom + off_to_vbios_str);
>     > +���� } else {
>     > +������������ /* do not know where to find name */
>     > +������������ memcpy(ctx->name, na, 7);
>     > +������������ ctx->name[7] = 0;
>     > +������������ return;
>     > +���� }
>     > +
>     > +���� /*
>     > +����� * skip the atombios strings, usually 4
>     > +����� * 1st is P/N, 2nd is ASIC, 3rd is PCI type, 4th is Memory
>     type
>     > +����� */
>     > +���� for (i = 0; i < str_num; i++) {
>     > +������������ while (*c_ptr != 0)
>     > +�������������������� c_ptr++;
>     > +������������ c_ptr++;
>     > +���� }
>     > +
>     > +���� /* skip the following 2 chars: 0x0D 0x0A */
>     > +���� c_ptr += 2;
>     > +
>     > +���� name_size = strnlen(c_ptr, STRLEN_LONG - 1);
>     > +���� memcpy(ctx->name, c_ptr, name_size);
>     > +���� back = ctx->name + name_size;
>     > +���� while ((*--back) == ' ')
>     > +������������ ;
>     > +���� *(back + 1) = '\0';
>     > +}
>     > +
>     > +static void atom_get_vbios_date(struct atom_context *ctx) {
>     > +���� unsigned char *p_rom;
>     > +���� unsigned char *date_in_rom;
>     > +
>     > +���� p_rom = ctx->bios;
>     > +
>     > +���� date_in_rom = p_rom + OFFSET_TO_VBIOS_DATE;
>     > +
>     > +���� ctx->date[0] = '2';
>     > +���� ctx->date[1] = '0';
>     > +���� ctx->date[2] = date_in_rom[6];
>     > +���� ctx->date[3] = date_in_rom[7];
>     > +���� ctx->date[4] = '/';
>     > +���� ctx->date[5] = date_in_rom[0];
>     > +���� ctx->date[6] = date_in_rom[1];
>     > +���� ctx->date[7] = '/';
>     > +���� ctx->date[8] = date_in_rom[3];
>     > +���� ctx->date[9] = date_in_rom[4];
>     > +���� ctx->date[10] = ' ';
>     > +���� ctx->date[11] = date_in_rom[9];
>     > +���� ctx->date[12] = date_in_rom[10];
>     > +���� ctx->date[13] = date_in_rom[11];
>     > +���� ctx->date[14] = date_in_rom[12];
>     > +���� ctx->date[15] = date_in_rom[13];
>     > +���� ctx->date[16] = '\0';
>     > +}
>     > +
>     > +static unsigned char *atom_find_str_in_rom(struct atom_context
>     *ctx, char *str, int start,
>     > + int end, int maxlen)
>     > +{
>     > +���� unsigned long str_off;
>     > +���� unsigned char *p_rom;
>     > +���� unsigned short str_len;
>     > +
>     > +���� str_off = 0;
>     > +���� str_len = strnlen(str, maxlen);
>     > +���� p_rom = ctx->bios;
>     > +
>     > +���� for (; start <= end; ++start) {
>     > +������������ for (str_off = 0; str_off < str_len; ++str_off) {
>     > +�������������������� if (str[str_off] != *(p_rom + start +
>     str_off))
>     > + break;
>     > +������������ }
>     > +
>     > +������������ if (str_off == str_len || str[str_off] == 0)
>     > +�������������������� return p_rom + start;
>     > +���� }
>     > +���� return NULL;
>     > +}
>     > +
>     > +static void atom_get_vbios_pn(struct atom_context *ctx) {
>     > +���� unsigned char *p_rom;
>     > +���� unsigned short off_to_vbios_str;
>     > +���� unsigned char *vbios_str;
>     > +���� int count;
>     > +
>     > +���� off_to_vbios_str = 0;
>     > +���� p_rom = ctx->bios;
>     > +
>     > +���� if (*(p_rom + OFFSET_TO_GET_ATOMBIOS_NUMBER_OF_STRINGS) !=
>     0) {
>     > +������������ off_to_vbios_str =
>     > +�������������������� *(unsigned short *)(p_rom +
>     OFFSET_TO_GET_ATOMBIOS_STRING_START);
>     > +
>     > +������������ vbios_str = (unsigned char *)(p_rom +
>     off_to_vbios_str);
>     > +���� } else {
>     > +������������ vbios_str = p_rom + OFFSET_TO_VBIOS_PART_NUMBER;
>     > +���� }
>     > +
>     > +���� if (*vbios_str == 0) {
>     > +������������ vbios_str = atom_find_str_in_rom(ctx,
>     BIOS_ATOM_PREFIX, 3, 1024, 64);
>     > +������������ if (vbios_str == NULL)
>     > +�������������������� vbios_str += sizeof(BIOS_ATOM_PREFIX) - 1;
>     > +���� }
>     > +���� if (vbios_str != NULL && *vbios_str == 0)
>     > +������������ vbios_str++;
>     > +
>     > +���� if (vbios_str != NULL) {
>     > +������������ count = 0;
>     > +������������ while ((count < BIOS_STRING_LENGTH) &&
>     vbios_str[count] >= ' ' &&
>     > + vbios_str[count] <= 'z') {
>     > + ctx->vbios_pn[count] = vbios_str[count];
>     > +�������������������� count++;
>     > +������������ }
>     > +
>     > + ctx->vbios_pn[count] = 0;
>     > +���� }
>     > +}
>     > +
>     > +static void atom_get_vbios_version(struct atom_context *ctx) {
>     > +���� unsigned char *vbios_ver;
>     > +
>     > +���� /* find anchor ATOMBIOSBK-AMD */
>     > +���� vbios_ver = atom_find_str_in_rom(ctx, BIOS_VERSION_PREFIX,
>     3, 1024, 64);
>     > +���� if (vbios_ver != NULL) {
>     > +������������ /* skip ATOMBIOSBK-AMD VER */
>     > +������������ vbios_ver += 18;
>     > + memcpy(ctx->vbios_ver_str, vbios_ver, STRLEN_NORMAL);
>     > +���� } else {
>     > + ctx->vbios_ver_str[0] = '\0';
>     > +���� }
>     > +}
>     > +
>     >�� struct atom_context *amdgpu_atom_parse(struct card_info *card,
>     void *bios)� {
>     >������� int base;
>     >������� struct atom_context *ctx =
>     >����������� kzalloc(sizeof(struct atom_context), GFP_KERNEL);
>     >������� char *str;
>     > +���� struct _ATOM_ROM_HEADER *atom_rom_header;
>     > +���� struct _ATOM_MASTER_DATA_TABLE *master_table;
>     > +���� struct _ATOM_FIRMWARE_INFO *atom_fw_info;
>     >������� u16 idx;
>     >
>     >������� if (!ctx)
>     > @@ -1353,6 +1510,23 @@ struct atom_context
>     *amdgpu_atom_parse(struct card_info *card, void *bios)
>     > strlcpy(ctx->vbios_version, str, sizeof(ctx->vbios_version));
>     >������� }
>     >
>     > +���� atom_rom_header = (struct _ATOM_ROM_HEADER *)CSTR(base);
>     > +���� ctx->sub_dev_id = atom_rom_header->usSubsystemVendorID;
>     > +���� ctx->sub_ved_id = atom_rom_header->usSubsystemID;
>     > +���� if (atom_rom_header->usMasterDataTableOffset != 0) {
>     > +������������ master_table = (struct _ATOM_MASTER_DATA_TABLE *)
>     > + CSTR(atom_rom_header->usMasterDataTableOffset);
>     > +������������ if (master_table->ListOfDataTables.FirmwareInfo !=
>     0) {
>     > +�������������������� atom_fw_info = (struct _ATOM_FIRMWARE_INFO *)
>     > + CSTR(master_table->ListOfDataTables.FirmwareInfo);
>     > + ctx->version = atom_fw_info->ulFirmwareRevision;
>     > +������������ }
>     > +���� }
>     > +
>     > +���� atom_get_vbios_name(ctx);
>     > +���� atom_get_vbios_pn(ctx);
>     > +���� atom_get_vbios_date(ctx);
>     > +���� atom_get_vbios_version(ctx);
>     >
>     >������� return ctx;
>     >�� }
>     > diff --git a/drivers/gpu/drm/amd/amdgpu/atom.h
>     > b/drivers/gpu/drm/amd/amdgpu/atom.h
>     > index d279759cab47..6463ce6e756d 100644
>     > --- a/drivers/gpu/drm/amd/amdgpu/atom.h
>     > +++ b/drivers/gpu/drm/amd/amdgpu/atom.h
>     > @@ -112,6 +112,10 @@ struct drm_device;
>     >�� #define ATOM_IO_SYSIO�������������� 2
>     >�� #define ATOM_IO_IIO�������� 0x80
>     >
>     > +#define STRLEN_NORMAL��������������� 32
>     > +#define STRLEN_LONG��������� 64
>     > +#define STRLEN_VERYLONG������������� 254
>     > +
>     >�� struct card_info {
>     >������� struct drm_device *dev;
>     >������� void (* reg_write)(struct card_info *, uint32_t,
>     uint32_t);�� /* filled by driver */
>     > @@ -140,6 +144,14 @@ struct atom_context {
>     >������� uint32_t *scratch;
>     >������� int scratch_size_bytes;
>     >������� char vbios_version[20];
>     > +
>     > +���� uint8_t name[STRLEN_LONG];
>     > +���� uint8_t vbios_pn[STRLEN_LONG];
>     > +���� uint32_t version;
>     > +���� uint8_t vbios_ver_str[STRLEN_NORMAL];
>     > +���� uint8_t date[STRLEN_NORMAL];
>     > +���� uint32_t sub_dev_id;
>     > +���� uint32_t sub_ved_id;
>     >�� };
>     >
>     >�� extern int amdgpu_atom_debug;
>     > diff --git a/drivers/gpu/drm/amd/include/atomfirmware.h
>     > b/drivers/gpu/drm/amd/include/atomfirmware.h
>     > index 275468e4be60..28deecc2f990 100644
>     > --- a/drivers/gpu/drm/amd/include/atomfirmware.h
>     > +++ b/drivers/gpu/drm/amd/include/atomfirmware.h
>     > @@ -197,6 +197,9 @@ enum atom_dp_vs_preemph_def{
>     >���� DP_VS_LEVEL0_PREEMPH_LEVEL3 = 0x18,
>     >�� };
>     >
>     > +#define BIOS_ATOM_PREFIX "ATOMBIOS"
>     > +#define BIOS_VERSION_PREFIX "ATOMBIOSBK-AMD"
>     > +#define BIOS_STRING_LENGTH 43
>     >
>     >�� /*
>     >�� enum atom_string_def{
>     > @@ -215,6 +218,8 @@ enum atombios_image_offset{
>     > MAXSIZE_OF_ATOMBIOS_ASIC_BUS_MEM_TYPE = 20,� /*including the
>     terminator 0x0!*/
>     > OFFSET_TO_GET_ATOMBIOS_NUMBER_OF_STRINGS = 0x2f,
>     > OFFSET_TO_GET_ATOMBIOS_STRING_START = 0x6e,
>     > + OFFSET_TO_VBIOS_PART_NUMBER = 0x80,
>     > + OFFSET_TO_VBIOS_DATE = 0x50,
>     >�� };
>     >
>     >
>     >
>     /*********************************************************************
>     > ******* diff --git a/include/uapi/drm/amdgpu_drm.h
>     > b/include/uapi/drm/amdgpu_drm.h index 9169df7fadee..e0f98ca9a755
>     > 100644
>     > --- a/include/uapi/drm/amdgpu_drm.h
>     > +++ b/include/uapi/drm/amdgpu_drm.h
>     > @@ -756,6 +756,8 @@ struct drm_amdgpu_cs_chunk_data {
>     >������� #define AMDGPU_INFO_VBIOS_SIZE��������� 0x1
>     >������� /* Subquery id: Query vbios image */
>     >������� #define AMDGPU_INFO_VBIOS_IMAGE�������� 0x2
>     > +���� /* Subquery id: Query vbios info */
>     > +���� #define AMDGPU_INFO_VBIOS_INFO��������� 0x3
>     >�� /* Query UVD handles */
>     >�� #define AMDGPU_INFO_NUM_HANDLES 0x1C
>     >�� /* Query sensor related information */ @@ -949,6 +951,20 @@
>     struct
>     > drm_amdgpu_info_firmware {
>     >������� __u32 feature;
>     >�� };
>     >
>     > +struct drm_amdgpu_info_vbios {
>     > +���� __u8 name[64];
>     > +���� __u32 dbdf;
>     > +���� __u8 vbios_pn[64];
>     > +���� __u32 version;
>     > +���� __u8 vbios_ver_str[32];
>     > +���� __u8 date[32];
>     > +���� __u64 serial;
>     > +���� __u32 dev_id;
>     > +���� __u32 rev_id;
>     > +���� __u32 sub_dev_id;
>     > +���� __u32 sub_ved_id;
>     > +};
>     > +
>     >�� #define AMDGPU_VRAM_TYPE_UNKNOWN 0
>     >�� #define AMDGPU_VRAM_TYPE_GDDR1 1
>     >�� #define AMDGPU_VRAM_TYPE_DDR2� 2
>     > --
>     > 2.17.1
>
>     _______________________________________________
>
>     amd-gfx mailing list
>
>     amd-gfx@lists.freedesktop.org  <mailto:amd-gfx@lists.freedesktop.org>
>
>     https://lists.freedesktop.org/mailman/listinfo/amd-gfx  <https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&data=04%7C01%7CJiaWei.Gu%40amd.com%7Ccd8e7257279a437d9b2208d91ac93b3e%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637570273857847028%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=zhrziSJ55q4VfYYd23yKYoIQdocTAtZ4v%2FyKvU9TJhs%3D&reserved=0>
>


--------------9E3011F55D0CCC43B3B5EECE
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
  </head>
  <body>
    Kudos should go to Nirmoy who mentioned that tool in one of our
    discussions. But, yeah it is rather useful :)<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <div class="moz-cite-prefix">Am 20.05.21 um 03:30 schrieb Gu, JiaWei
      (Will):<br>
    </div>
    <blockquote type="cite"
cite="mid:CH0PR12MB51566149D050B5AEA7DED0A5F82A9@CH0PR12MB5156.namprd12.prod.outlook.com">
      <meta http-equiv="Content-Type" content="text/html;
        charset=windows-1252">
      <meta name="Generator" content="Microsoft Word 15 (filtered
        medium)">
      <!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]-->
      <style>@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}@font-face
	{font-family:"Segoe UI";
	panose-1:2 11 5 2 4 2 4 2 2 3;}@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}pre
	{mso-style-priority:99;
	mso-style-link:"HTML Preformatted Char";
	margin:0in;
	font-size:10.0pt;
	font-family:"Courier New";}span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:Consolas;}p.xmsonormal, li.xmsonormal, div.xmsonormal
	{mso-style-name:x_msonormal;
	margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}p.xxmsonormal, li.xxmsonormal, div.xxmsonormal
	{mso-style-name:x_xmsonormal;
	margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}p.xxmsipheader4d111418, li.xxmsipheader4d111418, div.xxmsipheader4d111418
	{mso-style-name:x_xmsipheader4d111418;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}span.EmailStyle23
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}p.msipheader4d111418, li.msipheader4d111418, div.msipheader4d111418
	{mso-style-name:msipheader4d111418;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}div.WordSection1
	{page:WordSection1;}</style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext="edit">
<o:idmap v:ext="edit" data="1" />
</o:shapelayout></xml><![endif]-->
      <div class="WordSection1">
        <p class="msipheader4d111418" style="margin:0in"><span
            style="font-family:&quot;Arial&quot;,sans-serif;color:#0078D7">[AMD
            Official Use Only - Internal Distribution Only]</span><o:p></o:p></p>
        <p class="MsoNormal"><o:p>�</o:p></p>
        <p class="MsoNormal">Thanks Christian!<o:p></o:p></p>
        <p class="MsoNormal"><o:p>�</o:p></p>
        <p class="MsoNormal">Happy to learn new tricks.<o:p></o:p></p>
        <p class="MsoNormal"><o:p>�</o:p></p>
        <p class="MsoNormal">Best regards,<o:p></o:p></p>
        <p class="MsoNormal">Jiawei<o:p></o:p></p>
        <p class="MsoNormal"><o:p>�</o:p></p>
        <div>
          <div style="border:none;border-top:solid #E1E1E1
            1.0pt;padding:3.0pt 0in 0in 0in">
            <p class="MsoNormal"><b>From:</b> Christian K�nig
              <a class="moz-txt-link-rfc2396E" href="mailto:ckoenig.leichtzumerken@gmail.com">&lt;ckoenig.leichtzumerken@gmail.com&gt;</a>
              <br>
              <b>Sent:</b> Wednesday, May 19, 2021 9:23 PM<br>
              <b>To:</b> Deucher, Alexander
              <a class="moz-txt-link-rfc2396E" href="mailto:Alexander.Deucher@amd.com">&lt;Alexander.Deucher@amd.com&gt;</a>; Gu, JiaWei (Will)
              <a class="moz-txt-link-rfc2396E" href="mailto:JiaWei.Gu@amd.com">&lt;JiaWei.Gu@amd.com&gt;</a>; Nieto, David M
              <a class="moz-txt-link-rfc2396E" href="mailto:David.Nieto@amd.com">&lt;David.Nieto@amd.com&gt;</a>; Koenig, Christian
              <a class="moz-txt-link-rfc2396E" href="mailto:Christian.Koenig@amd.com">&lt;Christian.Koenig@amd.com&gt;</a>;
              <a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a>; <a class="moz-txt-link-abbreviated" href="mailto:maraeo@gmail.com">maraeo@gmail.com</a><br>
              <b>Cc:</b> Deng, Emily <a class="moz-txt-link-rfc2396E" href="mailto:Emily.Deng@amd.com">&lt;Emily.Deng@amd.com&gt;</a><br>
              <b>Subject:</b> Re: [PATCH] drm/amdgpu: Add vbios info
              ioctl interface<o:p></o:p></p>
          </div>
        </div>
        <p class="MsoNormal"><o:p>�</o:p></p>
        <p class="MsoNormal" style="margin-bottom:12.0pt">Good point.<br>
          <br>
          If you want to double check the alignment you can use
          something like "pahole drivers/gpu/drm/amd/amdgpu/amdgpu.ko -C
          drm_amdgpu_info_vbios" after building the kernel module.<br>
          <br>
          Regards,<br>
          Christian.<o:p></o:p></p>
        <div>
          <p class="MsoNormal">Am 19.05.21 um 15:09 schrieb Deucher,
            Alexander:<o:p></o:p></p>
        </div>
        <blockquote style="margin-top:5.0pt;margin-bottom:5.0pt">
          <p style="margin:15.0pt"><span
style="font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:green">[Public]<o:p></o:p></span></p>
          <p class="MsoNormal"><o:p>�</o:p></p>
          <div>
            <div>
              <p class="MsoNormal"><span
                  style="font-size:12.0pt;color:black">The structure is
                  not 64 bit aligned.� I think you want something like:<o:p></o:p></span></p>
            </div>
            <div>
              <p class="MsoNormal"><span
                  style="font-size:12.0pt;color:black"><o:p>�</o:p></span></p>
            </div>
            <div>
              <p class="MsoNormal"><span
                  style="font-size:12.0pt;color:black">&gt; +struct
                  drm_amdgpu_info_vbios {<br>
                  &gt; +���� __u8 name[64];<br>
                  &gt; +���� __u8 vbios_pn[64];<br>
                  &gt; +���� __u32 version;<o:p></o:p></span></p>
            </div>
            <div>
              <p class="MsoNormal"><span
                  style="font-size:12.0pt;color:black">&gt; +���� __u32
                  pad;<o:p></o:p></span></p>
            </div>
            <div>
              <p class="MsoNormal"><span
                  style="font-size:12.0pt;color:black">&gt; +���� __u8
                  vbios_ver_str[32];<br>
                  &gt; +���� __u8 date[32];<br>
                  &gt; +};<o:p></o:p></span></p>
            </div>
            <div class="MsoNormal" style="text-align:center"
              align="center">
              <hr width="98%" size="2" align="center">
            </div>
            <div id="divRplyFwdMsg">
              <p class="MsoNormal"><b><span style="color:black">From:</span></b><span
                  style="color:black"> Gu, JiaWei (Will)
                  <a href="mailto:JiaWei.Gu@amd.com"
                    moz-do-not-send="true">&lt;JiaWei.Gu@amd.com&gt;</a><br>
                  <b>Sent:</b> Tuesday, May 18, 2021 1:58 AM<br>
                  <b>To:</b> Nieto, David M <a
                    href="mailto:David.Nieto@amd.com"
                    moz-do-not-send="true">&lt;David.Nieto@amd.com&gt;</a>;
                  Koenig, Christian
                  <a href="mailto:Christian.Koenig@amd.com"
                    moz-do-not-send="true">&lt;Christian.Koenig@amd.com&gt;</a>;
                  <a href="mailto:amd-gfx@lists.freedesktop.org"
                    moz-do-not-send="true">
                    amd-gfx@lists.freedesktop.org</a> <a
                    href="mailto:amd-gfx@lists.freedesktop.org"
                    moz-do-not-send="true">
                    &lt;amd-gfx@lists.freedesktop.org&gt;</a>; <a
                    href="mailto:maraeo@gmail.com"
                    moz-do-not-send="true">maraeo@gmail.com</a>
                  <a href="mailto:maraeo@gmail.com"
                    moz-do-not-send="true">&lt;maraeo@gmail.com&gt;</a>;
                  Deucher, Alexander <a
                    href="mailto:Alexander.Deucher@amd.com"
                    moz-do-not-send="true">
                    &lt;Alexander.Deucher@amd.com&gt;</a><br>
                  <b>Cc:</b> Deng, Emily <a
                    href="mailto:Emily.Deng@amd.com"
                    moz-do-not-send="true">&lt;Emily.Deng@amd.com&gt;</a><br>
                  <b>Subject:</b> RE: [PATCH] drm/amdgpu: Add vbios info
                  ioctl interface</span> <o:p>
                </o:p></p>
              <div>
                <p class="MsoNormal">�<o:p></o:p></p>
              </div>
            </div>
            <div>
              <p style="margin:15.0pt"><span
style="font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:green">[Public]<o:p></o:p></span></p>
              <p class="MsoNormal"><o:p>�</o:p></p>
              <div>
                <div>
                  <p class="xmsonormal">Hi all,<o:p></o:p></p>
                  <p class="xmsonormal">�<o:p></o:p></p>
                  <p class="xmsonormal">Then the struct looks like:<o:p></o:p></p>
                  <p class="xmsonormal">�<o:p></o:p></p>
                  <p class="xmsonormal">&gt; +struct
                    drm_amdgpu_info_vbios {<br>
                    &gt; +���� __u8 name[64];<br>
                    &gt; +���� __u8 vbios_pn[64];<br>
                    &gt; +���� __u32 version;<br>
                    &gt; +���� __u8 vbios_ver_str[32];<br>
                    &gt; +���� __u8 date[32];<br>
                    &gt; +};<o:p></o:p></p>
                  <p class="xmsonormal">�<o:p></o:p></p>
                  <p class="xmsonormal">Sample output:<o:p></o:p></p>
                  <p class="xmsonormal">�<o:p></o:p></p>
                  <p class="xmsonormal" style="margin-bottom:12.0pt"><span
                      style="font-size:10.5pt;font-family:&quot;Segoe
                      UI&quot;,sans-serif">vbios name : NAVI12 A0 XT
                      D30501 8GB EVAL 1150e/334m HYN/SAM<br>
                      vbios pn : 113-D3050100-104<br>
                      vbios version : 285409288<br>
                      vbios ver_str : 017.003.000.008.016956<br>
                      vbios date : 2021/05/03 23:32</span><o:p></o:p></p>
                  <p class="xmsonormal">Please help double confirm that
                    we�re all fine with it and there�s no need to add
                    &amp; remove anything.<o:p></o:p></p>
                  <p class="xmsonormal">�<o:p></o:p></p>
                  <p class="xmsonormal">Best regards,<o:p></o:p></p>
                  <p class="xmsonormal">Jiawei<o:p></o:p></p>
                  <p class="xmsonormal">�<o:p></o:p></p>
                  <div>
                    <div style="border:none;border-top:solid #E1E1E1
                      1.0pt;padding:3.0pt 0in 0in 0in">
                      <p class="xmsonormal"><b>From:</b> Nieto, David M
                        <a href="mailto:David.Nieto@amd.com"
                          moz-do-not-send="true">
                          &lt;David.Nieto@amd.com&gt;</a> <br>
                        <b>Sent:</b> Tuesday, May 18, 2021 12:40 PM<br>
                        <b>To:</b> Gu, JiaWei (Will) <a
                          href="mailto:JiaWei.Gu@amd.com"
                          moz-do-not-send="true">&lt;JiaWei.Gu@amd.com&gt;</a>;
                        Koenig, Christian
                        <a href="mailto:Christian.Koenig@amd.com"
                          moz-do-not-send="true">&lt;Christian.Koenig@amd.com&gt;</a>;
                        <a href="mailto:amd-gfx@lists.freedesktop.org"
                          moz-do-not-send="true">
                          amd-gfx@lists.freedesktop.org</a>; <a
                          href="mailto:maraeo@gmail.com"
                          moz-do-not-send="true">maraeo@gmail.com</a>;
                        Deucher, Alexander
                        <a href="mailto:Alexander.Deucher@amd.com"
                          moz-do-not-send="true">&lt;Alexander.Deucher@amd.com&gt;</a><br>
                        <b>Cc:</b> Deng, Emily <a
                          href="mailto:Emily.Deng@amd.com"
                          moz-do-not-send="true">&lt;Emily.Deng@amd.com&gt;</a><br>
                        <b>Subject:</b> Re: [PATCH] drm/amdgpu: Add
                        vbios info ioctl interface<o:p></o:p></p>
                    </div>
                  </div>
                  <p class="xmsonormal">�<o:p></o:p></p>
                  <p style="margin:15.0pt"><span
style="font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:green">[Public]</span><o:p></o:p></p>
                  <p class="xmsonormal">�<o:p></o:p></p>
                  <div>
                    <div>
                      <p class="xmsonormal" style="background:white"><span
                          style="font-size:12.0pt;color:black">Yes,
                          let's remove that too,</span><o:p></o:p></p>
                    </div>
                    <div>
                      <p class="xmsonormal" style="background:white"><span
                          style="font-size:12.0pt;color:black">�</span><o:p></o:p></p>
                    </div>
                    <div>
                      <p class="xmsonormal" style="background:white"><span
                          style="font-size:12.0pt;color:black">Thanks,</span><o:p></o:p></p>
                    </div>
                    <div>
                      <p class="xmsonormal" style="background:white"><span
                          style="font-size:12.0pt;color:black">�</span><o:p></o:p></p>
                    </div>
                    <div>
                      <p class="xmsonormal" style="background:white"><span
                          style="font-size:12.0pt;color:black">David</span><o:p></o:p></p>
                    </div>
                    <div class="MsoNormal" style="text-align:center"
                      align="center">
                      <hr width="98%" size="2" align="center">
                    </div>
                    <div id="x_divRplyFwdMsg">
                      <p class="xmsonormal"><b><span style="color:black">From:</span></b><span
                          style="color:black"> Gu, JiaWei (Will) &lt;<a
                            href="mailto:JiaWei.Gu@amd.com"
                            moz-do-not-send="true">JiaWei.Gu@amd.com</a>&gt;<br>
                          <b>Sent:</b> Monday, May 17, 2021 8:07 PM<br>
                          <b>To:</b> Nieto, David M &lt;<a
                            href="mailto:David.Nieto@amd.com"
                            moz-do-not-send="true">David.Nieto@amd.com</a>&gt;;
                          Koenig, Christian &lt;<a
                            href="mailto:Christian.Koenig@amd.com"
                            moz-do-not-send="true">Christian.Koenig@amd.com</a>&gt;;
                          <a href="mailto:amd-gfx@lists.freedesktop.org"
                            moz-do-not-send="true">amd-gfx@lists.freedesktop.org</a>
                          &lt;<a
                            href="mailto:amd-gfx@lists.freedesktop.org"
                            moz-do-not-send="true">amd-gfx@lists.freedesktop.org</a>&gt;;
                          <a href="mailto:maraeo@gmail.com"
                            moz-do-not-send="true">maraeo@gmail.com</a>
                          &lt;<a href="mailto:maraeo@gmail.com"
                            moz-do-not-send="true">maraeo@gmail.com</a>&gt;;
                          Deucher, Alexander &lt;<a
                            href="mailto:Alexander.Deucher@amd.com"
                            moz-do-not-send="true">Alexander.Deucher@amd.com</a>&gt;<br>
                          <b>Cc:</b> Deng, Emily &lt;<a
                            href="mailto:Emily.Deng@amd.com"
                            moz-do-not-send="true">Emily.Deng@amd.com</a>&gt;<br>
                          <b>Subject:</b> RE: [PATCH] drm/amdgpu: Add
                          vbios info ioctl interface</span> <o:p>
                        </o:p></p>
                      <div>
                        <p class="xmsonormal">�<o:p></o:p></p>
                      </div>
                    </div>
                    <div>
                      <div>
                        <p class="xxmsipheader4d111418"
                          style="margin:0in"><span
                            style="font-family:&quot;Arial&quot;,sans-serif;color:#0078D7">[AMD
                            Official Use Only - Internal Distribution
                            Only]</span><o:p></o:p></p>
                        <p class="xxmsonormal">�<o:p></o:p></p>
                        <p class="xxmsonormal">OK let�s remove serial.<o:p></o:p></p>
                        <p class="xxmsonormal">�<o:p></o:p></p>
                        <p class="xxmsonormal">dbdf comes from this: <o:p></o:p></p>
                        <p class="xxmsonormal">vbios_info.dbdf =
                          PCI_DEVID(adev-&gt;pdev-&gt;bus-&gt;number,
                          adev-&gt;pdev-&gt;devfn);<o:p></o:p></p>
                        <p class="xxmsonormal">�<o:p></o:p></p>
                        <p class="xxmsonormal">I think we can remove
                          dbdf as well.<o:p></o:p></p>
                        <p class="xxmsonormal">�<o:p></o:p></p>
                        <p class="xxmsonormal">Best regards,<o:p></o:p></p>
                        <p class="xxmsonormal">Jiawei<o:p></o:p></p>
                        <p class="xxmsonormal">�<o:p></o:p></p>
                        <div>
                          <div style="border:none;border-top:solid
                            #E1E1E1 1.0pt;padding:3.0pt 0in 0in 0in">
                            <p class="xxmsonormal"><b>From:</b> Nieto,
                              David M &lt;<a
                                href="mailto:David.Nieto@amd.com"
                                moz-do-not-send="true">David.Nieto@amd.com</a>&gt;
                              <br>
                              <b>Sent:</b> Tuesday, May 18, 2021 10:45
                              AM<br>
                              <b>To:</b> Gu, JiaWei (Will) &lt;<a
                                href="mailto:JiaWei.Gu@amd.com"
                                moz-do-not-send="true">JiaWei.Gu@amd.com</a>&gt;;
                              Koenig, Christian &lt;<a
                                href="mailto:Christian.Koenig@amd.com"
                                moz-do-not-send="true">Christian.Koenig@amd.com</a>&gt;;
                              <a
                                href="mailto:amd-gfx@lists.freedesktop.org"
                                moz-do-not-send="true">amd-gfx@lists.freedesktop.org</a>;
                              <a href="mailto:maraeo@gmail.com"
                                moz-do-not-send="true">maraeo@gmail.com</a>;
                              Deucher, Alexander &lt;<a
                                href="mailto:Alexander.Deucher@amd.com"
                                moz-do-not-send="true">Alexander.Deucher@amd.com</a>&gt;<br>
                              <b>Cc:</b> Deng, Emily &lt;<a
                                href="mailto:Emily.Deng@amd.com"
                                moz-do-not-send="true">Emily.Deng@amd.com</a>&gt;<br>
                              <b>Subject:</b> Re: [PATCH] drm/amdgpu:
                              Add vbios info ioctl interface<o:p></o:p></p>
                          </div>
                        </div>
                        <p class="xxmsonormal">�<o:p></o:p></p>
                        <p style="margin:5.0pt"><span
                            style="font-family:&quot;Arial&quot;,sans-serif;color:#0078D7">[AMD
                            Official Use Only - Internal Distribution
                            Only]</span><o:p></o:p></p>
                        <p class="xxmsonormal">�<o:p></o:p></p>
                        <div>
                          <div>
                            <p class="xxmsonormal"
                              style="background:white"><span
                                style="font-size:12.0pt;color:black">The
                                serial�number is ASIC information, not
                                VBIOS information, and it is still
                                available as a sysfs node... I don't
                                think we should put it there.</span><o:p></o:p></p>
                          </div>
                          <div>
                            <p class="xxmsonormal"
                              style="background:white"><span
                                style="font-size:12.0pt;color:black">�</span><o:p></o:p></p>
                          </div>
                          <div>
                            <p class="xxmsonormal"
                              style="background:white"><span
                                style="font-size:12.0pt;color:black">Not
                                sure what dbdf stands for.</span><o:p></o:p></p>
                          </div>
                          <div class="MsoNormal"
                            style="text-align:center" align="center">
                            <hr width="98%" size="2" align="center">
                          </div>
                          <div id="x_x_divRplyFwdMsg">
                            <p class="xxmsonormal"><b><span
                                  style="color:black">From:</span></b><span
                                style="color:black"> Gu, JiaWei (Will)
                                &lt;<a href="mailto:JiaWei.Gu@amd.com"
                                  moz-do-not-send="true">JiaWei.Gu@amd.com</a>&gt;<br>
                                <b>Sent:</b> Monday, May 17, 2021 7:11
                                PM<br>
                                <b>To:</b> Koenig, Christian &lt;<a
                                  href="mailto:Christian.Koenig@amd.com"
                                  moz-do-not-send="true">Christian.Koenig@amd.com</a>&gt;;
                                <a
                                  href="mailto:amd-gfx@lists.freedesktop.org"
                                  moz-do-not-send="true">amd-gfx@lists.freedesktop.org</a>
                                &lt;<a
                                  href="mailto:amd-gfx@lists.freedesktop.org"
                                  moz-do-not-send="true">amd-gfx@lists.freedesktop.org</a>&gt;;
                                Nieto, David M &lt;<a
                                  href="mailto:David.Nieto@amd.com"
                                  moz-do-not-send="true">David.Nieto@amd.com</a>&gt;;
                                <a href="mailto:maraeo@gmail.com"
                                  moz-do-not-send="true">maraeo@gmail.com</a>
                                &lt;<a href="mailto:maraeo@gmail.com"
                                  moz-do-not-send="true">maraeo@gmail.com</a>&gt;;
                                Deucher, Alexander &lt;<a
                                  href="mailto:Alexander.Deucher@amd.com"
                                  moz-do-not-send="true">Alexander.Deucher@amd.com</a>&gt;<br>
                                <b>Cc:</b> Deng, Emily &lt;<a
                                  href="mailto:Emily.Deng@amd.com"
                                  moz-do-not-send="true">Emily.Deng@amd.com</a>&gt;<br>
                                <b>Subject:</b> RE: [PATCH] drm/amdgpu:
                                Add vbios info ioctl interface</span> <o:p>
                              </o:p></p>
                            <div>
                              <p class="xxmsonormal">�<o:p></o:p></p>
                            </div>
                          </div>
                          <div>
                            <div>
                              <p class="xxmsonormal">[AMD Official Use
                                Only - Internal Distribution Only]<br>
                                <br>
                                So I guess the dbdf is also needed to be
                                removed?<br>
                                And how about serial?<br>
                                <br>
                                &gt; +struct drm_amdgpu_info_vbios {<br>
                                &gt; +���� __u8 name[64];<br>
                                &gt; +���� __u32 dbdf; // do we need
                                this?<br>
                                &gt; +���� __u8 vbios_pn[64];<br>
                                &gt; +���� __u32 version;<br>
                                &gt; +���� __u8 vbios_ver_str[32];<br>
                                &gt; +���� __u8 date[32];<br>
                                &gt; +���� __u64 serial; // do we need
                                this?<br>
                                &gt; +};<br>
                                <br>
                                Best regards,<br>
                                Jiawei<br>
                                <br>
                                -----Original Message-----<br>
                                From: Koenig, Christian &lt;<a
                                  href="mailto:Christian.Koenig@amd.com"
                                  moz-do-not-send="true">Christian.Koenig@amd.com</a>&gt;
                                <br>
                                Sent: Monday, May 17, 2021 8:26 PM<br>
                                To: Gu, JiaWei (Will) &lt;<a
                                  href="mailto:JiaWei.Gu@amd.com"
                                  moz-do-not-send="true">JiaWei.Gu@amd.com</a>&gt;;
                                <a
                                  href="mailto:amd-gfx@lists.freedesktop.org"
                                  moz-do-not-send="true">amd-gfx@lists.freedesktop.org</a>;
                                Nieto, David M &lt;<a
                                  href="mailto:David.Nieto@amd.com"
                                  moz-do-not-send="true">David.Nieto@amd.com</a>&gt;;
                                <a href="mailto:maraeo@gmail.com"
                                  moz-do-not-send="true">maraeo@gmail.com</a>;
                                Deucher, Alexander &lt;<a
                                  href="mailto:Alexander.Deucher@amd.com"
                                  moz-do-not-send="true">Alexander.Deucher@amd.com</a>&gt;<br>
                                Cc: Deng, Emily &lt;<a
                                  href="mailto:Emily.Deng@amd.com"
                                  moz-do-not-send="true">Emily.Deng@amd.com</a>&gt;<br>
                                Subject: Re: [PATCH] drm/amdgpu: Add
                                vbios info ioctl interface<br>
                                <br>
                                I'm not very familiar with the technical
                                background why we have the fields here
                                once more.<br>
                                <br>
                                But of hand we should at least remove
                                everything which is also available from
                                the PCI information.<br>
                                <br>
                                E.g. dev_id, rev_id, sub_dev_id,
                                sub_ved_id.<br>
                                <br>
                                Regards,<br>
                                Christian.<br>
                                <br>
                                Am 17.05.21 um 14:17 schrieb Gu, JiaWei
                                (Will):<br>
                                &gt; [AMD Official Use Only - Internal
                                Distribution Only]<br>
                                &gt;<br>
                                &gt; Hi all,<br>
                                &gt;<br>
                                &gt; Thanks Christian's suggestion.<br>
                                &gt; I reverted the previous patches and
                                squash them into this single one.<br>
                                &gt;<br>
                                &gt; As this patch shows, the current
                                uapi change looks like this:<br>
                                &gt;<br>
                                &gt; +struct drm_amdgpu_info_vbios {<br>
                                &gt; +���� __u8 name[64];<br>
                                &gt; +���� __u32 dbdf;<br>
                                &gt; +���� __u8 vbios_pn[64];<br>
                                &gt; +���� __u32 version;<br>
                                &gt; +���� __u8 vbios_ver_str[32];<br>
                                &gt; +���� __u8 date[32];<br>
                                &gt; +���� __u64 serial;<br>
                                &gt; +���� __u32 dev_id;<br>
                                &gt; +���� __u32 rev_id;<br>
                                &gt; +���� __u32 sub_dev_id;<br>
                                &gt; +���� __u32 sub_ved_id;<br>
                                &gt; +};<br>
                                &gt;<br>
                                &gt; As we know there's some redundant
                                info in this struct.<br>
                                &gt; Please feel free to give any
                                comments or suggestion about what it
                                should &amp; shouldn't include.<br>
                                &gt;<br>
                                &gt; Best regards,<br>
                                &gt; Jiawei<br>
                                &gt;<br>
                                &gt; -----Original Message-----<br>
                                &gt; From: Jiawei Gu &lt;<a
                                  href="mailto:Jiawei.Gu@amd.com"
                                  moz-do-not-send="true">Jiawei.Gu@amd.com</a>&gt;<br>
                                &gt; Sent: Monday, May 17, 2021 8:08 PM<br>
                                &gt; To: <a
                                  href="mailto:amd-gfx@lists.freedesktop.org"
                                  moz-do-not-send="true">amd-gfx@lists.freedesktop.org</a>;
                                Koenig, Christian
                                <br>
                                &gt; &lt;<a
                                  href="mailto:Christian.Koenig@amd.com"
                                  moz-do-not-send="true">Christian.Koenig@amd.com</a>&gt;;
                                Nieto, David M &lt;<a
                                  href="mailto:David.Nieto@amd.com"
                                  moz-do-not-send="true">David.Nieto@amd.com</a>&gt;;
                                <br>
                                &gt; <a href="mailto:maraeo@gmail.com"
                                  moz-do-not-send="true">maraeo@gmail.com</a>;
                                Deucher, Alexander &lt;<a
                                  href="mailto:Alexander.Deucher@amd.com"
                                  moz-do-not-send="true">Alexander.Deucher@amd.com</a>&gt;<br>
                                &gt; Cc: Deng, Emily &lt;<a
                                  href="mailto:Emily.Deng@amd.com"
                                  moz-do-not-send="true">Emily.Deng@amd.com</a>&gt;;
                                Gu, JiaWei (Will)
                                <br>
                                &gt; &lt;<a
                                  href="mailto:JiaWei.Gu@amd.com"
                                  moz-do-not-send="true">JiaWei.Gu@amd.com</a>&gt;<br>
                                &gt; Subject: [PATCH] drm/amdgpu: Add
                                vbios info ioctl interface<br>
                                &gt;<br>
                                &gt; Add AMDGPU_INFO_VBIOS_INFO subquery
                                id for detailed vbios info.<br>
                                &gt;<br>
                                &gt; Provides a way for the user
                                application to get the VBIOS information
                                without having to parse the binary.<br>
                                &gt; It is useful for the user to be
                                able to display in a simple way the
                                VBIOS version in their system if they
                                happen to encounter an issue.<br>
                                &gt;<br>
                                &gt; V2:<br>
                                &gt; Use numeric serial.<br>
                                &gt; Parse and expose vbios version
                                string.<br>
                                &gt;<br>
                                &gt; Signed-off-by: Jiawei Gu &lt;<a
                                  href="mailto:Jiawei.Gu@amd.com"
                                  moz-do-not-send="true">Jiawei.Gu@amd.com</a>&gt;<br>
                                &gt; Acked-by: Christian K�nig &lt;<a
                                  href="mailto:christian.koenig@amd.com"
                                  moz-do-not-send="true">christian.koenig@amd.com</a>&gt;<br>
                                &gt; ---<br>
                                &gt;��
                                drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c���
                                |� 21 +++<br>
                                &gt;��
                                drivers/gpu/drm/amd/amdgpu/atom.c���������
                                | 174 +++++++++++++++++++++<br>
                                &gt;��
                                drivers/gpu/drm/amd/amdgpu/atom.h���������
                                |� 12 ++<br>
                                &gt;��
                                drivers/gpu/drm/amd/include/atomfirmware.h
                                |�� 5 +<br>
                                &gt;��
                                include/uapi/drm/amdgpu_drm.h�������������
                                |� 16 ++<br>
                                &gt;�� 5 files changed, 228
                                insertions(+)<br>
                                &gt;<br>
                                &gt; diff --git
                                a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
                                <br>
                                &gt;
                                b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c<br>
                                &gt; index 8d12e474745a..30e4fed3de22
                                100644<br>
                                &gt; ---
                                a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c<br>
                                &gt; +++
                                b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c<br>
                                &gt; @@ -861,6 +861,27 @@ int
                                amdgpu_info_ioctl(struct drm_device
                                *dev, void *data, struct drm_file *filp)<br>
&gt;������������������������������������������� min((size_t)size,
                                (size_t)(bios_size - bios_offset)))<br>
&gt;��������������������������������������� ? -EFAULT : 0;<br>
                                &gt;��������������� }<br>
                                &gt; +������������ case
                                AMDGPU_INFO_VBIOS_INFO: {<br>
                                &gt; +�������������������� struct
                                drm_amdgpu_info_vbios vbios_info = {};<br>
                                &gt; +�������������������� struct
                                atom_context *atom_context;<br>
                                &gt; +<br>
                                &gt; +�������������������� atom_context
                                = adev-&gt;mode_info.atom_context;<br>
                                &gt; +��������������������
                                memcpy(vbios_info.name,
                                atom_context-&gt;name,
                                sizeof(atom_context-&gt;name));<br>
                                &gt; +��������������������
                                vbios_info.dbdf =
                                PCI_DEVID(adev-&gt;pdev-&gt;bus-&gt;number,
                                adev-&gt;pdev-&gt;devfn);<br>
                                &gt; +��������������������
                                memcpy(vbios_info.vbios_pn,
                                atom_context-&gt;vbios_pn,
                                sizeof(atom_context-&gt;vbios_pn));<br>
                                &gt; +��������������������
                                vbios_info.version =
                                atom_context-&gt;version;<br>
                                &gt; +��������������������
                                memcpy(vbios_info.vbios_ver_str,
                                atom_context-&gt;vbios_ver_str,<br>
                                &gt;
                                +��������������������������������������������
                                sizeof(atom_context-&gt;vbios_ver_str));<br>
                                &gt; +��������������������
                                memcpy(vbios_info.date,
                                atom_context-&gt;date,
                                sizeof(atom_context-&gt;date));<br>
                                &gt; +��������������������
                                vbios_info.serial = adev-&gt;unique_id;<br>
                                &gt; +��������������������
                                vbios_info.dev_id =
                                adev-&gt;pdev-&gt;device;<br>
                                &gt; +��������������������
                                vbios_info.rev_id =
                                adev-&gt;pdev-&gt;revision;<br>
                                &gt; +��������������������
                                vbios_info.sub_dev_id =
                                atom_context-&gt;sub_dev_id;<br>
                                &gt; +��������������������
                                vbios_info.sub_ved_id =
                                atom_context-&gt;sub_ved_id;<br>
                                &gt; +<br>
                                &gt; +�������������������� return
                                copy_to_user(out, &amp;vbios_info,<br>
                                &gt;
                                +��������������������������������������������
                                min((size_t)size, sizeof(vbios_info))) ?
                                -EFAULT : 0;<br>
                                &gt; +������������ }<br>
                                &gt;��������������� default:<br>
                                &gt;�����������������������
                                DRM_DEBUG_KMS("Invalid request %d\n",<br>
&gt;��������������������������������������� info-&gt;vbios_info.type);<br>
                                &gt; diff --git
                                a/drivers/gpu/drm/amd/amdgpu/atom.c <br>
                                &gt; b/drivers/gpu/drm/amd/amdgpu/atom.c<br>
                                &gt; index 3dcb8b32f48b..542b2c2414e4
                                100644<br>
                                &gt; ---
                                a/drivers/gpu/drm/amd/amdgpu/atom.c<br>
                                &gt; +++
                                b/drivers/gpu/drm/amd/amdgpu/atom.c<br>
                                &gt; @@ -31,6 +31,7 @@<br>
                                &gt;�� <br>
                                &gt;�� #define ATOM_DEBUG<br>
                                &gt;�� <br>
                                &gt; +#include "atomfirmware.h"<br>
                                &gt;�� #include "atom.h"<br>
                                &gt;�� #include "atom-names.h"<br>
                                &gt;�� #include "atom-bits.h"<br>
                                &gt; @@ -1299,12 +1300,168 @@ static
                                void atom_index_iio(struct atom_context
                                *ctx, int base)<br>
                                &gt;������� }<br>
                                &gt;�� }<br>
                                &gt;�� <br>
                                &gt; +static void
                                atom_get_vbios_name(struct atom_context
                                *ctx) {<br>
                                &gt; +���� unsigned char *p_rom;<br>
                                &gt; +���� unsigned char str_num;<br>
                                &gt; +���� unsigned short
                                off_to_vbios_str;<br>
                                &gt; +���� unsigned char *c_ptr;<br>
                                &gt; +���� int name_size;<br>
                                &gt; +���� int i;<br>
                                &gt; +<br>
                                &gt; +���� const char *na = "--N/A--";<br>
                                &gt; +���� char *back;<br>
                                &gt; +<br>
                                &gt; +���� p_rom = ctx-&gt;bios;<br>
                                &gt; +<br>
                                &gt; +���� str_num = *(p_rom +
                                OFFSET_TO_GET_ATOMBIOS_NUMBER_OF_STRINGS);<br>
                                &gt; +���� if (str_num != 0) {<br>
                                &gt; +������������ off_to_vbios_str =<br>
                                &gt; +�������������������� *(unsigned
                                short *)(p_rom +
                                OFFSET_TO_GET_ATOMBIOS_STRING_START);<br>
                                &gt; +<br>
                                &gt; +������������ c_ptr = (unsigned
                                char *)(p_rom + off_to_vbios_str);<br>
                                &gt; +���� } else {<br>
                                &gt; +������������ /* do not know where
                                to find name */<br>
                                &gt; +������������ memcpy(ctx-&gt;name,
                                na, 7);<br>
                                &gt; +������������ ctx-&gt;name[7] = 0;<br>
                                &gt; +������������ return;<br>
                                &gt; +���� }<br>
                                &gt; +<br>
                                &gt; +���� /*<br>
                                &gt; +����� * skip the atombios strings,
                                usually 4<br>
                                &gt; +����� * 1st is P/N, 2nd is ASIC,
                                3rd is PCI type, 4th is Memory type<br>
                                &gt; +����� */<br>
                                &gt; +���� for (i = 0; i &lt; str_num;
                                i++) {<br>
                                &gt; +������������ while (*c_ptr != 0)<br>
                                &gt; +�������������������� c_ptr++;<br>
                                &gt; +������������ c_ptr++;<br>
                                &gt; +���� }<br>
                                &gt; +<br>
                                &gt; +���� /* skip the following 2
                                chars: 0x0D 0x0A */<br>
                                &gt; +���� c_ptr += 2;<br>
                                &gt; +<br>
                                &gt; +���� name_size = strnlen(c_ptr,
                                STRLEN_LONG - 1);<br>
                                &gt; +���� memcpy(ctx-&gt;name, c_ptr,
                                name_size);<br>
                                &gt; +���� back = ctx-&gt;name +
                                name_size;<br>
                                &gt; +���� while ((*--back) == ' ')<br>
                                &gt; +������������ ;<br>
                                &gt; +���� *(back + 1) = '\0';<br>
                                &gt; +}<br>
                                &gt; +<br>
                                &gt; +static void
                                atom_get_vbios_date(struct atom_context
                                *ctx) {<br>
                                &gt; +���� unsigned char *p_rom;<br>
                                &gt; +���� unsigned char *date_in_rom;<br>
                                &gt; +<br>
                                &gt; +���� p_rom = ctx-&gt;bios;<br>
                                &gt; +<br>
                                &gt; +���� date_in_rom = p_rom +
                                OFFSET_TO_VBIOS_DATE;<br>
                                &gt; +<br>
                                &gt; +���� ctx-&gt;date[0] = '2';<br>
                                &gt; +���� ctx-&gt;date[1] = '0';<br>
                                &gt; +���� ctx-&gt;date[2] =
                                date_in_rom[6];<br>
                                &gt; +���� ctx-&gt;date[3] =
                                date_in_rom[7];<br>
                                &gt; +���� ctx-&gt;date[4] = '/';<br>
                                &gt; +���� ctx-&gt;date[5] =
                                date_in_rom[0];<br>
                                &gt; +���� ctx-&gt;date[6] =
                                date_in_rom[1];<br>
                                &gt; +���� ctx-&gt;date[7] = '/';<br>
                                &gt; +���� ctx-&gt;date[8] =
                                date_in_rom[3];<br>
                                &gt; +���� ctx-&gt;date[9] =
                                date_in_rom[4];<br>
                                &gt; +���� ctx-&gt;date[10] = ' ';<br>
                                &gt; +���� ctx-&gt;date[11] =
                                date_in_rom[9];<br>
                                &gt; +���� ctx-&gt;date[12] =
                                date_in_rom[10];<br>
                                &gt; +���� ctx-&gt;date[13] =
                                date_in_rom[11];<br>
                                &gt; +���� ctx-&gt;date[14] =
                                date_in_rom[12];<br>
                                &gt; +���� ctx-&gt;date[15] =
                                date_in_rom[13];<br>
                                &gt; +���� ctx-&gt;date[16] = '\0';<br>
                                &gt; +}<br>
                                &gt; +<br>
                                &gt; +static unsigned char
                                *atom_find_str_in_rom(struct
                                atom_context *ctx, char *str, int start,<br>
                                &gt;
                                +���������������������������������������
                                int end, int maxlen)<br>
                                &gt; +{<br>
                                &gt; +���� unsigned long str_off;<br>
                                &gt; +���� unsigned char *p_rom;<br>
                                &gt; +���� unsigned short str_len;<br>
                                &gt; +<br>
                                &gt; +���� str_off = 0;<br>
                                &gt; +���� str_len = strnlen(str,
                                maxlen);<br>
                                &gt; +���� p_rom = ctx-&gt;bios;<br>
                                &gt; +<br>
                                &gt; +���� for (; start &lt;= end;
                                ++start) {<br>
                                &gt; +������������ for (str_off = 0;
                                str_off &lt; str_len; ++str_off) {<br>
                                &gt; +�������������������� if
                                (str[str_off] != *(p_rom + start +
                                str_off))<br>
                                &gt; +����������������������������
                                break;<br>
                                &gt; +������������ }<br>
                                &gt; +<br>
                                &gt; +������������ if (str_off ==
                                str_len || str[str_off] == 0)<br>
                                &gt; +�������������������� return p_rom
                                + start;<br>
                                &gt; +���� }<br>
                                &gt; +���� return NULL;<br>
                                &gt; +}<br>
                                &gt; +<br>
                                &gt; +static void
                                atom_get_vbios_pn(struct atom_context
                                *ctx) {<br>
                                &gt; +���� unsigned char *p_rom;<br>
                                &gt; +���� unsigned short
                                off_to_vbios_str;<br>
                                &gt; +���� unsigned char *vbios_str;<br>
                                &gt; +���� int count;<br>
                                &gt; +<br>
                                &gt; +���� off_to_vbios_str = 0;<br>
                                &gt; +���� p_rom = ctx-&gt;bios;<br>
                                &gt; +<br>
                                &gt; +���� if (*(p_rom +
                                OFFSET_TO_GET_ATOMBIOS_NUMBER_OF_STRINGS)
                                != 0) {<br>
                                &gt; +������������ off_to_vbios_str =<br>
                                &gt; +�������������������� *(unsigned
                                short *)(p_rom +
                                OFFSET_TO_GET_ATOMBIOS_STRING_START);<br>
                                &gt; +<br>
                                &gt; +������������ vbios_str = (unsigned
                                char *)(p_rom + off_to_vbios_str);<br>
                                &gt; +���� } else {<br>
                                &gt; +������������ vbios_str = p_rom +
                                OFFSET_TO_VBIOS_PART_NUMBER;<br>
                                &gt; +���� }<br>
                                &gt; +<br>
                                &gt; +���� if (*vbios_str == 0) {<br>
                                &gt; +������������ vbios_str =
                                atom_find_str_in_rom(ctx,
                                BIOS_ATOM_PREFIX, 3, 1024, 64);<br>
                                &gt; +������������ if (vbios_str ==
                                NULL)<br>
                                &gt; +�������������������� vbios_str +=
                                sizeof(BIOS_ATOM_PREFIX) - 1;<br>
                                &gt; +���� }<br>
                                &gt; +���� if (vbios_str != NULL
                                &amp;&amp; *vbios_str == 0)<br>
                                &gt; +������������ vbios_str++;<br>
                                &gt; +<br>
                                &gt; +���� if (vbios_str != NULL) {<br>
                                &gt; +������������ count = 0;<br>
                                &gt; +������������ while ((count &lt;
                                BIOS_STRING_LENGTH) &amp;&amp;
                                vbios_str[count] &gt;= ' ' &amp;&amp;<br>
                                &gt; +�������������������
                                vbios_str[count] &lt;= 'z') {<br>
                                &gt; +��������������������
                                ctx-&gt;vbios_pn[count] =
                                vbios_str[count];<br>
                                &gt; +�������������������� count++;<br>
                                &gt; +������������ }<br>
                                &gt; +<br>
                                &gt; +������������
                                ctx-&gt;vbios_pn[count] = 0;<br>
                                &gt; +���� }<br>
                                &gt; +}<br>
                                &gt; +<br>
                                &gt; +static void
                                atom_get_vbios_version(struct
                                atom_context *ctx) {<br>
                                &gt; +���� unsigned char *vbios_ver;<br>
                                &gt; +<br>
                                &gt; +���� /* find anchor ATOMBIOSBK-AMD
                                */<br>
                                &gt; +���� vbios_ver =
                                atom_find_str_in_rom(ctx,
                                BIOS_VERSION_PREFIX, 3, 1024, 64);<br>
                                &gt; +���� if (vbios_ver != NULL) {<br>
                                &gt; +������������ /* skip
                                ATOMBIOSBK-AMD VER */<br>
                                &gt; +������������ vbios_ver += 18;<br>
                                &gt; +������������
                                memcpy(ctx-&gt;vbios_ver_str, vbios_ver,
                                STRLEN_NORMAL);<br>
                                &gt; +���� } else {<br>
                                &gt; +������������
                                ctx-&gt;vbios_ver_str[0] = '\0';<br>
                                &gt; +���� }<br>
                                &gt; +}<br>
                                &gt; +<br>
                                &gt;�� struct atom_context
                                *amdgpu_atom_parse(struct card_info
                                *card, void *bios)� {<br>
                                &gt;������� int base;<br>
                                &gt;������� struct atom_context *ctx =<br>
                                &gt;����������� kzalloc(sizeof(struct
                                atom_context), GFP_KERNEL);<br>
                                &gt;������� char *str;<br>
                                &gt; +���� struct _ATOM_ROM_HEADER
                                *atom_rom_header;<br>
                                &gt; +���� struct
                                _ATOM_MASTER_DATA_TABLE *master_table;<br>
                                &gt; +���� struct _ATOM_FIRMWARE_INFO
                                *atom_fw_info;<br>
                                &gt;������� u16 idx;<br>
                                &gt;�� <br>
                                &gt;������� if (!ctx)<br>
                                &gt; @@ -1353,6 +1510,23 @@ struct
                                atom_context *amdgpu_atom_parse(struct
                                card_info *card, void *bios)<br>
                                &gt;���������������
                                strlcpy(ctx-&gt;vbios_version, str,
                                sizeof(ctx-&gt;vbios_version));<br>
                                &gt;������� }<br>
                                &gt;�� <br>
                                &gt; +���� atom_rom_header = (struct
                                _ATOM_ROM_HEADER *)CSTR(base);<br>
                                &gt; +���� ctx-&gt;sub_dev_id =
                                atom_rom_header-&gt;usSubsystemVendorID;<br>
                                &gt; +���� ctx-&gt;sub_ved_id =
                                atom_rom_header-&gt;usSubsystemID;<br>
                                &gt; +���� if
                                (atom_rom_header-&gt;usMasterDataTableOffset
                                != 0) {<br>
                                &gt; +������������ master_table =
                                (struct _ATOM_MASTER_DATA_TABLE *)<br>
                                &gt; +����������������������������
                                CSTR(atom_rom_header-&gt;usMasterDataTableOffset);<br>
                                &gt; +������������ if
                                (master_table-&gt;ListOfDataTables.FirmwareInfo
                                != 0) {<br>
                                &gt; +�������������������� atom_fw_info
                                = (struct _ATOM_FIRMWARE_INFO *)<br>
                                &gt;
                                +������������������������������������
                                CSTR(master_table-&gt;ListOfDataTables.FirmwareInfo);<br>
                                &gt; +��������������������
                                ctx-&gt;version =
                                atom_fw_info-&gt;ulFirmwareRevision;<br>
                                &gt; +������������ }<br>
                                &gt; +���� }<br>
                                &gt; +<br>
                                &gt; +���� atom_get_vbios_name(ctx);<br>
                                &gt; +���� atom_get_vbios_pn(ctx);<br>
                                &gt; +���� atom_get_vbios_date(ctx);<br>
                                &gt; +���� atom_get_vbios_version(ctx);<br>
                                &gt;�� <br>
                                &gt;������� return ctx;<br>
                                &gt;�� }<br>
                                &gt; diff --git
                                a/drivers/gpu/drm/amd/amdgpu/atom.h <br>
                                &gt; b/drivers/gpu/drm/amd/amdgpu/atom.h<br>
                                &gt; index d279759cab47..6463ce6e756d
                                100644<br>
                                &gt; ---
                                a/drivers/gpu/drm/amd/amdgpu/atom.h<br>
                                &gt; +++
                                b/drivers/gpu/drm/amd/amdgpu/atom.h<br>
                                &gt; @@ -112,6 +112,10 @@ struct
                                drm_device;<br>
                                &gt;�� #define
                                ATOM_IO_SYSIO�������������� 2<br>
                                &gt;�� #define ATOM_IO_IIO�������� 0x80<br>
                                &gt;�� <br>
                                &gt; +#define
                                STRLEN_NORMAL��������������� 32<br>
                                &gt; +#define STRLEN_LONG��������� 64<br>
                                &gt; +#define
                                STRLEN_VERYLONG������������� 254<br>
                                &gt; +<br>
                                &gt;�� struct card_info {<br>
                                &gt;������� struct drm_device *dev;<br>
                                &gt;������� void (* reg_write)(struct
                                card_info *, uint32_t, uint32_t);�� /*�
                                filled by driver */<br>
                                &gt; @@ -140,6 +144,14 @@ struct
                                atom_context {<br>
                                &gt;������� uint32_t *scratch;<br>
                                &gt;������� int scratch_size_bytes;<br>
                                &gt;������� char vbios_version[20];<br>
                                &gt; +<br>
                                &gt; +���� uint8_t name[STRLEN_LONG];<br>
                                &gt; +���� uint8_t
                                vbios_pn[STRLEN_LONG];<br>
                                &gt; +���� uint32_t version;<br>
                                &gt; +���� uint8_t
                                vbios_ver_str[STRLEN_NORMAL];<br>
                                &gt; +���� uint8_t date[STRLEN_NORMAL];<br>
                                &gt; +���� uint32_t sub_dev_id;<br>
                                &gt; +���� uint32_t sub_ved_id;<br>
                                &gt;�� };<br>
                                &gt;�� <br>
                                &gt;�� extern int amdgpu_atom_debug;<br>
                                &gt; diff --git
                                a/drivers/gpu/drm/amd/include/atomfirmware.h
                                <br>
                                &gt;
                                b/drivers/gpu/drm/amd/include/atomfirmware.h<br>
                                &gt; index 275468e4be60..28deecc2f990
                                100644<br>
                                &gt; ---
                                a/drivers/gpu/drm/amd/include/atomfirmware.h<br>
                                &gt; +++
                                b/drivers/gpu/drm/amd/include/atomfirmware.h<br>
                                &gt; @@ -197,6 +197,9 @@ enum
                                atom_dp_vs_preemph_def{<br>
                                &gt;���� DP_VS_LEVEL0_PREEMPH_LEVEL3 =
                                0x18,<br>
                                &gt;�� };<br>
                                &gt;�� <br>
                                &gt; +#define BIOS_ATOM_PREFIX��
                                "ATOMBIOS"<br>
                                &gt; +#define BIOS_VERSION_PREFIX�
                                "ATOMBIOSBK-AMD"<br>
                                &gt; +#define BIOS_STRING_LENGTH 43<br>
                                &gt;�� <br>
                                &gt;�� /*<br>
                                &gt;�� enum atom_string_def{<br>
                                &gt; @@ -215,6 +218,8 @@ enum
                                atombios_image_offset{<br>
                                &gt;����
                                MAXSIZE_OF_ATOMBIOS_ASIC_BUS_MEM_TYPE�����
                                = 20,� /*including the terminator 0x0!*/<br>
                                &gt;����
                                OFFSET_TO_GET_ATOMBIOS_NUMBER_OF_STRINGS��
                                = 0x2f,<br>
                                &gt;����
                                OFFSET_TO_GET_ATOMBIOS_STRING_START�������
                                = 0x6e,<br>
                                &gt; +�
                                OFFSET_TO_VBIOS_PART_NUMBER���������������
                                = 0x80,<br>
                                &gt; +�
                                OFFSET_TO_VBIOS_DATE����������������������
                                = 0x50,<br>
                                &gt;�� };<br>
                                &gt;�� <br>
                                &gt;�� <br>
                                &gt;
                                /*********************************************************************<br>
                                &gt; ******* diff --git
                                a/include/uapi/drm/amdgpu_drm.h <br>
                                &gt; b/include/uapi/drm/amdgpu_drm.h
                                index 9169df7fadee..e0f98ca9a755 <br>
                                &gt; 100644<br>
                                &gt; --- a/include/uapi/drm/amdgpu_drm.h<br>
                                &gt; +++ b/include/uapi/drm/amdgpu_drm.h<br>
                                &gt; @@ -756,6 +756,8 @@ struct
                                drm_amdgpu_cs_chunk_data {<br>
                                &gt;������� #define
                                AMDGPU_INFO_VBIOS_SIZE��������� 0x1<br>
                                &gt;������� /* Subquery id: Query vbios
                                image */<br>
                                &gt;������� #define
                                AMDGPU_INFO_VBIOS_IMAGE�������� 0x2<br>
                                &gt; +���� /* Subquery id: Query vbios
                                info */<br>
                                &gt; +���� #define
                                AMDGPU_INFO_VBIOS_INFO��������� 0x3<br>
                                &gt;�� /* Query UVD handles */<br>
                                &gt;�� #define
                                AMDGPU_INFO_NUM_HANDLES��������������������
                                0x1C<br>
                                &gt;�� /* Query sensor related
                                information */ @@ -949,6 +951,20 @@
                                struct <br>
                                &gt; drm_amdgpu_info_firmware {<br>
                                &gt;������� __u32 feature;<br>
                                &gt;�� };<br>
                                &gt;�� <br>
                                &gt; +struct drm_amdgpu_info_vbios {<br>
                                &gt; +���� __u8 name[64];<br>
                                &gt; +���� __u32 dbdf;<br>
                                &gt; +���� __u8 vbios_pn[64];<br>
                                &gt; +���� __u32 version;<br>
                                &gt; +���� __u8 vbios_ver_str[32];<br>
                                &gt; +���� __u8 date[32];<br>
                                &gt; +���� __u64 serial;<br>
                                &gt; +���� __u32 dev_id;<br>
                                &gt; +���� __u32 rev_id;<br>
                                &gt; +���� __u32 sub_dev_id;<br>
                                &gt; +���� __u32 sub_ved_id;<br>
                                &gt; +};<br>
                                &gt; +<br>
                                &gt;�� #define AMDGPU_VRAM_TYPE_UNKNOWN
                                0<br>
                                &gt;�� #define AMDGPU_VRAM_TYPE_GDDR1 1<br>
                                &gt;�� #define AMDGPU_VRAM_TYPE_DDR2� 2<br>
                                &gt; --<br>
                                &gt; 2.17.1<o:p></o:p></p>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <p class="MsoNormal" style="margin-bottom:12.0pt"><o:p>�</o:p></p>
          <pre>_______________________________________________<o:p></o:p></pre>
          <pre>amd-gfx mailing list<o:p></o:p></pre>
          <pre><a href="mailto:amd-gfx@lists.freedesktop.org" moz-do-not-send="true">amd-gfx@lists.freedesktop.org</a><o:p></o:p></pre>
          <pre><a href="https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=04%7C01%7CJiaWei.Gu%40amd.com%7Ccd8e7257279a437d9b2208d91ac93b3e%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637570273857847028%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=zhrziSJ55q4VfYYd23yKYoIQdocTAtZ4v%2FyKvU9TJhs%3D&amp;reserved=0" moz-do-not-send="true">https://lists.freedesktop.org/mailman/listinfo/amd-gfx</a><o:p></o:p></pre>
        </blockquote>
        <p class="MsoNormal"><o:p>�</o:p></p>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------9E3011F55D0CCC43B3B5EECE--

--===============1801047705==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--===============1801047705==--
