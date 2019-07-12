Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8782D6677B
	for <lists+amd-gfx@lfdr.de>; Fri, 12 Jul 2019 09:09:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 154FC6E2D3;
	Fri, 12 Jul 2019 07:09:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam04on0602.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe4d::602])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D86B86E2D3
 for <amd-gfx@lists.freedesktop.org>; Fri, 12 Jul 2019 07:09:56 +0000 (UTC)
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB3341.namprd12.prod.outlook.com (20.178.242.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Fri, 12 Jul 2019 07:09:54 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::9170:5b18:b195:24b1]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::9170:5b18:b195:24b1%3]) with mapi id 15.20.2073.008; Fri, 12 Jul 2019
 07:09:54 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 3/3] drm/amd/powerplay: avoid double check feature enabled
Thread-Topic: [PATCH 3/3] drm/amd/powerplay: avoid double check feature enabled
Thread-Index: AQHVOH96BWzkAMWDRUORC0lgIWDpkKbGj89g
Date: Fri, 12 Jul 2019 07:09:54 +0000
Message-ID: <MN2PR12MB33448DDED55CA6C501E4C5A8E4F20@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <20190712065959.25753-1-kevin1.wang@amd.com>
 <20190712065959.25753-3-kevin1.wang@amd.com>
In-Reply-To: <20190712065959.25753-3-kevin1.wang@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f1e86091-d35e-4b31-5979-08d70697f0f4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3341; 
x-ms-traffictypediagnostic: MN2PR12MB3341:
x-microsoft-antispam-prvs: <MN2PR12MB3341ABB602C760425C71E636E4F20@MN2PR12MB3341.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 00963989E5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(366004)(39860400002)(136003)(376002)(13464003)(199004)(189003)(7696005)(86362001)(53546011)(26005)(53936002)(76176011)(102836004)(99286004)(6116002)(3846002)(316002)(2501003)(110136005)(6246003)(71200400001)(4326008)(186003)(66066001)(6506007)(68736007)(256004)(71190400001)(5660300002)(14444005)(446003)(305945005)(52536014)(9686003)(7736002)(476003)(81156014)(74316002)(8936002)(2906002)(81166006)(6436002)(486006)(229853002)(478600001)(55016002)(64756008)(66476007)(33656002)(66556008)(25786009)(76116006)(11346002)(14454004)(66946007)(66446008)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3341;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: bQYi3/mwSgXB+ds2cE5TbaIP5AaKJZjSY/sNuXS7FS/gNPvoYi1ZFWnKKr/S1VUQRsaEeWv87y/u8ZiiTAh53OAOsvczdihj07cUtRz27ynHC8u//dG/h2B65IgVXsKyw/r7N+PeD29PKS3u1YTOO7Z0SQb2O8OBqQj+fu+J73IWjlCS2KK6C9gAbJeA7qDFddr7lbZg1hspnKULgHHXOya0j4sg2ibDq2enKKh4WHz1OkRO6Z0JX3LsLAF0iEqp2IAOrfxF20E6193Awz5zoaCca2crdySAG1QOD5N/+HVFXcJ1yFOGDSctMPBWylyi+B1RVHklHZWLwgHLGropzsdYPNE/91hfr3XFnmp7EKdRc0UaLu3/UnocQMKvEGOdkBFeTPemzgBA3XSrvWovLSwZSX98SBCmY+hb6+6Yrk8=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1e86091-d35e-4b31-5979-08d70697f0f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2019 07:09:54.7079 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: equan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3341
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wstXZb2z1xhNju3610i8lQk5bk5qR/lbQDrZl64BdRI=;
 b=Aur+1s1B+E4BRyGGDt+WgFuMYiSQ4fnlGD8xVKGPIEuOFgbwtfgewbNlbaRD9ygHCHD3VOudcdV8ruUrQ/Q6RxbYBVOPYlKemmWQeUFDkgSHkVaev7MN6kKwGeyNFOB2B92l09JuPmgt5C1AahECo1HzGZJNA6oUDVq8kxq9xv4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Evan.Quan@amd.com; 
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
Cc: "Feng, Kenneth" <Kenneth.Feng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UGF0Y2gxICYgMiBhcmUgcmV2aWV3ZWQtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+
CgpGb3IgcGF0Y2gzLCBmb3IgZHBtIGRpc2FibGVkIGNhc2UsICJzbXVfZ2V0X2RwbV9mcmVxX3Jh
bmdlKHNtdSwgY2xrX3R5cGUsICZtaW5fZnJlcSwmbWF4X2ZyZXEpIiB3aWxsIG5vdCBzZSB0aGUg
bWluX2ZyZXEgYW5kIG1heF9mcmVxLgpUaGF0IHdpbGwgY2F1c2Ugc29tZSB0cm91YmxlcyBmb3Ig
dGhlIHN1Y2NlZWRpbmcgc211X3NldF9zb2Z0X2ZyZXFfcmFuZ2UuIFBsZWFzZSBnZXQgdGhhdCBo
YW5kbGVkIHByb3Blcmx5LgoKUmVnYXJkcywKRXZhbgo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tCj4gRnJvbTogV2FuZywgS2V2aW4oWWFuZykgPEtldmluMS5XYW5nQGFtZC5jb20+Cj4gU2Vu
dDogRnJpZGF5LCBKdWx5IDEyLCAyMDE5IDM6MDAgUE0KPiBUbzogYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKPiBDYzogRmVuZywgS2VubmV0aCA8S2VubmV0aC5GZW5nQGFtZC5jb20+OyBR
dWFuLCBFdmFuCj4gPEV2YW4uUXVhbkBhbWQuY29tPjsgV2FuZywgS2V2aW4oWWFuZykgPEtldmlu
MS5XYW5nQGFtZC5jb20+Cj4gU3ViamVjdDogW1BBVENIIDMvM10gZHJtL2FtZC9wb3dlcnBsYXk6
IGF2b2lkIGRvdWJsZSBjaGVjayBmZWF0dXJlCj4gZW5hYmxlZAo+IAo+IHRoZSB1bmZvcmNlX2Rw
bV9sZXZlbHMgZG9lc24ndCBuZWVkIHRvIGNoZWNrIGZlYXR1cmUgZW5hYmxlLCBiZWNhdXNlIHRo
ZQo+IHNtdV9nZXRfZHBtX2ZyZXFfcmFuZ2UgZnVuY3Rpb24gaGFzIGNoZWNrIGZlYXR1cmUgbG9n
aWMuCj4gCj4gQ2hhbmdlLUlkOiBJNmFlNjJiMzU1YWE3NmEwMGYwZjZlMTY0Y2Q5ODQ4ZmIzMmZj
N2MxMgo+IFNpZ25lZC1vZmYtYnk6IEtldmluIFdhbmcgPGtldmluMS53YW5nQGFtZC5jb20+Cj4g
LS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYyB8IDIzICsr
KysrKysrLS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwg
MTUgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93
ZXJwbGF5L25hdmkxMF9wcHQuYwo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2
aTEwX3BwdC5jCj4gaW5kZXggMTZhNGMxY2E5OGNmLi44OTVhNGU1OTJkNWEgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jCj4gQEAgLTgzMywyNyArODMz
LDIwIEBAIHN0YXRpYyBpbnQgbmF2aTEwX2ZvcmNlX2RwbV9saW1pdF92YWx1ZShzdHJ1Y3QKPiBz
bXVfY29udGV4dCAqc211LCBib29sIGhpZ2hlc3QpCj4gIAlyZXR1cm4gcmV0Owo+ICB9Cj4gCj4g
LXN0YXRpYyBpbnQgbmF2aTEwX3VuZm9yY2VfZHBtX2xldmVscyhzdHJ1Y3Qgc211X2NvbnRleHQg
KnNtdSkgewo+IC0KPiArc3RhdGljIGludCBuYXZpMTBfdW5mb3JjZV9kcG1fbGV2ZWxzKHN0cnVj
dCBzbXVfY29udGV4dCAqc211KSB7Cj4gIAlpbnQgcmV0ID0gMCwgaSA9IDA7Cj4gIAl1aW50MzJf
dCBtaW5fZnJlcSwgbWF4X2ZyZXE7Cj4gIAllbnVtIHNtdV9jbGtfdHlwZSBjbGtfdHlwZTsKPiAK
PiAtCXN0cnVjdCBjbGtfZmVhdHVyZV9tYXAgewo+IC0JCWVudW0gc211X2Nsa190eXBlIGNsa190
eXBlOwo+IC0JCXVpbnQzMl90CWZlYXR1cmU7Cj4gLQl9IGNsa19mZWF0dXJlX21hcFtdID0gewo+
IC0JCXtTTVVfR0ZYQ0xLLCBTTVVfRkVBVFVSRV9EUE1fR0ZYQ0xLX0JJVH0sCj4gLQkJe1NNVV9N
Q0xLLCAgIFNNVV9GRUFUVVJFX0RQTV9VQ0xLX0JJVH0sCj4gLQkJe1NNVV9TT0NDTEssIFNNVV9G
RUFUVVJFX0RQTV9TT0NDTEtfQklUfSwKPiArCWVudW0gc211X2Nsa190eXBlIGNsa3NbXSA9IHsK
PiArCQlTTVVfR0ZYQ0xLLAo+ICsJCVNNVV9NQ0xLLAo+ICsJCVNNVV9TT0NDTEssCj4gIAl9Owo+
IAo+IC0JZm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUoY2xrX2ZlYXR1cmVfbWFwKTsgaSsrKSB7
Cj4gLQkJaWYgKCFzbXVfZmVhdHVyZV9pc19lbmFibGVkKHNtdSwKPiBjbGtfZmVhdHVyZV9tYXBb
aV0uZmVhdHVyZSkpCj4gLQkJICAgIGNvbnRpbnVlOwo+IC0KPiAtCQljbGtfdHlwZSA9IGNsa19m
ZWF0dXJlX21hcFtpXS5jbGtfdHlwZTsKPiAtCj4gKwlmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0la
RShjbGtzKTsgaSsrKSB7Cj4gKwkJY2xrX3R5cGUgPSBjbGtzW2ldOwo+ICAJCXJldCA9IHNtdV9n
ZXRfZHBtX2ZyZXFfcmFuZ2Uoc211LCBjbGtfdHlwZSwgJm1pbl9mcmVxLAo+ICZtYXhfZnJlcSk7
Cj4gIAkJaWYgKHJldCkKPiAgCQkJcmV0dXJuIHJldDsKPiAtLQo+IDIuMjIuMAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxp
c3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
