Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC7B68244
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 04:36:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 855CD89503;
	Mon, 15 Jul 2019 02:36:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810087.outbound.protection.outlook.com [40.107.81.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BB2289503
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 02:36:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jU6hoh5n9sn1KdY3gzfcAqjkwRmqTQ1Of2tqHHMsB6yoFtAV1+4fDa6dT/PT4BzHQhLyWG3RjHQsDT48p7qjrnfjWJpqVt4E+fUkTqzghfeSrDT6mP59l4mAi2weIwkqaY/6HRLhffSy1fHmO70Th3PESgPapk3JUHskQwsHCuZx6xMxM7dfpTDektB3aprsfgvVeCDaRjiG6aLRylnWrbUMhDF9+aFd7p82jnMhIEcKwpBjuHaC4NS3hG6akJU0xyYUKG5DVisePd2iXP2VLO59hOPEdEjYYmfhbD/eo1oFUt+162kTKuOnbpfMCafHW7OIbdhNP6VrTdkpZO5sjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dN3BRCJD/7AVV63/A9IkWbw5oXYTOX5AlgMIqq6AJns=;
 b=nceL1iemT74k3ST+uQQMaE5aLhRmyM56ygkdCygHP3Gt22xNdG6KvV1ebtbY6pCk0eYC8nicpiHzCv9Y4D027lN/G9+CWaM7zZyAb78sJ/fhNWnFfb1vGxd7tcfhqFNdjW4YY6woFsYmjfPbXX9pZVk2qZ3d+WKoAZN4+0i4uXEhno19nS5uBzjrfR559vyjNG5vq94t6h8v2Myp2yBuVDceq6t+kdcCFzcQjlPNEa7SgTvzZXCSP95P+gSfy7R8HX0vapK9tx+FscM7lFgSSoRjBWiQlqr5XmIE8Kou99iIrfmROIiwFh53G5tBq0HhcMWVrOr49QvsoyMyg4wrqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB4143.namprd12.prod.outlook.com (10.255.224.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Mon, 15 Jul 2019 02:31:41 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::9170:5b18:b195:24b1]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::9170:5b18:b195:24b1%3]) with mapi id 15.20.2073.012; Mon, 15 Jul 2019
 02:31:41 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v2] drm/amd/powerplay: add helper of
 smu_clk_dpm_is_enabled for smu
Thread-Topic: [PATCH v2] drm/amd/powerplay: add helper of
 smu_clk_dpm_is_enabled for smu
Thread-Index: AQHVOJiKtJuf6b+uRkmnGadDPCnbPabK+Jtg
Date: Mon, 15 Jul 2019 02:31:41 +0000
Message-ID: <MN2PR12MB33440B9AF459C11C34D2B019E4CF0@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <20190712095930.16268-1-kevin1.wang@amd.com>
In-Reply-To: <20190712095930.16268-1-kevin1.wang@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 00a572e2-c989-4a22-489b-08d708cc9248
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB4143; 
x-ms-traffictypediagnostic: MN2PR12MB4143:
x-microsoft-antispam-prvs: <MN2PR12MB4143A7D81609BE7EBBDA502AE4CF0@MN2PR12MB4143.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 00997889E7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(396003)(346002)(366004)(39860400002)(189003)(199004)(13464003)(6436002)(66476007)(64756008)(66556008)(5660300002)(4326008)(229853002)(81166006)(86362001)(25786009)(33656002)(9686003)(8676002)(74316002)(305945005)(7736002)(81156014)(52536014)(66446008)(2501003)(76116006)(66946007)(6116002)(3846002)(478600001)(8936002)(11346002)(6506007)(53546011)(7696005)(316002)(26005)(76176011)(256004)(6246003)(14444005)(2906002)(14454004)(55016002)(486006)(68736007)(71200400001)(71190400001)(53936002)(99286004)(110136005)(446003)(102836004)(476003)(66066001)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4143;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: EMyar9U/hHpL/jCPlY8ZWzxdX/Q/icys3qDQqbaQzQqtm8silHfEspK0airXdv7SWelhqYryeqMaXNubSNBe5ohgAofWOr7I1NczT2JqhxHTvNJuD86xdgj1++Ox1EX1Zfi9CNIk6jTVp9PlkgiytYqGeEQtConj+/ksTI+rYbn07bXH+CNb6v46ahY00DvU5+013WZv6kDtWL+o8GtgGnHipg5pme0oDRNqIGOh43R1T3cQspq7S4oayszPpo9opHPHRBcT/DJ3tYMWvnakqcVxwoTYJPK3bPaPDvXhhnCWDTlpv+fcYCw25yfxB2nj8UOI3mACGUV8EL1nb89z+IPN4noJmlxspV+QoJBTF7Ot409nYtpIM9Oey38T0rz8SRGdERyJZij5qfhwelLzrUYJ6VTKl87rNhrCXMjoS80=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00a572e2-c989-4a22-489b-08d708cc9248
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2019 02:31:41.5516 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: equan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4143
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dN3BRCJD/7AVV63/A9IkWbw5oXYTOX5AlgMIqq6AJns=;
 b=doE42FfMoWSKdzTkSIGkIW5HvoNoyZdHFRAbJdmcj9Bqzlz5euIcllbJ9gwa+XtrMZh4KfsQ34ySEGTgbki3ZvbVA/tgvyvrKr+xiw5UYWMPPO5ZSaU0Si+X0rp8pR6bscW6HWk7DSB4OdcrgiR3/KJstow121S3vWc4gCPtO7k=
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

VXN1YWxseSBmb3IgQVBJICAqaXNfZW5hYmxlZCwgZWl0aGVyIDAgb3IgMSBzaG91bGQgYmUgcmV0
dXJuZWQuCk9yIHlvdSBjYW4gZ2l2ZSB0aGUgQVBJIGEgbmV3IG5hbWluZy4gCldpdGggdGhhdCBh
ZGRyZXNzZWQsIHRoZSBwYXRjaCBpcyByZXZpZXdlZC1ieTogRXZhbiBRdWFuIDxldmFuLnF1YW5A
YW1kLmNvbT4KClJlZ2FyZHMsCkV2YW4KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZy
b206IFdhbmcsIEtldmluKFlhbmcpIDxLZXZpbjEuV2FuZ0BhbWQuY29tPgo+IFNlbnQ6IEZyaWRh
eSwgSnVseSAxMiwgMjAxOSA2OjAwIFBNCj4gVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCj4gQ2M6IEZlbmcsIEtlbm5ldGggPEtlbm5ldGguRmVuZ0BhbWQuY29tPjsgUXVhbiwgRXZh
bgo+IDxFdmFuLlF1YW5AYW1kLmNvbT47IFdhbmcsIEtldmluKFlhbmcpIDxLZXZpbjEuV2FuZ0Bh
bWQuY29tPgo+IFN1YmplY3Q6IFtQQVRDSCB2Ml0gZHJtL2FtZC9wb3dlcnBsYXk6IGFkZCBoZWxw
ZXIgb2YKPiBzbXVfY2xrX2RwbV9pc19lbmFibGVkIGZvciBzbXUKPiAKPiB2MjogY2hhbmdlIGZ1
bmN0aW9uIG5hbWUgdG8gc211X2Nsa19kcG1faXNfZW5hYmxlZC4KPiBhZGQgdGhpcyBoZWxwZXIg
ZnVuY3Rpb24gdG8gY2hlY2sgZHBtIGNsayBmZWF0dXJlIGlzIGVuYWJsZWQuCj4gCj4gQ2hhbmdl
LUlkOiBJN2Y5OTQ5MDMzYzMxOGZlYzYxOGE5NzAxZGY0YTA4MmQ1NGE2MjZjOAo+IFNpZ25lZC1v
ZmYtYnk6IEtldmluIFdhbmcgPGtldmluMS53YW5nQGFtZC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYyAgICB8IDY5ICsrKysrKysrKysrKy0t
LS0tCj4gLS0KPiAgLi4uL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5oICAg
IHwgIDEgKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDQ3IGluc2VydGlvbnMoKyksIDIzIGRlbGV0aW9u
cygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRn
cHVfc211LmMKPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYwo+
IGluZGV4IDc4N2EyOTNmZGU5Ny4uYzE2MTk1ZTE5MDc4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYwo+IEBAIC02OSw2ICs2OSwxMCBAQCBpbnQgc211
X3NldF9zb2Z0X2ZyZXFfcmFuZ2Uoc3RydWN0IHNtdV9jb250ZXh0Cj4gKnNtdSwgZW51bSBzbXVf
Y2xrX3R5cGUgY2xrX3R5cGUsCj4gIAlpZiAobWluIDw9IDAgJiYgbWF4IDw9IDApCj4gIAkJcmV0
dXJuIC1FSU5WQUw7Cj4gCj4gKwlyZXQgPSBzbXVfY2xrX2RwbV9pc19lbmFibGVkKHNtdSwgY2xr
X3R5cGUpOwo+ICsJaWYgKHJldCkKPiArCQlyZXR1cm4gcmV0Owo+ICsKPiAgCWNsa19pZCA9IHNt
dV9jbGtfZ2V0X2luZGV4KHNtdSwgY2xrX3R5cGUpOwo+ICAJaWYgKGNsa19pZCA8IDApCj4gIAkJ
cmV0dXJuIGNsa19pZDsKPiBAQCAtMTAyLDYgKzEwNiwxMCBAQCBpbnQgc211X3NldF9oYXJkX2Zy
ZXFfcmFuZ2Uoc3RydWN0IHNtdV9jb250ZXh0Cj4gKnNtdSwgZW51bSBzbXVfY2xrX3R5cGUgY2xr
X3R5cGUsCj4gIAlpZiAobWluIDw9IDAgJiYgbWF4IDw9IDApCj4gIAkJcmV0dXJuIC1FSU5WQUw7
Cj4gCj4gKwlyZXQgPSBzbXVfY2xrX2RwbV9pc19lbmFibGVkKHNtdSwgY2xrX3R5cGUpOwo+ICsJ
aWYgKHJldCkKPiArCQlyZXR1cm4gcmV0Owo+ICsKPiAgCWNsa19pZCA9IHNtdV9jbGtfZ2V0X2lu
ZGV4KHNtdSwgY2xrX3R5cGUpOwo+ICAJaWYgKGNsa19pZCA8IDApCj4gIAkJcmV0dXJuIGNsa19p
ZDsKPiBAQCAtMTM1LDI5ICsxNDMsOSBAQCBpbnQgc211X2dldF9kcG1fZnJlcV9yYW5nZShzdHJ1
Y3Qgc211X2NvbnRleHQKPiAqc211LCBlbnVtIHNtdV9jbGtfdHlwZSBjbGtfdHlwZSwKPiAgCWlm
ICghbWluICYmICFtYXgpCj4gIAkJcmV0dXJuIC1FSU5WQUw7Cj4gCj4gLQlzd2l0Y2ggKGNsa190
eXBlKSB7Cj4gLQljYXNlIFNNVV9NQ0xLOgo+IC0JY2FzZSBTTVVfVUNMSzoKPiAtCQlpZiAoIXNt
dV9mZWF0dXJlX2lzX2VuYWJsZWQoc211LAo+IFNNVV9GRUFUVVJFX0RQTV9VQ0xLX0JJVCkpIHsK
PiAtCQkJcHJfd2FybigidWNsayBkcG0gaXMgbm90IGVuYWJsZWRcbiIpOwo+IC0JCQlyZXR1cm4g
MDsKPiAtCQl9Cj4gLQkJYnJlYWs7Cj4gLQljYXNlIFNNVV9HRlhDTEs6Cj4gLQljYXNlIFNNVV9T
Q0xLOgo+IC0JCWlmICghc211X2ZlYXR1cmVfaXNfZW5hYmxlZChzbXUsCj4gU01VX0ZFQVRVUkVf
RFBNX0dGWENMS19CSVQpKSB7Cj4gLQkJCXByX3dhcm4oImdmeGNsayBkcG0gaXMgbm90IGVuYWJs
ZWRcbiIpOwo+IC0JCQlyZXR1cm4gMDsKPiAtCQl9Cj4gLQljYXNlIFNNVV9TT0NDTEs6Cj4gLQkJ
aWYgKCFzbXVfZmVhdHVyZV9pc19lbmFibGVkKHNtdSwKPiBTTVVfRkVBVFVSRV9EUE1fU09DQ0xL
X0JJVCkpIHsKPiAtCQkJcHJfd2Fybigic29ja2NsayBkcG0gaXMgbm90IGVuYWJsZWRcbiIpOwo+
IC0JCQlyZXR1cm4gMDsKPiAtCQl9Cj4gLQkJYnJlYWs7Cj4gLQlkZWZhdWx0Ogo+IC0JCWJyZWFr
Owo+IC0JfQo+ICsJcmV0ID0gc211X2Nsa19kcG1faXNfZW5hYmxlZChzbXUsIGNsa190eXBlKTsK
PiArCWlmIChyZXQpCj4gKwkJcmV0dXJuIHJldDsKPiAKPiAgCW11dGV4X2xvY2soJnNtdS0+bXV0
ZXgpOwo+ICAJY2xrX2lkID0gc211X2Nsa19nZXRfaW5kZXgoc211LCBjbGtfdHlwZSk7IEBAIC0y
MDAsNiArMTg4LDEwIEBACj4gaW50IHNtdV9nZXRfZHBtX2ZyZXFfYnlfaW5kZXgoc3RydWN0IHNt
dV9jb250ZXh0ICpzbXUsIGVudW0KPiBzbXVfY2xrX3R5cGUgY2xrX3R5cAo+ICAJaWYgKCF2YWx1
ZSkKPiAgCQlyZXR1cm4gLUVJTlZBTDsKPiAKPiArCXJldCA9IHNtdV9jbGtfZHBtX2lzX2VuYWJs
ZWQoc211LCBjbGtfdHlwZSk7Cj4gKwlpZiAocmV0KQo+ICsJCXJldHVybiByZXQ7Cj4gKwo+ICAJ
Y2xrX2lkID0gc211X2Nsa19nZXRfaW5kZXgoc211LCBjbGtfdHlwZSk7Cj4gIAlpZiAoY2xrX2lk
IDwgMCkKPiAgCQlyZXR1cm4gY2xrX2lkOwo+IEBAIC0yMjgsNiArMjIwLDM3IEBAIGludCBzbXVf
Z2V0X2RwbV9sZXZlbF9jb3VudChzdHJ1Y3Qgc211X2NvbnRleHQKPiAqc211LCBlbnVtIHNtdV9j
bGtfdHlwZSBjbGtfdHlwZSwKPiAgCXJldHVybiBzbXVfZ2V0X2RwbV9mcmVxX2J5X2luZGV4KHNt
dSwgY2xrX3R5cGUsIDB4ZmYsIHZhbHVlKTsgIH0KPiAKPiAraW50IHNtdV9jbGtfZHBtX2lzX2Vu
YWJsZWQoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIGVudW0KPiBzbXVfY2xrX3R5cGUKPiArY2xr
X3R5cGUpIHsKPiArCWludCByZXQgPSAwOwo+ICsJZW51bSBzbXVfZmVhdHVyZV9tYXNrIGZlYXR1
cmVfaWQgPSAwOwo+ICsKPiArCXN3aXRjaCAoY2xrX3R5cGUpIHsKPiArCWNhc2UgU01VX01DTEs6
Cj4gKwljYXNlIFNNVV9VQ0xLOgo+ICsJCWZlYXR1cmVfaWQgPSBTTVVfRkVBVFVSRV9EUE1fVUNM
S19CSVQ7Cj4gKwkJYnJlYWs7Cj4gKwljYXNlIFNNVV9HRlhDTEs6Cj4gKwljYXNlIFNNVV9TQ0xL
Ogo+ICsJCWZlYXR1cmVfaWQgPSBTTVVfRkVBVFVSRV9EUE1fR0ZYQ0xLX0JJVDsKPiArCQlicmVh
azsKPiArCWNhc2UgU01VX1NPQ0NMSzoKPiArCQlmZWF0dXJlX2lkID0gIFNNVV9GRUFUVVJFX0RQ
TV9TT0NDTEtfQklUOwo+ICsJCWJyZWFrOwo+ICsJZGVmYXVsdDoKPiArCQlyZXR1cm4gMDsKPiAr
CX0KPiArCj4gKwlyZXQgPSBzbXVfZmVhdHVyZV9pc19lbmFibGVkKHNtdSwgZmVhdHVyZV9pZCk7
Cj4gKwlpZiAocmV0KSB7Cj4gKwkJcHJfd2Fybigic211ICVkIGNsayBkcG0gZmVhdHVyZSAlZCBp
cyBub3QgZW5hYmxlZFxuIiwKPiBjbGtfdHlwZSwgZmVhdHVyZV9pZCk7Cj4gKwkJcmV0dXJuIC1F
QUNDRVM7Cj4gKwl9Cj4gKwo+ICsJcmV0dXJuIHJldDsKPiArfQo+ICsKPiArCj4gIGludCBzbXVf
ZHBtX3NldF9wb3dlcl9nYXRlKHN0cnVjdCBzbXVfY29udGV4dCAqc211LCB1aW50MzJfdAo+IGJs
b2NrX3R5cGUsCj4gIAkJCSAgIGJvb2wgZ2F0ZSkKPiAgewo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5oCj4gYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5oCj4gaW5kZXggYzk3MzI0ZWY3ZGIyLi40
NjI5YTY0YTkwZWQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkv
aW5jL2FtZGdwdV9zbXUuaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2lu
Yy9hbWRncHVfc211LmgKPiBAQCAtOTczLDUgKzk3Myw2IEBAIGludCBzbXVfc2V0X2hhcmRfZnJl
cV9yYW5nZShzdHJ1Y3Qgc211X2NvbnRleHQKPiAqc211LCBlbnVtIHNtdV9jbGtfdHlwZSBjbGtf
dHlwZSwgIGVudW0gYW1kX2RwbV9mb3JjZWRfbGV2ZWwKPiBzbXVfZ2V0X3BlcmZvcm1hbmNlX2xl
dmVsKHN0cnVjdCBzbXVfY29udGV4dCAqc211KTsgIGludAo+IHNtdV9mb3JjZV9wZXJmb3JtYW5j
ZV9sZXZlbChzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgZW51bQo+IGFtZF9kcG1fZm9yY2VkX2xl
dmVsIGxldmVsKTsgIGludCBzbXVfc2V0X2Rpc3BsYXlfY291bnQoc3RydWN0Cj4gc211X2NvbnRl
eHQgKnNtdSwgdWludDMyX3QgY291bnQpOwo+ICtpbnQgc211X2Nsa19kcG1faXNfZW5hYmxlZChz
dHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgZW51bQo+IHNtdV9jbGtfdHlwZQo+ICtjbGtfdHlwZSk7
Cj4gCj4gICNlbmRpZgo+IC0tCj4gMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZng=
