Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7B0C25E7
	for <lists+amd-gfx@lfdr.de>; Mon, 30 Sep 2019 20:05:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C158E6E098;
	Mon, 30 Sep 2019 18:05:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam04on060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe4d::60b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BCC56E098
 for <amd-gfx@lists.freedesktop.org>; Mon, 30 Sep 2019 18:05:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nVFgylKI+niCdsEAXAhtnCezZYx43TV8EwXrm7jbkr/GGmRs5cKYJYU4KMP38L4NAUZ02kSCJLw4WGhtFwvsMg/vfXBFExncTiOQorFUxD2vful/q/wqmj6uTGRpYSjAhVqd+NXXDqVyLZk2FWjIs4IdeSEwhq2APvVnupZTHAnjSSXoDS7XHyFmztDrTXlWsYNGaJOnca6aOsWxUEq9tuhUXvbKJLpXq0SQmNUaBeTrFwhgtHdA5WLw4EKZSJTfGlOfqT/b0MzCs5gGSI+BTEZFnvXMqpwAdofDA01UwbqMuWkez4xScQul0Z3cjibRtobb9epXfE3VknnOkKl2Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HEO07SkRp/pNT6vhQhqF/eBBKHLuK1Wc5OtUg6p/wjM=;
 b=YjaF4W2TObEm1qVtaKp+PI0jPd5c02EUHsk/17oNYjxl8eLNC0HtXkJreKGKYp8x++DeMWJTtC73UHHs6Orr19nsCqJGWLq+dNbASpFNyl3cxyvqhyIQvCBjMQnKpfCiBhhQEWtyv4aWlr8sQUhzoBaF1PRXZ8V8NlBvmrHi+d688eQaRbQOMaKGZwUtYiMe5arVIgIIPg/qaEZtUoY+ryK9Z412o4R/zY0kU3p10ZtL94ZCSZuZD8A5per4812jJr5NrXCC+hplKewONi77U7MFIwIemmra3iY2XOXYx7ji+HHY2URsspE5pniW3tVLHlp4Vw7LBzoUJvZueO9Lkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB2778.namprd12.prod.outlook.com (20.176.114.145) by
 DM6PR12MB2713.namprd12.prod.outlook.com (20.176.116.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Mon, 30 Sep 2019 18:05:33 +0000
Received: from DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::b411:7d2c:8848:1f6e]) by DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::b411:7d2c:8848:1f6e%7]) with mapi id 15.20.2305.017; Mon, 30 Sep 2019
 18:05:33 +0000
From: "Zhao, Yong" <Yong.Zhao@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 6/6] drm/amdkfd: Improve KFD IOCTL printing
Thread-Topic: [PATCH 6/6] drm/amdkfd: Improve KFD IOCTL printing
Thread-Index: AQHVda6nHHAsC5kwB06otUer7ZPNMKdEYXyAgAAmP7g=
Date: Mon, 30 Sep 2019 18:05:33 +0000
Message-ID: <DM6PR12MB27786C334D48B9EC6329B68CF0820@DM6PR12MB2778.namprd12.prod.outlook.com>
References: <20190928034132.28340-1-Yong.Zhao@amd.com>
 <20190928034132.28340-6-Yong.Zhao@amd.com>,
 <30b9f4d8-0365-27fb-b6b4-ba2d20b9cb81@amd.com>
In-Reply-To: <30b9f4d8-0365-27fb-b6b4-ba2d20b9cb81@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2607:fea8:209f:ebca:80e2:c472:bf44:ff10]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e42eea8a-0c5e-4a7a-0f2b-08d745d0c9c1
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM6PR12MB2713:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB27130ED402ECA3E845D48B73F0820@DM6PR12MB2713.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01762B0D64
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(346002)(396003)(39860400002)(136003)(189003)(199004)(316002)(229853002)(256004)(105004)(46003)(9686003)(54896002)(6246003)(186003)(55016002)(25786009)(33656002)(8936002)(6436002)(52536014)(19627405001)(7696005)(110136005)(99286004)(14444005)(2501003)(102836004)(6506007)(53546011)(86362001)(8676002)(76176011)(81156014)(5660300002)(74316002)(81166006)(478600001)(486006)(7736002)(71190400001)(446003)(11346002)(2906002)(476003)(6116002)(66446008)(64756008)(66556008)(66476007)(14454004)(76116006)(66946007)(71200400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2713;
 H:DM6PR12MB2778.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aGh/5l7GGHa78pd01XiRFKKnDCLr0PylWoMb+eTEheraAsclKa558VChkX4X3hyM9mcLjLMawArmWffo9i/xlKO0Sv9e9koL0/hGg3Y1hd1TmPlI9u/u4sXW4GjSGmTPLAoFwyxvU5Lw6cHhZy66tgLtilbGGtQ8PrbN6JnIANWfwdQaVWCnj5PUFE6zH3iBaNVynIwzXGSDRoS8s4dFrOid045g4GG/v49OnVGYKK/eYSK95T33iTBbMp6gzMPI0CoHiE8+taHmV9l5is+WLrhuc7gLnnRkuXF5peAbBNWgJCmLQr5RJpUI6Ugk2J879BpZT/r0k1TaGujU4zcZ1X7B5lSO1TK6pkAhrEE/iJxwbTt8IrWykYIdvtKyP1UuAoqs67ep0mKSaZosYTwGo/yJ54BkYuj49a79Cg68NR0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e42eea8a-0c5e-4a7a-0f2b-08d745d0c9c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2019 18:05:33.5072 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /8l30anzXKCfx6GavToBqW6bcxGcduuvpNmI9YAidYs7Wf5HQwvKpqbO/z3SRAbO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2713
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HEO07SkRp/pNT6vhQhqF/eBBKHLuK1Wc5OtUg6p/wjM=;
 b=ypqpwl6qWA1CrvNYgRQRzurW8FeELsW374esOJypstBkuYoShYzM55HcYpeHQ3OKmUsX8jxwwW3kW7UuWkCuPsL5iOFFAdVlqftIt3mneT2ojVA6rIUhGCUCF9uZnAeq9vl9cRQnRBx/cbEYxpPkFTJIzDnJiv4JdF/3TBYmuoA=
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
Content-Type: multipart/mixed; boundary="===============1821909814=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1821909814==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DM6PR12MB27786C334D48B9EC6329B68CF0820DM6PR12MB2778namp_"

--_000_DM6PR12MB27786C334D48B9EC6329B68CF0820DM6PR12MB2778namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Okay, I will change dev_err back to dev_dbg. The hex printing is still very=
 useful.

Yong
________________________________
From: Kuehling, Felix <Felix.Kuehling@amd.com>
Sent: Monday, September 30, 2019 11:47 AM
To: Zhao, Yong <Yong.Zhao@amd.com>; amd-gfx@lists.freedesktop.org <amd-gfx@=
lists.freedesktop.org>
Subject: Re: [PATCH 6/6] drm/amdkfd: Improve KFD IOCTL printing

On 2019-09-27 11:41 p.m., Zhao, Yong wrote:
> The code use hex define, so should the printing. Also, printf a message
> if there is a failure.
>
> Change-Id: Ia7cc7690553bb043915b3d8c0157216c64421a60
> Signed-off-by: Yong Zhao <Yong.Zhao@amd.com>
> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/a=
md/amdkfd/kfd_chardev.c
> index c28ba0c1d7ac..d1ab09c0f522 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -1840,7 +1840,7 @@ static long kfd_ioctl(struct file *filep, unsigned =
int cmd, unsigned long arg)
>        } else
>                goto err_i1;
>
> -     dev_dbg(kfd_device, "ioctl cmd 0x%x (#%d), arg 0x%lx\n", cmd, nr, a=
rg);
> +     dev_dbg(kfd_device, "ioctl cmd 0x%x (#0x%x), arg 0x%lx\n", cmd, nr,=
 arg);
>
>        process =3D kfd_get_process(current);
>        if (IS_ERR(process)) {
> @@ -1895,7 +1895,8 @@ static long kfd_ioctl(struct file *filep, unsigned =
int cmd, unsigned long arg)
>                kfree(kdata);
>
>        if (retcode)
> -             dev_dbg(kfd_device, "ret =3D %d\n", retcode);
> +             dev_err(kfd_device, "ioctl cmd (#0x%x), arg 0x%lx, ret =3D =
%d\n",
> +                             nr, arg, retcode);

NAK. We don't want to spam the kernel log with cryptic error messages
every time ioctl functions fail. Please leave this as a dev_dbg message.
Failing ioctl functions could be perfectly normal for a number of
reasons (system call interrupted by signal, running out of event slots,
timeouts on event waiting, etc). But every bug report will incorrectly
blame any unrelated problem on those messages if they happen to appear
in the kernel log.

Regards,
   Felix


>
>        return retcode;
>   }

--_000_DM6PR12MB27786C334D48B9EC6329B68CF0820DM6PR12MB2778namp_
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
Okay, I will change&nbsp;<span style=3D"font-family: &quot;Segoe UI&quot;, =
&quot;Segoe UI Web (West European)&quot;, &quot;Segoe UI&quot;, -apple-syst=
em, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif; fon=
t-size: 14.6667px; background-color: rgb(255, 255, 255); display: inline !i=
mportant">dev_err
 back to dev_dbg. The hex printing is still very useful.</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (West =
European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, R=
oboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 14.6667px; backgr=
ound-color: rgb(255, 255, 255); display: inline !important"><br>
</span></div>
<div style=3D"color: rgb(0, 0, 0);"><span style=3D"font-size: 14.6667px;">Y=
ong</span></div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Kuehling, Felix &lt;F=
elix.Kuehling@amd.com&gt;<br>
<b>Sent:</b> Monday, September 30, 2019 11:47 AM<br>
<b>To:</b> Zhao, Yong &lt;Yong.Zhao@amd.com&gt;; amd-gfx@lists.freedesktop.=
org &lt;amd-gfx@lists.freedesktop.org&gt;<br>
<b>Subject:</b> Re: [PATCH 6/6] drm/amdkfd: Improve KFD IOCTL printing</fon=
t>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On 2019-09-27 11:41 p.m., Zhao, Yong wrote:<br>
&gt; The code use hex define, so should the printing. Also, printf a messag=
e<br>
&gt; if there is a failure.<br>
&gt;<br>
&gt; Change-Id: Ia7cc7690553bb043915b3d8c0157216c64421a60<br>
&gt; Signed-off-by: Yong Zhao &lt;Yong.Zhao@amd.com&gt;<br>
&gt; ---<br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 5 &#43;&#43;&#4=
3;--<br>
&gt;&nbsp;&nbsp; 1 file changed, 3 insertions(&#43;), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/dr=
m/amd/amdkfd/kfd_chardev.c<br>
&gt; index c28ba0c1d7ac..d1ab09c0f522 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c<br>
&gt; @@ -1840,7 &#43;1840,7 @@ static long kfd_ioctl(struct file *filep, un=
signed int cmd, unsigned long arg)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; goto err_i1;<br>
&gt;&nbsp;&nbsp; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; dev_dbg(kfd_device, &quot;ioctl cmd 0x%x (#%=
d), arg 0x%lx\n&quot;, cmd, nr, arg);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; dev_dbg(kfd_device, &quot;ioctl cmd 0x%x=
 (#0x%x), arg 0x%lx\n&quot;, cmd, nr, arg);<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; process =3D kfd_get_process(=
current);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (IS_ERR(process)) {<br>
&gt; @@ -1895,7 &#43;1895,8 @@ static long kfd_ioctl(struct file *filep, un=
signed int cmd, unsigned long arg)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; kfree(kdata);<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (retcode)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; dev_dbg(kfd_device, &quot;ret =3D %d\n&quot;, retcode);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; dev_err(kfd_device, &quot;ioctl cmd (#0x%x), arg 0x%lx, ret =3D %d\=
n&quot;,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; nr, arg, retcode);<br>
<br>
NAK. We don't want to spam the kernel log with cryptic error messages <br>
every time ioctl functions fail. Please leave this as a dev_dbg message. <b=
r>
Failing ioctl functions could be perfectly normal for a number of <br>
reasons (system call interrupted by signal, running out of event slots, <br=
>
timeouts on event waiting, etc). But every bug report will incorrectly <br>
blame any unrelated problem on those messages if they happen to appear <br>
in the kernel log.<br>
<br>
Regards,<br>
&nbsp;&nbsp; Felix<br>
<br>
<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return retcode;<br>
&gt;&nbsp;&nbsp; }<br>
</div>
</span></font></div>
</body>
</html>

--_000_DM6PR12MB27786C334D48B9EC6329B68CF0820DM6PR12MB2778namp_--

--===============1821909814==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1821909814==--
