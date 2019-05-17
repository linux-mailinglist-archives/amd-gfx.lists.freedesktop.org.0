Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CCC21A08
	for <lists+amd-gfx@lfdr.de>; Fri, 17 May 2019 16:51:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D127898FA;
	Fri, 17 May 2019 14:51:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760089.outbound.protection.outlook.com [40.107.76.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78016898FA
 for <amd-gfx@lists.freedesktop.org>; Fri, 17 May 2019 14:51:16 +0000 (UTC)
Received: from MN2PR12MB3039.namprd12.prod.outlook.com (20.178.243.144) by
 MN2PR12MB3133.namprd12.prod.outlook.com (20.178.241.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.17; Fri, 17 May 2019 14:51:13 +0000
Received: from MN2PR12MB3039.namprd12.prod.outlook.com
 ([fe80::8c2:3755:16e2:8765]) by MN2PR12MB3039.namprd12.prod.outlook.com
 ([fe80::8c2:3755:16e2:8765%5]) with mapi id 15.20.1856.012; Fri, 17 May 2019
 14:51:13 +0000
From: "Tao, Yintian" <Yintian.Tao@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: =?gb2312?B?tPC4tDogW1BBVENIXSBkcm0vYW1kZ3B1OiBzZXQgY29ycmVjdCB2cmFtX3dp?=
 =?gb2312?Q?dth_for_vega10_under_sriov?=
Thread-Topic: [PATCH] drm/amdgpu: set correct vram_width for vega10 under sriov
Thread-Index: AQHVC99CrDqQZAJCpkekPlcwIy0bl6Zum5TAgADH8wCAAAR87g==
Date: Fri, 17 May 2019 14:51:13 +0000
Message-ID: <MN2PR12MB3039CE4D284123D037FEDAF9E50B0@MN2PR12MB3039.namprd12.prod.outlook.com>
References: <1558008150-20674-1-git-send-email-yttao@amd.com>
 <MN2PR12MB3039BD8CF5208A1667D34B29E50B0@MN2PR12MB3039.namprd12.prod.outlook.com>,
 <CADnq5_O00Ts0RA+ntfC8Sqfb3WGCi+xE6SwReOXUfJzJji7nTw@mail.gmail.com>
In-Reply-To: <CADnq5_O00Ts0RA+ntfC8Sqfb3WGCi+xE6SwReOXUfJzJji7nTw@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [101.88.198.114]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 88bb3028-d8fd-46aa-854d-08d6dad71bc4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3133; 
x-ms-traffictypediagnostic: MN2PR12MB3133:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB3133CB2DC80E3E8D73EA408FE50B0@MN2PR12MB3133.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0040126723
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(376002)(346002)(39860400002)(366004)(136003)(51874003)(13464003)(199004)(189003)(54906003)(71190400001)(476003)(11346002)(446003)(71200400001)(486006)(76176011)(6116002)(3846002)(53546011)(6506007)(99286004)(7696005)(102836004)(66066001)(256004)(8936002)(86362001)(53936002)(2906002)(1411001)(4326008)(25786009)(224303003)(52536014)(236005)(66476007)(72206003)(7736002)(316002)(76116006)(91956017)(14454004)(606006)(81156014)(81166006)(966005)(64756008)(73956011)(66556008)(478600001)(68736007)(19627405001)(6916009)(26005)(186003)(74316002)(66946007)(5660300002)(66446008)(6436002)(6606003)(9686003)(33656002)(6306002)(54896002)(55016002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3133;
 H:MN2PR12MB3039.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: QwD0k72RgvRNndYOBgu9+b8eztPZz5mWq9RyLZR8mTu4fAQRXxNdWvJkra34unLm7Zz/6IjClChyVMogcr5u61L2Cb3mWUr451EeV5I70t1jV2It8arARE1I3uA9sL+o27m3fsnuJRP1Z+ccccD8BjyHKeHpeGZM66Gu9UHHRWfhWUaPBmJLyHy/CuqmVY193EiTq5EezYZFQeFpteGp9nj+iYvotfsUoWZ3o7sGSILXyZm4SvvKSYupVRoi3jF5Q7Ide9OSV4DcIP4GAPhiHZ5TrvNXP9wj0wFwcx/CssWMbpzoBgydYUbw0QalRHm70epyPSr0OJR2ZYhtWlfX5nDb97MYoN3sBy63tkKyjkmn/h11xZ5ebkW/EhJWGClNGpzrAMkcSlRIjvKcxdzHUC/g5CEWTMnmXlC7IFrsV58=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88bb3028-d8fd-46aa-854d-08d6dad71bc4
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2019 14:51:13.5979 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3133
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xGa3faLcKLm7IeMqaAeY0EGQElJ0rmkI3ISfUt6g+A0=;
 b=VsrMUu2ttKiS6tMr+iqvbfS0xJBEOSAZ8ZNWQOUT7SNH1GN+pWKIlhd1OLLRwFTYttA64DPaKHSll4gGi+vBJlmTSFatk/VMwvHhkHCxsaKpJgAVXvq5czT1G71DbV6CFm5Z85DJpKJu8JoHmMhokZ3HBO0iLl8VKcIzAQtuXyQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Yintian.Tao@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Huang,
 Trigger" <Trigger.Huang@amd.com>
Content-Type: multipart/mixed; boundary="===============1406444134=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1406444134==
Content-Language: zh-CN
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB3039CE4D284123D037FEDAF9E50B0MN2PR12MB3039namp_"

--_000_MN2PR12MB3039CE4D284123D037FEDAF9E50B0MN2PR12MB3039namp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkgQWxleA0KDQoNCg0KTWFueSB0aGFua3MgZm9yIHlvdXIgcmV2aWV3LiBJIHdpbGwgbWVyZ2Ug
dGhlc2UgdHdvIHBhdGNoZXMgaW50byBvbmUgYW5kIHN1Ym1pdCBhZ2Fpbi4NCg0KDQoNCkJlc3Qg
UmVnYXJkcw0KDQpZaW50aWFuIFRhbw0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xw0Kt6K8/sjLOiBBbGV4IERldWNoZXIgPGFsZXhkZXVjaGVyQGdtYWlsLmNvbT4NCreiy83Ksbzk
OiAyMDE5xOo11MIxN8jVIDIyOjM0OjMwDQrK1bz+yMs6IFRhbywgWWludGlhbg0Ks63LzTogYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IEtvZW5pZywgQ2hyaXN0aWFuOyBEZXVjaGVyLCBB
bGV4YW5kZXI7IEh1YW5nLCBUcmlnZ2VyDQrW98ziOiBSZTogW1BBVENIXSBkcm0vYW1kZ3B1OiBz
ZXQgY29ycmVjdCB2cmFtX3dpZHRoIGZvciB2ZWdhMTAgdW5kZXIgc3Jpb3YNCg0KW0NBVVRJT046
IEV4dGVybmFsIEVtYWlsXQ0KDQpIb3cgYWJvdXQgY29tYmluaW5nIHRoZXNlIHR3byBwYXRjaGVz
IGludG8gb25lPyAgVGhpcyBzZWVtcyBjbGVhbmVyLg0KDQpBbGV4DQoNCk9uIFRodSwgTWF5IDE2
LCAyMDE5IGF0IDEwOjM5IFBNIFRhbywgWWludGlhbiA8WWludGlhbi5UYW9AYW1kLmNvbT4gd3Jv
dGU6DQo+DQo+IFBpbmcuLi4NCj4NCj4gSGkgQ2hyaXN0aWFuIGFuZCBBbGV4DQo+DQo+DQo+IENh
biB5b3UgaGVscCByZXZpZXcgdGhpcz8gVGhhbmtzIGluIGFkdmFuY2UuDQo+DQo+DQo+IEJlc3Qg
UmVnYXJkcw0KPiBZaW50aWFuIFRhbw0KPg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiBGcm9tOiBZaW50aWFuIFRhbyA8eXR0YW9AYW1kLmNvbT4NCj4gU2VudDogVGh1cnNkYXksIE1h
eSAxNiwgMjAxOSA4OjAzIFBNDQo+IFRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0K
PiBDYzogVGFvLCBZaW50aWFuIDxZaW50aWFuLlRhb0BhbWQuY29tPjsgSHVhbmcsIFRyaWdnZXIg
PFRyaWdnZXIuSHVhbmdAYW1kLmNvbT4NCj4gU3ViamVjdDogW1BBVENIXSBkcm0vYW1kZ3B1OiBz
ZXQgY29ycmVjdCB2cmFtX3dpZHRoIGZvciB2ZWdhMTAgdW5kZXIgc3Jpb3YNCj4NCj4gRm9yIFZl
Z2ExMCBTUi1JT1YsIHZyYW1fd2lkdGggY2FuJ3QgYmUgcmVhZCBmcm9tIEFUT00gYXMgUkFWRU4s
IGFuZCBERiByZWxhdGVkIHJlZ2lzdGVycyBpcyBub3QgcmVhZGFibGUsIHNlZW1zIGhhcmRjb3Jk
IGlzIHRoZSBvbmx5IHdheSB0byBzZXQgdGhlIGNvcnJlY3QgdnJhbV93aWR0aA0KPg0KPiBTaWdu
ZWQtb2ZmLWJ5OiBUcmlnZ2VyIEh1YW5nIDxUcmlnZ2VyLkh1YW5nQGFtZC5jb20+DQo+IFNpZ25l
ZC1vZmYtYnk6IFlpbnRpYW4gVGFvIDx5dHRhb0BhbWQuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMgfCA3ICsrKysrKysNCj4gIDEgZmlsZSBjaGFu
Z2VkLCA3IGluc2VydGlvbnMoKykNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2dtY192OV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlf
MC5jDQo+IGluZGV4IGMyMjE1NzAuLmE0MTc3NjMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvZ21jX3Y5XzAuYw0KPiBAQCAtODQ4LDYgKzg0OCwxMyBAQCBzdGF0aWMgaW50IGdtY192
OV8wX21jX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpDQo+ICAgICAgICAgICAgICAg
ICBhZGV2LT5nbWMudnJhbV93aWR0aCA9IG51bWNoYW4gKiBjaGFuc2l6ZTsNCj4gICAgICAgICB9
DQo+DQo+ICsgICAgICAgLyogRm9yIFZlZ2ExMCBTUi1JT1YsIHZyYW1fd2lkdGggY2FuJ3QgYmUg
cmVhZCBmcm9tIEFUT00gYXMgUkFWRU4sDQo+ICsgICAgICAgICogYW5kIERGIHJlbGF0ZWQgcmVn
aXN0ZXJzIGlzIG5vdCByZWFkYWJsZSwgc2VlbXMgaGFyZGNvcmQgaXMgdGhlDQo+ICsgICAgICAg
ICogb25seSB3YXkgdG8gc2V0IHRoZSBjb3JyZWN0IHZyYW1fd2lkdGggKi8NCj4gKyAgICAgICBp
ZiAoYW1kZ3B1X3NyaW92X3ZmKGFkZXYpICYmIChhZGV2LT5hc2ljX3R5cGUgPT0gQ0hJUF9WRUdB
MTApKSB7DQo+ICsgICAgICAgICAgICAgICBhZGV2LT5nbWMudnJhbV93aWR0aCA9IDIwNDg7DQo+
ICsgICAgICAgfQ0KPiArDQo+ICAgICAgICAgLyogc2l6ZSBpbiBNQiBvbiBzaSAqLw0KPiAgICAg
ICAgIGFkZXYtPmdtYy5tY192cmFtX3NpemUgPQ0KPiAgICAgICAgICAgICAgICAgYWRldi0+bmJp
b19mdW5jcy0+Z2V0X21lbXNpemUoYWRldikgKiAxMDI0VUxMICogMTAyNFVMTDsNCj4gLS0NCj4g
Mi43LjQNCj4NCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18NCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QNCj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcNCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4DQo=

--_000_MN2PR12MB3039CE4D284123D037FEDAF9E50B0MN2PR12MB3039namp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Helvetica,sans-serif;" dir=3D"ltr">
<p style=3D"margin-top:0;margin-bottom:0">Hi Alex</p>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0">Many thanks for your review. I wi=
ll merge these two patches into one and submit again.</p>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0">Best Regards</p>
<p style=3D"margin-top:0;margin-bottom:0">Yintian Tao</p>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>=B7=A2=BC=FE=C8=CB:</b> Alex De=
ucher &lt;alexdeucher@gmail.com&gt;<br>
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b> 2019=C4=EA5=D4=C217=C8=D5 22:34:30<br>
<b>=CA=D5=BC=FE=C8=CB:</b> Tao, Yintian<br>
<b>=B3=AD=CB=CD:</b> amd-gfx@lists.freedesktop.org; Koenig, Christian; Deuc=
her, Alexander; Huang, Trigger<br>
<b>=D6=F7=CC=E2:</b> Re: [PATCH] drm/amdgpu: set correct vram_width for veg=
a10 under sriov</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">[CAUTION: External Email]<br>
<br>
How about combining these two patches into one?&nbsp; This seems cleaner.<b=
r>
<br>
Alex<br>
<br>
On Thu, May 16, 2019 at 10:39 PM Tao, Yintian &lt;Yintian.Tao@amd.com&gt; w=
rote:<br>
&gt;<br>
&gt; Ping...<br>
&gt;<br>
&gt; Hi Christian and Alex<br>
&gt;<br>
&gt;<br>
&gt; Can you help review this? Thanks in advance.<br>
&gt;<br>
&gt;<br>
&gt; Best Regards<br>
&gt; Yintian Tao<br>
&gt;<br>
&gt; -----Original Message-----<br>
&gt; From: Yintian Tao &lt;yttao@amd.com&gt;<br>
&gt; Sent: Thursday, May 16, 2019 8:03 PM<br>
&gt; To: amd-gfx@lists.freedesktop.org<br>
&gt; Cc: Tao, Yintian &lt;Yintian.Tao@amd.com&gt;; Huang, Trigger &lt;Trigg=
er.Huang@amd.com&gt;<br>
&gt; Subject: [PATCH] drm/amdgpu: set correct vram_width for vega10 under s=
riov<br>
&gt;<br>
&gt; For Vega10 SR-IOV, vram_width can't be read from ATOM as RAVEN, and DF=
 related registers is not readable, seems hardcord is the only way to set t=
he correct vram_width<br>
&gt;<br>
&gt; Signed-off-by: Trigger Huang &lt;Trigger.Huang@amd.com&gt;<br>
&gt; Signed-off-by: Yintian Tao &lt;yttao@amd.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c | 7 &#43;&#43;&#43;&#43;&#=
43;&#43;&#43;<br>
&gt;&nbsp; 1 file changed, 7 insertions(&#43;)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/a=
md/amdgpu/gmc_v9_0.c<br>
&gt; index c221570..a417763 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c<br>
&gt; @@ -848,6 &#43;848,13 @@ static int gmc_v9_0_mc_init(struct amdgpu_dev=
ice *adev)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;gmc.vram_width =3D numchan * chansize;<b=
r>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* For Vega10 SR-IOV, vram_w=
idth can't be read from ATOM as RAVEN,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * and DF related regis=
ters is not readable, seems hardcord is the<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * only way to set the =
correct vram_width */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (amdgpu_sriov_vf(adev) &a=
mp;&amp; (adev-&gt;asic_type =3D=3D CHIP_VEGA10)) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; adev-&gt;gmc.vram_width =3D 2048;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* size in MB on si */=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;gmc.mc_vram_s=
ize =3D<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;nbio_funcs-&gt;get_memsize(adev) * 1024U=
LL * 1024ULL;<br>
&gt; --<br>
&gt; 2.7.4<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; amd-gfx mailing list<br>
&gt; amd-gfx@lists.freedesktop.org<br>
&gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">htt=
ps://lists.freedesktop.org/mailman/listinfo/amd-gfx</a><br>
</div>
</span></font></div>
</body>
</html>

--_000_MN2PR12MB3039CE4D284123D037FEDAF9E50B0MN2PR12MB3039namp_--

--===============1406444134==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1406444134==--
