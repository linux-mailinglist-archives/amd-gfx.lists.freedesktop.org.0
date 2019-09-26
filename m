Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4120BF95B
	for <lists+amd-gfx@lfdr.de>; Thu, 26 Sep 2019 20:41:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED3946EDC2;
	Thu, 26 Sep 2019 18:41:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760053.outbound.protection.outlook.com [40.107.76.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FDD66EDDD
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Sep 2019 18:41:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FuC9D7S5aHt0UJAYZ/PdL8NHsROd1FY5TkZiTvls1/Fo4vq27+9kNfB4h4xXp/4cl7rG9nlkuN/vvxVr2NgMVNXNd0D+Jghz6si1TC3YhdCtMNcm+jiLuhGcMg11J9SQgCbhgAAEYWQsH6ljTjhp4Rl8h7e8mqBEJzrCkDWihBmp9ko04/MfVeNJ2EcQg5YeXKxqxXpwD7q18LJ5ZY2B25dU/MYQI6Vwfv3R3oaYccNIT4FKBBorrYlgD3pWqHcfvbMSMCeJEwURL0R2B6m+oxmU5FOgQoIWsngMxFcYiActWGeIkNBTuxEVp1+lnToYDBxPuptAbIF51iEDz7VtfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HnmcGz5dMs6Qi/xVVskltKglWbHIyMH0TnniQxc3iCk=;
 b=TqH/iz3mw2/qYqsPP93+YD7zpQ/lSPuvs0kdoEfNQ1dY3bTPedtWJxRCVMxjje+Ug7ijImYxlrI4ofsppbm8Jc5+Aqlh5IWoExH5830VZ6FH5ho/Mi/LC5nxFQiRhvB+fpxXfasWaEBUHgf71W4YaehwvFk6Xwo0JMfgaR1yT8tP6dlqENDw2F1/y/EjAuxkC0QD4lHnlaDWUj24IYK1LmDIebgLDB5riMgwDsHt945biZR1ZAn178W/Yi1NcaQjpu6MLA4e/uPi5clPYoKaww6aZN+0IEwq2lph6iYnQTA/7nBpsy3H2AssXy2hCWMVhM6oY65A7QExzs1B0S3ZhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB2778.namprd12.prod.outlook.com (20.176.114.145) by
 DM6PR12MB3466.namprd12.prod.outlook.com (20.178.198.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.26; Thu, 26 Sep 2019 18:41:52 +0000
Received: from DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::81aa:9739:a2c2:12fa]) by DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::81aa:9739:a2c2:12fa%4]) with mapi id 15.20.2284.023; Thu, 26 Sep 2019
 18:41:52 +0000
From: "Zhao, Yong" <Yong.Zhao@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 3/3] drm/amdkfd: Remove the control stack workaround for
 GFX10
Thread-Topic: [PATCH 3/3] drm/amdkfd: Remove the control stack workaround for
 GFX10
Thread-Index: AQHVc80/rILqZ5+AA0KhlrYPxnfn6qc8ta2A//+/aoCAAcnF9A==
Date: Thu, 26 Sep 2019 18:41:52 +0000
Message-ID: <DM6PR12MB2778D26FD0EC07F2DA570340F0860@DM6PR12MB2778.namprd12.prod.outlook.com>
References: <20190925181527.17091-1-Yong.Zhao@amd.com>
 <20190925181527.17091-3-Yong.Zhao@amd.com>
 <3d63ddfd-2773-b89d-c0dc-75ac1397b1fc@amd.com>,
 <09afdf34-0c72-5306-103a-1290734fa1a2@amd.com>
In-Reply-To: <09afdf34-0c72-5306-103a-1290734fa1a2@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.54.211]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 416ae741-76c3-4c61-9e0e-08d742b132b0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3466; 
x-ms-traffictypediagnostic: DM6PR12MB3466:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB3466001576869C38020CE0A8F0860@DM6PR12MB3466.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(39860400002)(366004)(396003)(346002)(189003)(199004)(11346002)(476003)(6436002)(229853002)(6306002)(54896002)(7736002)(9686003)(14454004)(74316002)(8936002)(81156014)(81166006)(6246003)(8676002)(256004)(33656002)(5660300002)(14444005)(19627405001)(86362001)(110136005)(316002)(606006)(76176011)(2501003)(2906002)(186003)(3846002)(6116002)(99286004)(7696005)(71200400001)(71190400001)(102836004)(105004)(25786009)(26005)(52536014)(236005)(66066001)(55016002)(53546011)(6506007)(76116006)(478600001)(91956017)(64756008)(66556008)(486006)(66446008)(446003)(66946007)(966005)(66476007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3466;
 H:DM6PR12MB2778.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: AMwRjW+m1PIC27yLAGqjShu+1YnOTVzdVMRDb/0HQhM9ITLj2w+s/dNScMaIXpkM/K7AsGmoLYYbRiQNJnQAIUePto7tfm76GPuy+yMDNgepVQJXv/5q0X7VheXtJ42KuosQ0OuHT6UAx6VQHKqDAAh5NchG5tIdD5nPbhwJV+TL0o2bNDjxJWVSca2Im3zsyZhDwpIQNe7rrHSceyyvmKNbWGnW/sLcr7OnTSyH+rShlK2NQmbpWTz1wTq7Y0TQxeSnwfCzAkZpH0wWDv2Bl43S3LZ2iZHqtm6+vpOLT1OtbdVCU0sCnmnm+pQWpPDA1Pr08j0MPa03My17bxEFSso9MK6pchKFfTyXcu5vWV+DRQ8tp7XkGzPcLBvFEVpHnOjJAdWA9gnIt27lE8xIX2Bgp9zv0OWzuoLbZpE3EsLZUAHwS8dHLXnDVCriXMrOwR6MTsykHg9qO1qLmjumTA==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 416ae741-76c3-4c61-9e0e-08d742b132b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 18:41:52.1465 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JMpHuyQ56UePqwHFf+rPfzUNjEsD3juUZdqsEaxEbe/e0GiGBRJoJmblBsObL7pU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3466
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HnmcGz5dMs6Qi/xVVskltKglWbHIyMH0TnniQxc3iCk=;
 b=eAsT4iY3TKPr8l10wBr2S2TK9qObo6tujv0qqvNdtrpGL3EcZD7dZfhFwcW2tWTXzCVa2731RQXQWF3hYnK5lxKOciVZ/XKrTTU3oR5W0lkhrjuMcq2P632Om/WK59km13fQh9jRpzGsXsv7x9Rr+xY7V26pkIfYboInwI/eyTI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Yong.Zhao@amd.com; 
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0908116970=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0908116970==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DM6PR12MB2778D26FD0EC07F2DA570340F0860DM6PR12MB2778namp_"

--_000_DM6PR12MB2778D26FD0EC07F2DA570340F0860DM6PR12MB2778namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Felix,

I reworded this patch in the next series. Please review the first two patch=
es in this series.

Regards,
Yong
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Zhao, Yo=
ng <Yong.Zhao@amd.com>
Sent: Wednesday, September 25, 2019 2:34 PM
To: Kuehling, Felix <Felix.Kuehling@amd.com>; amd-gfx@lists.freedesktop.org=
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 3/3] drm/amdkfd: Remove the control stack workaround fo=
r GFX10

Yes. I confirmed with CP guys and they said the behavior on GFX10 is the
same as GFX8 now. I remember that the workaround on GFX9 was to help
with a HW bug, but not too sure.

Regards,

Yong

On 2019-09-25 2:25 p.m., Kuehling, Felix wrote:
> On 2019-09-25 2:15 p.m., Zhao, Yong wrote:
>> The GFX10 does not have this hardware bug any more, so remove it.
> I wouldn't call this a bug and a workaround. More like a change in the
> HW or FW behaviour and a corresponding driver change. I.e. in GFXv8 the
> control stack was in the user mode CWSR allocation. In GFXv9 it moved
> into a kernel mode buffer next to the MQD. So in GFXv10 the control
> stack moved back into the user mode CWSR buffer?
>
> Regards,
>     Felix
>
>> Change-Id: I446c9685549a09ac8846a42ee22d86cfb93fd98c
>> Signed-off-by: Yong Zhao <Yong.Zhao@amd.com>
>> ---
>>    .../gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c  | 37 ++----------------=
-
>>    1 file changed, 4 insertions(+), 33 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c b/drivers/=
gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c
>> index 9cd3eb2d90bd..4a236b2c2354 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c
>> @@ -69,35 +69,13 @@ static void update_cu_mask(struct mqd_manager *mm, v=
oid *mqd,
>>    static struct kfd_mem_obj *allocate_mqd(struct kfd_dev *kfd,
>>               struct queue_properties *q)
>>    {
>> -    int retval;
>> -    struct kfd_mem_obj *mqd_mem_obj =3D NULL;
>> +    struct kfd_mem_obj *mqd_mem_obj;
>>
>> -    /* From V9,  for CWSR, the control stack is located on the next pag=
e
>> -     * boundary after the mqd, we will use the gtt allocation function
>> -     * instead of sub-allocation function.
>> -     */
>> -    if (kfd->cwsr_enabled && (q->type =3D=3D KFD_QUEUE_TYPE_COMPUTE)) {
>> -            mqd_mem_obj =3D kzalloc(sizeof(struct kfd_mem_obj), GFP_NOI=
O);
>> -            if (!mqd_mem_obj)
>> -                    return NULL;
>> -            retval =3D amdgpu_amdkfd_alloc_gtt_mem(kfd->kgd,
>> -                    ALIGN(q->ctl_stack_size, PAGE_SIZE) +
>> -                            ALIGN(sizeof(struct v10_compute_mqd), PAGE_=
SIZE),
>> -                    &(mqd_mem_obj->gtt_mem),
>> -                    &(mqd_mem_obj->gpu_addr),
>> -                    (void *)&(mqd_mem_obj->cpu_ptr), true);
>> -    } else {
>> -            retval =3D kfd_gtt_sa_allocate(kfd, sizeof(struct v10_compu=
te_mqd),
>> -                            &mqd_mem_obj);
>> -    }
>> -
>> -    if (retval) {
>> -            kfree(mqd_mem_obj);
>> +    if (kfd_gtt_sa_allocate(kfd, sizeof(struct v10_compute_mqd),
>> +                    &mqd_mem_obj))
>>               return NULL;
>> -    }
>>
>>       return mqd_mem_obj;
>> -
>>    }
>>
>>    static void init_mqd(struct mqd_manager *mm, void **mqd,
>> @@ -250,14 +228,7 @@ static int destroy_mqd(struct mqd_manager *mm, void=
 *mqd,
>>    static void free_mqd(struct mqd_manager *mm, void *mqd,
>>                       struct kfd_mem_obj *mqd_mem_obj)
>>    {
>> -    struct kfd_dev *kfd =3D mm->dev;
>> -
>> -    if (mqd_mem_obj->gtt_mem) {
>> -            amdgpu_amdkfd_free_gtt_mem(kfd->kgd, mqd_mem_obj->gtt_mem);
>> -            kfree(mqd_mem_obj);
>> -    } else {
>> -            kfd_gtt_sa_free(mm->dev, mqd_mem_obj);
>> -    }
>> +    kfd_gtt_sa_free(mm->dev, mqd_mem_obj);
>>    }
>>
>>    static bool is_occupied(struct mqd_manager *mm, void *mqd,
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_DM6PR12MB2778D26FD0EC07F2DA570340F0860DM6PR12MB2778namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi Felix,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I reworded this patch in the next series. Please review the first two patch=
es in this series.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;">Yong&nbsp;</span></div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Zhao, Yong &lt;Yong.Zhao@amd.=
com&gt;<br>
<b>Sent:</b> Wednesday, September 25, 2019 2:34 PM<br>
<b>To:</b> Kuehling, Felix &lt;Felix.Kuehling@amd.com&gt;; amd-gfx@lists.fr=
eedesktop.org &lt;amd-gfx@lists.freedesktop.org&gt;<br>
<b>Subject:</b> Re: [PATCH 3/3] drm/amdkfd: Remove the control stack workar=
ound for GFX10</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Yes. I confirmed with CP guys and they said the be=
havior on GFX10 is the
<br>
same as GFX8 now. I remember that the workaround on GFX9 was to help <br>
with a HW bug, but not too sure.<br>
<br>
Regards,<br>
<br>
Yong<br>
<br>
On 2019-09-25 2:25 p.m., Kuehling, Felix wrote:<br>
&gt; On 2019-09-25 2:15 p.m., Zhao, Yong wrote:<br>
&gt;&gt; The GFX10 does not have this hardware bug any more, so remove it.<=
br>
&gt; I wouldn't call this a bug and a workaround. More like a change in the=
<br>
&gt; HW or FW behaviour and a corresponding driver change. I.e. in GFXv8 th=
e<br>
&gt; control stack was in the user mode CWSR allocation. In GFXv9 it moved<=
br>
&gt; into a kernel mode buffer next to the MQD. So in GFXv10 the control<br=
>
&gt; stack moved back into the user mode CWSR buffer?<br>
&gt;<br>
&gt; Regards,<br>
&gt;&nbsp;&nbsp; &nbsp; Felix<br>
&gt;<br>
&gt;&gt; Change-Id: I446c9685549a09ac8846a42ee22d86cfb93fd98c<br>
&gt;&gt; Signed-off-by: Yong Zhao &lt;Yong.Zhao@amd.com&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; .../gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c&nbs=
p; | 37 &#43;&#43;-----------------<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; 1 file changed, 4 insertions(&#43;), 33 deletion=
s(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c b/dr=
ivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c<br>
&gt;&gt; index 9cd3eb2d90bd..4a236b2c2354 100644<br>
&gt;&gt; --- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c<br>
&gt;&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c=
<br>
&gt;&gt; @@ -69,35 &#43;69,13 @@ static void update_cu_mask(struct mqd_mana=
ger *mm, void *mqd,<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; static struct kfd_mem_obj *allocate_mqd(struct k=
fd_dev *kfd,<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; struct queue_properties *q)<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; {<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp; int retval;<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp; struct kfd_mem_obj *mqd_mem_obj =3D NULL;<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp; struct kfd_mem_obj *mqd_mem_obj;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; <br>
&gt;&gt; -&nbsp;&nbsp;&nbsp; /* From V9,&nbsp; for CWSR, the control stack =
is located on the next page<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp; * boundary after the mqd, we will use th=
e gtt allocation function<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp; * instead of sub-allocation function.<br=
>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp; if (kfd-&gt;cwsr_enabled &amp;&amp; (q-&gt;typ=
e =3D=3D KFD_QUEUE_TYPE_COMPUTE)) {<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; mqd_mem_obj =3D kzalloc(sizeof(struct kfd_mem_obj), GFP_NOIO);<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; if (!mqd_mem_obj)<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return NULL;<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; retval =3D amdgpu_amdkfd_alloc_gtt_mem(kfd-&gt;kgd,<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ALIGN(q-&gt;ctl_stack_siz=
e, PAGE_SIZE) &#43;<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; ALIGN(sizeof(struct v10_compute_mqd), PAGE_SIZE),<br=
>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;(mqd_mem_obj-&gt;gtt=
_mem),<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;(mqd_mem_obj-&gt;gpu=
_addr),<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (void *)&amp;(mqd_mem_obj=
-&gt;cpu_ptr), true);<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp; } else {<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; retval =3D kfd_gtt_sa_allocate(kfd, sizeof(struct v10_compute_mqd),<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; &amp;mqd_mem_obj);<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp; }<br>
&gt;&gt; -<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp; if (retval) {<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; kfree(mqd_mem_obj);<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp; if (kfd_gtt_sa_allocate(kfd, sizeof(struct=
 v10_compute_mqd),<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;mqd_mem_obj))<br=
>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; return NULL;<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp; }<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; <br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return mqd_mem_obj;<br>
&gt;&gt; -<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; }<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; <br>
&gt;&gt;&nbsp;&nbsp;&nbsp; static void init_mqd(struct mqd_manager *mm, voi=
d **mqd,<br>
&gt;&gt; @@ -250,14 &#43;228,7 @@ static int destroy_mqd(struct mqd_manager=
 *mm, void *mqd,<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; static void free_mqd(struct mqd_manager *mm, voi=
d *mqd,<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct kf=
d_mem_obj *mqd_mem_obj)<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; {<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp; struct kfd_dev *kfd =3D mm-&gt;dev;<br>
&gt;&gt; -<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp; if (mqd_mem_obj-&gt;gtt_mem) {<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; amdgpu_amdkfd_free_gtt_mem(kfd-&gt;kgd, mqd_mem_obj-&gt;gtt_mem);<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; kfree(mqd_mem_obj);<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp; } else {<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; kfd_gtt_sa_free(mm-&gt;dev, mqd_mem_obj);<br>
&gt;&gt; -&nbsp;&nbsp;&nbsp; }<br>
&gt;&gt; &#43;&nbsp;&nbsp;&nbsp; kfd_gtt_sa_free(mm-&gt;dev, mqd_mem_obj);<=
br>
&gt;&gt;&nbsp;&nbsp;&nbsp; }<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; <br>
&gt;&gt;&nbsp;&nbsp;&nbsp; static bool is_occupied(struct mqd_manager *mm, =
void *mqd,<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
</span></font></div>
</body>
</html>

--_000_DM6PR12MB2778D26FD0EC07F2DA570340F0860DM6PR12MB2778namp_--

--===============0908116970==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0908116970==--
