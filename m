Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0EC2B72FF
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Sep 2019 08:05:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 927466F42D;
	Thu, 19 Sep 2019 06:05:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740081.outbound.protection.outlook.com [40.107.74.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 219236F42D
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 06:05:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D0M5e0Nu7WiKmdEeZgwrveRnrzRqvyogQR+lZeL1WekHLEfO4qfSiLAgZN7bOrZYhrxoQkm9zuGF4UURWvsVKaB7SX8YtrEkbWVIOMbYjtbAF0iLbJaa57jDkpp2oJe/igvktVJJ/8P9lEWFnXPunMTr995+GiPmlh68vE/nF0frpxT4LVFmOpsgxJ4Z7xSBwe5WcF9+kc5bqSyaOnuLjgurFi6s3836yZrCHzx4MKrxZ50exHtXczkaPGLKbZ4E5NAJcZphIbvFlmlGuGB4oREvAG6uXvryRgaHxz0NTfKfZ8q51ThrzipNqZJPUs6cviiOyqcQews6je8uxD8+bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Xm7bd78m8+6oU6rJQf+j9lurAFdQkPsfaR65hCqe3w=;
 b=S91N1cKsovHISM2YzFpysgdIyU4sS/tOsZ4XDdil7ZmrnrnxyjKQSdU3xk7Tt5tqXV2+GX42Z+HceXR1ZouTfwFKaNkjRoPucWnlrIaDhThGu9Oo3LJBNSyX6Q68+BLAHVTYcIN6w0P3j8XWOlZqVwMKHQ+f+HHhHKHyv3DFZNpPLxaDJNCDMZVtW55LLZKzni1sOUsuo80KvTRf0f+mhA2t+NoqkvHWc69A+FRIKuPwuH428AdWk9YTeMVXY0CWIk+wt/RZguiedBTJptNiSuLTu2G06CbRH/LuCk0ql+UrqpS+RMLkl6MU+uiWUW6VHgSb6eofn37fFkjgbfNpWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB3767.namprd12.prod.outlook.com (52.132.244.213) by
 CH2PR12MB3942.namprd12.prod.outlook.com (52.132.244.29) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.19; Thu, 19 Sep 2019 06:05:48 +0000
Received: from CH2PR12MB3767.namprd12.prod.outlook.com
 ([fe80::dc49:bed0:febe:4f5]) by CH2PR12MB3767.namprd12.prod.outlook.com
 ([fe80::dc49:bed0:febe:4f5%7]) with mapi id 15.20.2263.023; Thu, 19 Sep 2019
 06:05:48 +0000
From: "Xu, Feifei" <Feifei.Xu@amd.com>
To: "Yin, Tianci (Rico)" <Tianci.Yin@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu/gfx10: add support for wks firmware loading
Thread-Topic: [PATCH] drm/amdgpu/gfx10: add support for wks firmware loading
Thread-Index: AQHVbquyiRsQLJ9BaEy6lD+2kTI0sacygynA
Date: Thu, 19 Sep 2019 06:05:47 +0000
Message-ID: <CH2PR12MB37670D6362ADEBD444190252FE890@CH2PR12MB3767.namprd12.prod.outlook.com>
References: <20190919053247.14172-1-tianci.yin@amd.com>
In-Reply-To: <20190919053247.14172-1-tianci.yin@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8bda8e7f-7087-4472-7af1-08d73cc76aa2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CH2PR12MB3942; 
x-ms-traffictypediagnostic: CH2PR12MB3942:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR12MB3942C4230E916A405D287A8CFE890@CH2PR12MB3942.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:352;
x-forefront-prvs: 016572D96D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(136003)(366004)(376002)(39860400002)(13464003)(199004)(189003)(6116002)(186003)(478600001)(8936002)(33656002)(66066001)(7696005)(5660300002)(99286004)(14454004)(316002)(86362001)(110136005)(54906003)(2906002)(6436002)(25786009)(6506007)(26005)(76176011)(53546011)(8676002)(3846002)(81156014)(81166006)(71190400001)(11346002)(476003)(71200400001)(486006)(66556008)(66446008)(66946007)(4326008)(74316002)(256004)(14444005)(102836004)(66476007)(2501003)(446003)(6246003)(64756008)(229853002)(305945005)(7736002)(52536014)(55016002)(76116006)(6306002)(966005)(9686003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB3942;
 H:CH2PR12MB3767.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +pChNtqfkxE2272NNj30jhfVAGlIXYteT3H7L2ZbIk4ojH2AZBIe2jVnBdlhTTvsorPskWOBBy+iBTobz0JmEDpXNHe6uWPAZqGq0vMFUNiEmzVX96UUJNRxOKKCWtf8lu+EW9Z/VPbFYVfz6pnWapuwe1Ig5wBFkjK/qxBWrNXXtm/05FHeyMP1vfyd466XcI+bUGyRF27e9tBzQvwjtZNWeq23r73yhSeezr3ZiMY/yn9rbpRrKnA+mhGwpyqlOxr1lIAZ4iVKoNNsQE1sp5O1kvse9mw67IAU5kQPah3j493AHv/w4jjsBz8nYPK5HbiXZ6gClWVybJo59Z+KPgxAorJ80m+ZVn6aPOtwXuGAD6sOgs2yeYENckXL/XR96OYMZK/3TUyPF5CS3eyYZyKj1DwrrFuCYfqNuxMk3DA=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bda8e7f-7087-4472-7af1-08d73cc76aa2
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2019 06:05:47.9567 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GDdYj0g0GCR1ZEKpfSzb6FW4+M5KzjnbkIKn6nGIxx5J9vzREELzWonltbrF65Jj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3942
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Xm7bd78m8+6oU6rJQf+j9lurAFdQkPsfaR65hCqe3w=;
 b=rtOLLd3R20mw3SbDptCVDG7ZolcGLDUA/KUMpnyZjW7c+249Jw7tG7AW7DxlKSiwKUn47+2NQJ2AKv0UCoKRZwi3lQkmfWcaj10P/OOnE+NQ0w40KP73KNHDIINtbY0CYpFI9HajXD8DdlY7WtXoKLijAHOwnMCOptwVv2XlgTs=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Feifei.Xu@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Yin,
 Tianci \(Rico\)" <Tianci.Yin@amd.com>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

DQoNClJldmlld2VkLWJ5OiBGZWlmZWkgWHUgPEZlaWZlaS5YdUBhbWQuY29tPg0KDQotLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogYW1kLWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIFRpYW5jaSBZaW4NClNlbnQ6IFRodXJzZGF5
LCBTZXB0ZW1iZXIgMTksIDIwMTkgMTozMyBQTQ0KVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnDQpDYzogRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29t
PjsgWWluLCBUaWFuY2kgKFJpY28pIDxUaWFuY2kuWWluQGFtZC5jb20+OyBaaGFuZywgSGF3a2lu
ZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPg0KU3ViamVjdDogW1BBVENIXSBkcm0vYW1kZ3B1L2dm
eDEwOiBhZGQgc3VwcG9ydCBmb3Igd2tzIGZpcm13YXJlIGxvYWRpbmcNCg0KRnJvbTogIlRpYW5j
aS5ZaW4iIDx0aWFuY2kueWluQGFtZC5jb20+DQoNCmxvYWQgZGlmZmVyZW50IGNwIGZpcm13YXJl
IGFjY29yZGluZyB0byB0aGUgRElEIGFuZCBSSUQNCg0KU2lnbmVkLW9mZi1ieTogVGlhbmNpLllp
biA8dGlhbmNpLnlpbkBhbWQuY29tPg0KLS0tDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
Z2Z4X3YxMF8wLmMgfCAyMiArKysrKysrKysrKysrKysrLS0tLS0tDQogMSBmaWxlIGNoYW5nZWQs
IDE2IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2dmeF92MTBfMC5jDQppbmRleCAwODJhMGIzMjk4YTkuLjY1Y2FmNDA0ZTdkMSAxMDA2NDQN
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jDQorKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYw0KQEAgLTY2LDYgKzY2LDExIEBAIE1P
RFVMRV9GSVJNV0FSRSgiYW1kZ3B1L25hdmkxMF9tZWMuYmluIik7DQogTU9EVUxFX0ZJUk1XQVJF
KCJhbWRncHUvbmF2aTEwX21lYzIuYmluIik7DQogTU9EVUxFX0ZJUk1XQVJFKCJhbWRncHUvbmF2
aTEwX3JsYy5iaW4iKTsNCiANCitNT0RVTEVfRklSTVdBUkUoImFtZGdwdS9uYXZpMTRfY2Vfd2tz
LmJpbiIpOw0KK01PRFVMRV9GSVJNV0FSRSgiYW1kZ3B1L25hdmkxNF9wZnBfd2tzLmJpbiIpOw0K
K01PRFVMRV9GSVJNV0FSRSgiYW1kZ3B1L25hdmkxNF9tZV93a3MuYmluIik7DQorTU9EVUxFX0ZJ
Uk1XQVJFKCJhbWRncHUvbmF2aTE0X21lY193a3MuYmluIik7DQorTU9EVUxFX0ZJUk1XQVJFKCJh
bWRncHUvbmF2aTE0X21lYzJfd2tzLmJpbiIpOw0KIE1PRFVMRV9GSVJNV0FSRSgiYW1kZ3B1L25h
dmkxNF9jZS5iaW4iKTsNCiBNT0RVTEVfRklSTVdBUkUoImFtZGdwdS9uYXZpMTRfcGZwLmJpbiIp
Ow0KIE1PRFVMRV9GSVJNV0FSRSgiYW1kZ3B1L25hdmkxNF9tZS5iaW4iKTsNCkBAIC01OTEsNyAr
NTk2LDggQEAgc3RhdGljIHZvaWQgZ2Z4X3YxMF8wX2NoZWNrX2dmeG9mZl9mbGFnKHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2KSAgc3RhdGljIGludCBnZnhfdjEwXzBfaW5pdF9taWNyb2NvZGUo
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpICB7DQogCWNvbnN0IGNoYXIgKmNoaXBfbmFtZTsN
Ci0JY2hhciBmd19uYW1lWzMwXTsNCisJY2hhciBmd19uYW1lWzQwXTsNCisJY2hhciB3a3NbMTBd
Ow0KIAlpbnQgZXJyOw0KIAlzdHJ1Y3QgYW1kZ3B1X2Zpcm13YXJlX2luZm8gKmluZm8gPSBOVUxM
Ow0KIAljb25zdCBzdHJ1Y3QgY29tbW9uX2Zpcm13YXJlX2hlYWRlciAqaGVhZGVyID0gTlVMTDsg
QEAgLTYwNCwxMiArNjEwLDE2IEBAIHN0YXRpYyBpbnQgZ2Z4X3YxMF8wX2luaXRfbWljcm9jb2Rl
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0KIA0KIAlEUk1fREVCVUcoIlxuIik7DQogDQor
CW1lbXNldCh3a3MsIDAsIHNpemVvZih3a3MpKTsNCiAJc3dpdGNoIChhZGV2LT5hc2ljX3R5cGUp
IHsNCiAJY2FzZSBDSElQX05BVkkxMDoNCiAJCWNoaXBfbmFtZSA9ICJuYXZpMTAiOw0KIAkJYnJl
YWs7DQogCWNhc2UgQ0hJUF9OQVZJMTQ6DQogCQljaGlwX25hbWUgPSAibmF2aTE0IjsNCisJCWlm
ICghKGFkZXYtPnBkZXYtPmRldmljZSA9PSAweDczNDAgJiYNCisJCSAgICAgIGFkZXYtPnBkZXYt
PnJldmlzaW9uICE9IDB4MDApKQ0KKwkJCXNucHJpbnRmKHdrcywgc2l6ZW9mKHdrcyksICJfd2tz
Iik7DQogCQlicmVhazsNCiAJY2FzZSBDSElQX05BVkkxMjoNCiAJCWNoaXBfbmFtZSA9ICJuYXZp
MTIiOw0KQEAgLTYxOCw3ICs2MjgsNyBAQCBzdGF0aWMgaW50IGdmeF92MTBfMF9pbml0X21pY3Jv
Y29kZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCiAJCUJVRygpOw0KIAl9DQogDQotCXNu
cHJpbnRmKGZ3X25hbWUsIHNpemVvZihmd19uYW1lKSwgImFtZGdwdS8lc19wZnAuYmluIiwgY2hp
cF9uYW1lKTsNCisJc25wcmludGYoZndfbmFtZSwgc2l6ZW9mKGZ3X25hbWUpLCAiYW1kZ3B1LyVz
X3BmcCVzLmJpbiIsIGNoaXBfbmFtZSwgDQord2tzKTsNCiAJZXJyID0gcmVxdWVzdF9maXJtd2Fy
ZSgmYWRldi0+Z2Z4LnBmcF9mdywgZndfbmFtZSwgYWRldi0+ZGV2KTsNCiAJaWYgKGVycikNCiAJ
CWdvdG8gb3V0Ow0KQEAgLTYyOSw3ICs2MzksNyBAQCBzdGF0aWMgaW50IGdmeF92MTBfMF9pbml0
X21pY3JvY29kZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCiAJYWRldi0+Z2Z4LnBmcF9m
d192ZXJzaW9uID0gbGUzMl90b19jcHUoY3BfaGRyLT5oZWFkZXIudWNvZGVfdmVyc2lvbik7DQog
CWFkZXYtPmdmeC5wZnBfZmVhdHVyZV92ZXJzaW9uID0gbGUzMl90b19jcHUoY3BfaGRyLT51Y29k
ZV9mZWF0dXJlX3ZlcnNpb24pOw0KIA0KLQlzbnByaW50Zihmd19uYW1lLCBzaXplb2YoZndfbmFt
ZSksICJhbWRncHUvJXNfbWUuYmluIiwgY2hpcF9uYW1lKTsNCisJc25wcmludGYoZndfbmFtZSwg
c2l6ZW9mKGZ3X25hbWUpLCAiYW1kZ3B1LyVzX21lJXMuYmluIiwgY2hpcF9uYW1lLCANCit3a3Mp
Ow0KIAllcnIgPSByZXF1ZXN0X2Zpcm13YXJlKCZhZGV2LT5nZngubWVfZncsIGZ3X25hbWUsIGFk
ZXYtPmRldik7DQogCWlmIChlcnIpDQogCQlnb3RvIG91dDsNCkBAIC02NDAsNyArNjUwLDcgQEAg
c3RhdGljIGludCBnZnhfdjEwXzBfaW5pdF9taWNyb2NvZGUoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYpDQogCWFkZXYtPmdmeC5tZV9md192ZXJzaW9uID0gbGUzMl90b19jcHUoY3BfaGRyLT5o
ZWFkZXIudWNvZGVfdmVyc2lvbik7DQogCWFkZXYtPmdmeC5tZV9mZWF0dXJlX3ZlcnNpb24gPSBs
ZTMyX3RvX2NwdShjcF9oZHItPnVjb2RlX2ZlYXR1cmVfdmVyc2lvbik7DQogDQotCXNucHJpbnRm
KGZ3X25hbWUsIHNpemVvZihmd19uYW1lKSwgImFtZGdwdS8lc19jZS5iaW4iLCBjaGlwX25hbWUp
Ow0KKwlzbnByaW50Zihmd19uYW1lLCBzaXplb2YoZndfbmFtZSksICJhbWRncHUvJXNfY2Ulcy5i
aW4iLCBjaGlwX25hbWUsIA0KK3drcyk7DQogCWVyciA9IHJlcXVlc3RfZmlybXdhcmUoJmFkZXYt
PmdmeC5jZV9mdywgZndfbmFtZSwgYWRldi0+ZGV2KTsNCiAJaWYgKGVycikNCiAJCWdvdG8gb3V0
Ow0KQEAgLTcwNSw3ICs3MTUsNyBAQCBzdGF0aWMgaW50IGdmeF92MTBfMF9pbml0X21pY3JvY29k
ZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCiAJaWYgKGFkZXYtPmdmeC5ybGMuaXNfcmxj
X3YyXzEpDQogCQlnZnhfdjEwXzBfaW5pdF9ybGNfZXh0X21pY3JvY29kZShhZGV2KTsNCiANCi0J
c25wcmludGYoZndfbmFtZSwgc2l6ZW9mKGZ3X25hbWUpLCAiYW1kZ3B1LyVzX21lYy5iaW4iLCBj
aGlwX25hbWUpOw0KKwlzbnByaW50Zihmd19uYW1lLCBzaXplb2YoZndfbmFtZSksICJhbWRncHUv
JXNfbWVjJXMuYmluIiwgY2hpcF9uYW1lLCANCit3a3MpOw0KIAllcnIgPSByZXF1ZXN0X2Zpcm13
YXJlKCZhZGV2LT5nZngubWVjX2Z3LCBmd19uYW1lLCBhZGV2LT5kZXYpOw0KIAlpZiAoZXJyKQ0K
IAkJZ290byBvdXQ7DQpAQCAtNzE2LDcgKzcyNiw3IEBAIHN0YXRpYyBpbnQgZ2Z4X3YxMF8wX2lu
aXRfbWljcm9jb2RlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0KIAlhZGV2LT5nZngubWVj
X2Z3X3ZlcnNpb24gPSBsZTMyX3RvX2NwdShjcF9oZHItPmhlYWRlci51Y29kZV92ZXJzaW9uKTsN
CiAJYWRldi0+Z2Z4Lm1lY19mZWF0dXJlX3ZlcnNpb24gPSBsZTMyX3RvX2NwdShjcF9oZHItPnVj
b2RlX2ZlYXR1cmVfdmVyc2lvbik7DQogDQotCXNucHJpbnRmKGZ3X25hbWUsIHNpemVvZihmd19u
YW1lKSwgImFtZGdwdS8lc19tZWMyLmJpbiIsIGNoaXBfbmFtZSk7DQorCXNucHJpbnRmKGZ3X25h
bWUsIHNpemVvZihmd19uYW1lKSwgImFtZGdwdS8lc19tZWMyJXMuYmluIiwgY2hpcF9uYW1lLCAN
Cit3a3MpOw0KIAllcnIgPSByZXF1ZXN0X2Zpcm13YXJlKCZhZGV2LT5nZngubWVjMl9mdywgZndf
bmFtZSwgYWRldi0+ZGV2KTsNCiAJaWYgKCFlcnIpIHsNCiAJCWVyciA9IGFtZGdwdV91Y29kZV92
YWxpZGF0ZShhZGV2LT5nZngubWVjMl9mdyk7DQotLQ0KMi4xNy4xDQoNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQphbWQtZ2Z4IG1haWxpbmcgbGlzdA0K
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4
