Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22982233C2
	for <lists+amd-gfx@lfdr.de>; Mon, 20 May 2019 14:22:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5F3389182;
	Mon, 20 May 2019 12:22:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720055.outbound.protection.outlook.com [40.107.72.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 206C689182
 for <amd-gfx@lists.freedesktop.org>; Mon, 20 May 2019 12:22:12 +0000 (UTC)
Received: from MN2PR12MB3039.namprd12.prod.outlook.com (20.178.243.144) by
 MN2PR12MB3662.namprd12.prod.outlook.com (10.255.86.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.16; Mon, 20 May 2019 12:22:08 +0000
Received: from MN2PR12MB3039.namprd12.prod.outlook.com
 ([fe80::74ad:250e:919e:f690]) by MN2PR12MB3039.namprd12.prod.outlook.com
 ([fe80::74ad:250e:919e:f690%5]) with mapi id 15.20.1900.020; Mon, 20 May 2019
 12:22:08 +0000
From: "Tao, Yintian" <Yintian.Tao@amd.com>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>, Alex Deucher
 <alexdeucher@gmail.com>
Subject: RE: [PATCH] drm/amdgpu: set correct vram_width for vega10 under sriov
Thread-Topic: [PATCH] drm/amdgpu: set correct vram_width for vega10 under sriov
Thread-Index: AQHVC99CrDqQZAJCpkekPlcwIy0bl6Zum5TAgADH8wCAAAR87oAAJiqAgARmRkA=
Date: Mon, 20 May 2019 12:22:07 +0000
Message-ID: <MN2PR12MB3039B4071842896BFA00FA59E5060@MN2PR12MB3039.namprd12.prod.outlook.com>
References: <1558008150-20674-1-git-send-email-yttao@amd.com>
 <MN2PR12MB3039BD8CF5208A1667D34B29E50B0@MN2PR12MB3039.namprd12.prod.outlook.com>,
 <CADnq5_O00Ts0RA+ntfC8Sqfb3WGCi+xE6SwReOXUfJzJji7nTw@mail.gmail.com>,
 <MN2PR12MB3039CE4D284123D037FEDAF9E50B0@MN2PR12MB3039.namprd12.prod.outlook.com>
 <BN6PR12MB180947BE593ECB3FC8A660A7F70B0@BN6PR12MB1809.namprd12.prod.outlook.com>
In-Reply-To: <BN6PR12MB180947BE593ECB3FC8A660A7F70B0@BN6PR12MB1809.namprd12.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 77034473-05b5-42bd-9410-08d6dd1dc6f0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3662; 
x-ms-traffictypediagnostic: MN2PR12MB3662:
x-ms-exchange-purlcount: 3
x-microsoft-antispam-prvs: <MN2PR12MB3662C33A0B385ADDA48B3E54E5060@MN2PR12MB3662.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 004395A01C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(396003)(346002)(39860400002)(366004)(136003)(13464003)(189003)(199004)(51874003)(53546011)(6506007)(66066001)(2906002)(66446008)(5660300002)(7736002)(99286004)(102836004)(76176011)(790700001)(64756008)(66946007)(73956011)(76116006)(66476007)(7696005)(3846002)(6116002)(52536014)(66556008)(8936002)(606006)(72206003)(478600001)(966005)(68736007)(74316002)(71190400001)(71200400001)(81166006)(14454004)(6436002)(33656002)(25786009)(316002)(8676002)(26005)(4326008)(81156014)(486006)(54906003)(6246003)(236005)(5024004)(53936002)(229853002)(256004)(446003)(45080400002)(186003)(55016002)(110136005)(86362001)(9686003)(6306002)(54896002)(11346002)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3662;
 H:MN2PR12MB3039.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Cde5QIz/1VnGwbM0tBLO2Y5WAVcf73nr8ohI74NKktWRXxRF6lLkh7kQWo54ILT21yBNfAPjTUxEJB7P4m2IMY/OgEVAUCrHLjXg+n/Ren9xRY0Gr01B7AiYntoo4w3wbSirMt/64Qyn1GIW3zboLEZknZhhz+bYlm8lLgD270t+rpCoy1lvdMDuKUZsuSTVKz6Xqjz9HYARobHA5gnbv10My2TJ37AN8cVDDGc/5qTgZtWxdBun/kbiyJLTuB/6m8SiyevRwKfXL1k72wpqJLcWA32TP4bvDl8K2j9KwfjwaNQ8DMGhiF2F6yJD50USP0QL667RH7X5nbmMtCQv2JdysimGzWAUkLCjwAUiitOcFVNzcIk+TTv43ZmIPbAmntyDFWaUaJHrFzLkHOPuEDqC/LfhvE1Dpq+rDA0r8zQ=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77034473-05b5-42bd-9410-08d6dd1dc6f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2019 12:22:07.9919 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3662
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d0XjHC+eq+n3nQcLfup98ejjUN/d0VIqDPJRKApUF9g=;
 b=H8R/QoZRGK0lfwGErI+bYBe6K3J7t8XVlRK/Tf9IFsWb0GqJ+cCT7nEJnPIyIVyS9CVBljqp6S5Ff9Z8J1Y9pc2yl3cOTNZ5ALTcssLl1xymBE1rLAUcHWIyeW/dauDQpSnznxMxuObHo1PMM+DDS6vK8BDwzwnqoVvWVMAWfkE=
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
Cc: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Huang,
 Trigger" <Trigger.Huang@amd.com>
Content-Type: multipart/mixed; boundary="===============1088390580=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1088390580==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB3039B4071842896BFA00FA59E5060MN2PR12MB3039namp_"

--_000_MN2PR12MB3039B4071842896BFA00FA59E5060MN2PR12MB3039namp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkgIEFsZXgNCg0KU28gc29ycnkgZm9yIG15IG1pc3Npbmcgb2YgeW91IHBhdGNoIGJlY2F1c2Ug
dGhlIG91dGxvb2sgb24gd2Vic2l0ZSBkaWRuoa90IHNob3cgaXQuDQoNCllvdXIgcGF0Y2ggc2Vl
bXMgY2xlYW5lciBhbmQgYmV0dGVyLiBDYW4geW91IGhlbHAgc3VibWl0IGl0ID8gVGhhbmtzIGlu
IGFkdmFuY2UuDQoNClJldmlld2VkLWJ5OiBZaW50aWFuIFRhbzx5dHRhb0BhbWQuY29tPg0KDQoN
CkNhbg0KDQpGcm9tOiBEZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5j
b20+DQpTZW50OiBTYXR1cmRheSwgTWF5IDE4LCAyMDE5IDE6MDcgQU0NClRvOiBUYW8sIFlpbnRp
YW4gPFlpbnRpYW4uVGFvQGFtZC5jb20+OyBBbGV4IERldWNoZXIgPGFsZXhkZXVjaGVyQGdtYWls
LmNvbT4NCkNjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgS29lbmlnLCBDaHJpc3Rp
YW4gPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT47IEh1YW5nLCBUcmlnZ2VyIDxUcmlnZ2VyLkh1
YW5nQGFtZC5jb20+DQpTdWJqZWN0OiBSZTogW1BBVENIXSBkcm0vYW1kZ3B1OiBzZXQgY29ycmVj
dCB2cmFtX3dpZHRoIGZvciB2ZWdhMTAgdW5kZXIgc3Jpb3YNCg0KRGlkIHlvdSBzZWUgdGhlIHBh
dGNoIEkgYXR0YWNoZWQ/DQoNCkFsZXgNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
DQpGcm9tOiBUYW8sIFlpbnRpYW4NClNlbnQ6IEZyaWRheSwgTWF5IDE3LCAyMDE5IDEwOjUxIEFN
DQpUbzogQWxleCBEZXVjaGVyDQpDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc8bWFp
bHRvOmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPjsgS29lbmlnLCBDaHJpc3RpYW47IERl
dWNoZXIsIEFsZXhhbmRlcjsgSHVhbmcsIFRyaWdnZXINClN1YmplY3Q6ILTwuLQ6IFtQQVRDSF0g
ZHJtL2FtZGdwdTogc2V0IGNvcnJlY3QgdnJhbV93aWR0aCBmb3IgdmVnYTEwIHVuZGVyIHNyaW92
DQoNCg0KSGkgQWxleA0KDQoNCg0KDQoNCk1hbnkgdGhhbmtzIGZvciB5b3VyIHJldmlldy4gSSB3
aWxsIG1lcmdlIHRoZXNlIHR3byBwYXRjaGVzIGludG8gb25lIGFuZCBzdWJtaXQgYWdhaW4uDQoN
Cg0KDQoNCg0KQmVzdCBSZWdhcmRzDQoNCllpbnRpYW4gVGFvDQoNCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fDQq3orz+yMs6IEFsZXggRGV1Y2hlciA8YWxleGRldWNoZXJAZ21haWwu
Y29tPG1haWx0bzphbGV4ZGV1Y2hlckBnbWFpbC5jb20+Pg0Kt6LLzcqxvOQ6IDIwMTnE6jXUwjE3
yNUgMjI6MzQ6MzANCsrVvP7IyzogVGFvLCBZaW50aWFuDQqzrcvNOiBhbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZzxtYWlsdG86YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+OyBLb2Vu
aWcsIENocmlzdGlhbjsgRGV1Y2hlciwgQWxleGFuZGVyOyBIdWFuZywgVHJpZ2dlcg0K1vfM4jog
UmU6IFtQQVRDSF0gZHJtL2FtZGdwdTogc2V0IGNvcnJlY3QgdnJhbV93aWR0aCBmb3IgdmVnYTEw
IHVuZGVyIHNyaW92DQoNCltDQVVUSU9OOiBFeHRlcm5hbCBFbWFpbF0NCg0KSG93IGFib3V0IGNv
bWJpbmluZyB0aGVzZSB0d28gcGF0Y2hlcyBpbnRvIG9uZT8gIFRoaXMgc2VlbXMgY2xlYW5lci4N
Cg0KQWxleA0KDQpPbiBUaHUsIE1heSAxNiwgMjAxOSBhdCAxMDozOSBQTSBUYW8sIFlpbnRpYW4g
PFlpbnRpYW4uVGFvQGFtZC5jb208bWFpbHRvOllpbnRpYW4uVGFvQGFtZC5jb20+PiB3cm90ZToN
Cj4NCj4gUGluZy4uLg0KPg0KPiBIaSBDaHJpc3RpYW4gYW5kIEFsZXgNCj4NCj4NCj4gQ2FuIHlv
dSBoZWxwIHJldmlldyB0aGlzPyBUaGFua3MgaW4gYWR2YW5jZS4NCj4NCj4NCj4gQmVzdCBSZWdh
cmRzDQo+IFlpbnRpYW4gVGFvDQo+DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZy
b206IFlpbnRpYW4gVGFvIDx5dHRhb0BhbWQuY29tPG1haWx0bzp5dHRhb0BhbWQuY29tPj4NCj4g
U2VudDogVGh1cnNkYXksIE1heSAxNiwgMjAxOSA4OjAzIFBNDQo+IFRvOiBhbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZzxtYWlsdG86YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+DQo+
IENjOiBUYW8sIFlpbnRpYW4gPFlpbnRpYW4uVGFvQGFtZC5jb208bWFpbHRvOllpbnRpYW4uVGFv
QGFtZC5jb20+PjsgSHVhbmcsIFRyaWdnZXIgPFRyaWdnZXIuSHVhbmdAYW1kLmNvbTxtYWlsdG86
VHJpZ2dlci5IdWFuZ0BhbWQuY29tPj4NCj4gU3ViamVjdDogW1BBVENIXSBkcm0vYW1kZ3B1OiBz
ZXQgY29ycmVjdCB2cmFtX3dpZHRoIGZvciB2ZWdhMTAgdW5kZXIgc3Jpb3YNCj4NCj4gRm9yIFZl
Z2ExMCBTUi1JT1YsIHZyYW1fd2lkdGggY2FuJ3QgYmUgcmVhZCBmcm9tIEFUT00gYXMgUkFWRU4s
IGFuZCBERiByZWxhdGVkIHJlZ2lzdGVycyBpcyBub3QgcmVhZGFibGUsIHNlZW1zIGhhcmRjb3Jk
IGlzIHRoZSBvbmx5IHdheSB0byBzZXQgdGhlIGNvcnJlY3QgdnJhbV93aWR0aA0KPg0KPiBTaWdu
ZWQtb2ZmLWJ5OiBUcmlnZ2VyIEh1YW5nIDxUcmlnZ2VyLkh1YW5nQGFtZC5jb208bWFpbHRvOlRy
aWdnZXIuSHVhbmdAYW1kLmNvbT4+DQo+IFNpZ25lZC1vZmYtYnk6IFlpbnRpYW4gVGFvIDx5dHRh
b0BhbWQuY29tPG1haWx0bzp5dHRhb0BhbWQuY29tPj4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jIHwgNyArKysrKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwg
NyBpbnNlcnRpb25zKCspDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9nbWNfdjlfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y5XzAuYw0K
PiBpbmRleCBjMjIxNTcwLi5hNDE3NzYzIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9nbWNfdjlfMC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2dtY192OV8wLmMNCj4gQEAgLTg0OCw2ICs4NDgsMTMgQEAgc3RhdGljIGludCBnbWNfdjlfMF9t
Y19pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0KPiAgICAgICAgICAgICAgICAgYWRl
di0+Z21jLnZyYW1fd2lkdGggPSBudW1jaGFuICogY2hhbnNpemU7DQo+ICAgICAgICAgfQ0KPg0K
PiArICAgICAgIC8qIEZvciBWZWdhMTAgU1ItSU9WLCB2cmFtX3dpZHRoIGNhbid0IGJlIHJlYWQg
ZnJvbSBBVE9NIGFzIFJBVkVOLA0KPiArICAgICAgICAqIGFuZCBERiByZWxhdGVkIHJlZ2lzdGVy
cyBpcyBub3QgcmVhZGFibGUsIHNlZW1zIGhhcmRjb3JkIGlzIHRoZQ0KPiArICAgICAgICAqIG9u
bHkgd2F5IHRvIHNldCB0aGUgY29ycmVjdCB2cmFtX3dpZHRoICovDQo+ICsgICAgICAgaWYgKGFt
ZGdwdV9zcmlvdl92ZihhZGV2KSAmJiAoYWRldi0+YXNpY190eXBlID09IENISVBfVkVHQTEwKSkg
ew0KPiArICAgICAgICAgICAgICAgYWRldi0+Z21jLnZyYW1fd2lkdGggPSAyMDQ4Ow0KPiArICAg
ICAgIH0NCj4gKw0KPiAgICAgICAgIC8qIHNpemUgaW4gTUIgb24gc2kgKi8NCj4gICAgICAgICBh
ZGV2LT5nbWMubWNfdnJhbV9zaXplID0NCj4gICAgICAgICAgICAgICAgIGFkZXYtPm5iaW9fZnVu
Y3MtPmdldF9tZW1zaXplKGFkZXYpICogMTAyNFVMTCAqIDEwMjRVTEw7DQo+IC0tDQo+IDIuNy40
DQo+DQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+
IGFtZC1nZnggbWFpbGluZyBsaXN0DQo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPG1h
aWx0bzphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4NCj4gaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4DQo=

--_000_MN2PR12MB3039B4071842896BFA00FA59E5060MN2PR12MB3039namp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:=CB=CE=CC=E5;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@=CB=CE=CC=E5";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:=CB=CE=CC=E5;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:=CB=CE=CC=E5;}
span.EmailStyle18
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif">Hi&nbsp; Alex<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif">So sorry for my missing of you patch because the ou=
tlook on website didn=A1=AFt show it.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif">Your patch seems cleaner and better. Can you help s=
ubmit it ? Thanks in advance.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif">Reviewed-by: Yintian Tao&lt;yttao@amd.com&gt;<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif">Can
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:11.0pt;font-family:&quot=
;Calibri&quot;,sans-serif">From:</span></b><span style=3D"font-size:11.0pt;=
font-family:&quot;Calibri&quot;,sans-serif"> Deucher, Alexander &lt;Alexand=
er.Deucher@amd.com&gt;
<br>
<b>Sent:</b> Saturday, May 18, 2019 1:07 AM<br>
<b>To:</b> Tao, Yintian &lt;Yintian.Tao@amd.com&gt;; Alex Deucher &lt;alexd=
eucher@gmail.com&gt;<br>
<b>Cc:</b> amd-gfx@lists.freedesktop.org; Koenig, Christian &lt;Christian.K=
oenig@amd.com&gt;; Huang, Trigger &lt;Trigger.Huang@amd.com&gt;<br>
<b>Subject:</b> Re: [PATCH] drm/amdgpu: set correct vram_width for vega10 u=
nder sriov<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">Did you see the patch I attached?<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">Alex<o:p></o:p></span></p>
</div>
<div class=3D"MsoNormal" align=3D"center" style=3D"text-align:center">
<hr size=3D"2" width=3D"98%" align=3D"center">
</div>
<div id=3D"divRplyFwdMsg">
<p class=3D"MsoNormal"><b><span style=3D"font-size:11.0pt;font-family:&quot=
;Calibri&quot;,sans-serif;color:black">From:</span></b><span style=3D"font-=
size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:black"> Tao, Y=
intian<br>
<b>Sent:</b> Friday, May 17, 2019 10:51 AM<br>
<b>To:</b> Alex Deucher<br>
<b>Cc:</b> </span><a href=3D"mailto:amd-gfx@lists.freedesktop.org"><span st=
yle=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">amd-gfx=
@lists.freedesktop.org</span></a><span style=3D"font-size:11.0pt;font-famil=
y:&quot;Calibri&quot;,sans-serif;color:black">; Koenig, Christian;
 Deucher, Alexander; Huang, Trigger<br>
<b>Subject:</b> </span><span lang=3D"ZH-CN" style=3D"font-size:11.0pt;color=
:black">=B4=F0=B8=B4</span><span style=3D"font-size:11.0pt;font-family:&quo=
t;Calibri&quot;,sans-serif;color:black">: [PATCH] drm/amdgpu: set correct v=
ram_width for vega10 under sriov</span>
<o:p></o:p></p>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
</div>
<div>
<div id=3D"x_divtagdefaultwrapper">
<p><span style=3D"font-family:&quot;Calibri&quot;,sans-serif;color:black">H=
i Alex<o:p></o:p></span></p>
<p><span style=3D"font-family:&quot;Calibri&quot;,sans-serif;color:black"><=
o:p>&nbsp;</o:p></span></p>
<p><span style=3D"font-family:&quot;Calibri&quot;,sans-serif;color:black"><=
o:p>&nbsp;</o:p></span></p>
<p><span style=3D"font-family:&quot;Calibri&quot;,sans-serif;color:black">M=
any thanks for your review. I will merge these two patches into one and sub=
mit again.<o:p></o:p></span></p>
<p><span style=3D"font-family:&quot;Calibri&quot;,sans-serif;color:black"><=
o:p>&nbsp;</o:p></span></p>
<p><span style=3D"font-family:&quot;Calibri&quot;,sans-serif;color:black"><=
o:p>&nbsp;</o:p></span></p>
<p><span style=3D"font-family:&quot;Calibri&quot;,sans-serif;color:black">B=
est Regards<o:p></o:p></span></p>
<p><span style=3D"font-family:&quot;Calibri&quot;,sans-serif;color:black">Y=
intian Tao<o:p></o:p></span></p>
</div>
<div class=3D"MsoNormal" align=3D"center" style=3D"text-align:center">
<hr size=3D"2" width=3D"98%" align=3D"center">
</div>
<div id=3D"x_divRplyFwdMsg">
<p class=3D"MsoNormal"><b><span lang=3D"ZH-CN" style=3D"font-size:11.0pt;co=
lor:black">=B7=A2=BC=FE=C8=CB</span></b><b><span style=3D"font-size:11.0pt;=
font-family:&quot;Calibri&quot;,sans-serif;color:black">:</span></b><span s=
tyle=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:b=
lack">
 Alex Deucher &lt;</span><a href=3D"mailto:alexdeucher@gmail.com"><span sty=
le=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">alexdeuc=
her@gmail.com</span></a><span style=3D"font-size:11.0pt;font-family:&quot;C=
alibri&quot;,sans-serif;color:black">&gt;<br>
</span><b><span lang=3D"ZH-CN" style=3D"font-size:11.0pt;color:black">=B7=
=A2=CB=CD=CA=B1=BC=E4</span></b><b><span style=3D"font-size:11.0pt;font-fam=
ily:&quot;Calibri&quot;,sans-serif;color:black">:</span></b><span style=3D"=
font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:black"> 2=
019</span><span lang=3D"ZH-CN" style=3D"font-size:11.0pt;color:black">=C4=
=EA</span><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,s=
ans-serif;color:black">5</span><span lang=3D"ZH-CN" style=3D"font-size:11.0=
pt;color:black">=D4=C2</span><span style=3D"font-size:11.0pt;font-family:&q=
uot;Calibri&quot;,sans-serif;color:black">17</span><span lang=3D"ZH-CN" sty=
le=3D"font-size:11.0pt;color:black">=C8=D5</span><span style=3D"font-size:1=
1.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:black">
 22:34:30<br>
</span><b><span lang=3D"ZH-CN" style=3D"font-size:11.0pt;color:black">=CA=
=D5=BC=FE=C8=CB</span></b><b><span style=3D"font-size:11.0pt;font-family:&q=
uot;Calibri&quot;,sans-serif;color:black">:</span></b><span style=3D"font-s=
ize:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:black"> Tao, Yi=
ntian<br>
</span><b><span lang=3D"ZH-CN" style=3D"font-size:11.0pt;color:black">=B3=
=AD=CB=CD</span></b><b><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:black">:</span></b><span style=3D"font-size:11=
.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:black">
</span><a href=3D"mailto:amd-gfx@lists.freedesktop.org"><span style=3D"font=
-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif">amd-gfx@lists.free=
desktop.org</span></a><span style=3D"font-size:11.0pt;font-family:&quot;Cal=
ibri&quot;,sans-serif;color:black">; Koenig, Christian; Deucher,
 Alexander; Huang, Trigger<br>
</span><b><span lang=3D"ZH-CN" style=3D"font-size:11.0pt;color:black">=D6=
=F7=CC=E2</span></b><b><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:black">:</span></b><span style=3D"font-size:11=
.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:black"> Re: [PATCH]
 drm/amdgpu: set correct vram_width for vega10 under sriov</span> <o:p></o:=
p></p>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
</div>
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">[CAUTION: External =
Email]<br>
<br>
How about combining these two patches into one?&nbsp; This seems cleaner.<b=
r>
<br>
Alex<br>
<br>
On Thu, May 16, 2019 at 10:39 PM Tao, Yintian &lt;</span><a href=3D"mailto:=
Yintian.Tao@amd.com"><span style=3D"font-size:11.0pt">Yintian.Tao@amd.com</=
span></a><span style=3D"font-size:11.0pt">&gt; wrote:<br>
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
&gt; From: Yintian Tao &lt;</span><a href=3D"mailto:yttao@amd.com"><span st=
yle=3D"font-size:11.0pt">yttao@amd.com</span></a><span style=3D"font-size:1=
1.0pt">&gt;<br>
&gt; Sent: Thursday, May 16, 2019 8:03 PM<br>
&gt; To: </span><a href=3D"mailto:amd-gfx@lists.freedesktop.org"><span styl=
e=3D"font-size:11.0pt">amd-gfx@lists.freedesktop.org</span></a><span style=
=3D"font-size:11.0pt"><br>
&gt; Cc: Tao, Yintian &lt;</span><a href=3D"mailto:Yintian.Tao@amd.com"><sp=
an style=3D"font-size:11.0pt">Yintian.Tao@amd.com</span></a><span style=3D"=
font-size:11.0pt">&gt;; Huang, Trigger &lt;</span><a href=3D"mailto:Trigger=
.Huang@amd.com"><span style=3D"font-size:11.0pt">Trigger.Huang@amd.com</spa=
n></a><span style=3D"font-size:11.0pt">&gt;<br>
&gt; Subject: [PATCH] drm/amdgpu: set correct vram_width for vega10 under s=
riov<br>
&gt;<br>
&gt; For Vega10 SR-IOV, vram_width can't be read from ATOM as RAVEN, and DF=
 related registers is not readable, seems hardcord is the only way to set t=
he correct vram_width<br>
&gt;<br>
&gt; Signed-off-by: Trigger Huang &lt;</span><a href=3D"mailto:Trigger.Huan=
g@amd.com"><span style=3D"font-size:11.0pt">Trigger.Huang@amd.com</span></a=
><span style=3D"font-size:11.0pt">&gt;<br>
&gt; Signed-off-by: Yintian Tao &lt;</span><a href=3D"mailto:yttao@amd.com"=
><span style=3D"font-size:11.0pt">yttao@amd.com</span></a><span style=3D"fo=
nt-size:11.0pt">&gt;<br>
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
&gt; </span><a href=3D"mailto:amd-gfx@lists.freedesktop.org"><span style=3D=
"font-size:11.0pt">amd-gfx@lists.freedesktop.org</span></a><span style=3D"f=
ont-size:11.0pt"><br>
&gt; </span><a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-g=
fx"><span style=3D"font-size:11.0pt">https://lists.freedesktop.org/mailman/=
listinfo/amd-gfx</span></a><span style=3D"font-size:11.0pt"><o:p></o:p></sp=
an></p>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_MN2PR12MB3039B4071842896BFA00FA59E5060MN2PR12MB3039namp_--

--===============1088390580==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1088390580==--
