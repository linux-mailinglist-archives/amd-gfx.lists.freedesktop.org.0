Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E79DBA5B
	for <lists+amd-gfx@lfdr.de>; Fri, 18 Oct 2019 01:57:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF02A6E0D4;
	Thu, 17 Oct 2019 23:57:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690056.outbound.protection.outlook.com [40.107.69.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAAD06E0D4
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2019 23:57:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jVRPpoC3kuI1Ojk0/GpNwSacAdW36FCML8YF3myQMyadMpquparu5lRNqa2lJnSFZSiKbjrHG1CIpX6gSt7BfOvD/DVyxXUwV2heWj6mI73c2wQRwF4FfCWl2ci/WLtWytQovfPQW66Tvg4g5R5hFkHZD60ea5a1axhFq8E49Rb24cZVjSJzPBf6u1jTjVqoQzXfdRgiYMeOUbADvEW30n04fn3o7RsQv1kZCE7jRfsf1Qmvp2GhflVw7m5QhDCYVBnOwTiBsfpcqNaOqBKn0TEBa6yjZump3cR1BXqcKTAjUAS50SGghZJRiKnekhByfjGDz0aJ6Ja5q27zU3Ra+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=USWogZlolKefUVQyOr+2AyAfZAvXinTa9hhstqdvWxs=;
 b=f79iZpEYbrFGa42YHbOYh4UiZgm5/YiJ2/2EDO1/wqVJHxntfSSAvy+oifE5IaQtERnnoexzMtUgJ6Pxul1fZ9NuqSqxMrBijXY1UJOJibGEzxasuVIs4h0XUx3J5UFVkp+LnL/u8QyhnyQNfuZO79mjJzADaZEh3ytOOlalQGHCs9rUZOn+FT3vach6TlxJlXBWzvxKbqPgncl8sEGDNakGBfXgNjYvRJsTGRyleT1O9FWYhlmecgoayYxAF39H1Xb50+WRVMufXiYNY66DgN7DiqGFqFjzYVCeVIEQ5fF0IJjOIRyp2ICoLDPrYQeF6B+9GBXIwIt+Rf8imIKK8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2532.namprd12.prod.outlook.com (52.132.9.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.19; Thu, 17 Oct 2019 23:57:49 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::145c:4149:8b99:c3b4]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::145c:4149:8b99:c3b4%6]) with mapi id 15.20.2347.023; Thu, 17 Oct 2019
 23:57:49 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "Kim, Jonathan" <Jonathan.Kim@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: disable c-states on xgmi perfmons
Thread-Topic: [PATCH] drm/amdgpu: disable c-states on xgmi perfmons
Thread-Index: AQHVhISs0+WbYrMUA0mDJHHtV//DAqdeAH+ggAGDG3A=
Date: Thu, 17 Oct 2019 23:57:48 +0000
Message-ID: <BL0PR12MB2580AF5ECA046F3E88F60B01806D0@BL0PR12MB2580.namprd12.prod.outlook.com>
References: <20191017004852.6230-1-jonathan.kim@amd.com>
 <CH2PR12MB38317C33470907FA76768B47856D0@CH2PR12MB3831.namprd12.prod.outlook.com>
In-Reply-To: <CH2PR12MB38317C33470907FA76768B47856D0@CH2PR12MB3831.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2607:fea8:3c80:2a5:95b4:d334:a1e2:6e38]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d1af975e-3223-4276-9aed-08d7535dd072
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BL0PR12MB2532:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR12MB2532E9251B04E84335043C28806D0@BL0PR12MB2532.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 01930B2BA8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(396003)(346002)(376002)(366004)(189003)(199004)(13464003)(256004)(76176011)(66446008)(71200400001)(14454004)(2501003)(71190400001)(8936002)(76116006)(33656002)(66556008)(66476007)(64756008)(4326008)(186003)(25786009)(5660300002)(81156014)(66946007)(229853002)(81166006)(14444005)(7736002)(6506007)(8676002)(53546011)(7696005)(74316002)(102836004)(52536014)(86362001)(110136005)(55016002)(2906002)(99286004)(305945005)(486006)(476003)(478600001)(6246003)(966005)(316002)(6306002)(11346002)(9686003)(46003)(446003)(54906003)(6436002)(6116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2532;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XjyXsufrykBWRFDChEPje0EoeTleMXEFeiJh6z58gkE25KRWgTvZr6VJ8mbcbhsn43blwhKgxG84OVUpiDJ4sHvbD4GpScXISy1NaEVC/QSj5xNwZeNJrC5XBqv08ZrgkbKY446P99csQwEJXj8yGiC7iCa43g6ubE4ekVw+NmD8MuTcLcd9atHUQ0rUyYAQI1iwgtVAYTgOzk+2wTIICZ6F70v8in9lhw25ujz8W3ORbp9EkCLZzIkWdwZeK/XuOA1KRkBOv+LKo7zbzkM4CQrgG8iKtFjvM/b7typPvLcjgpWJ3D68Fkcri9bC+C2ofhzQq5KfWzSGg8rnLifMI/mQON5gICtIY3jqw1V+2U7BVQMaBojc0m2wIEEf8ZHIGMAT06g4g+a5PircFHmrNI/mQVR/uY3gkVZzE7opShMB9WhdMIxVSsDcH7hHJec3/aunb5UaZaqfExXpeJr65A==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1af975e-3223-4276-9aed-08d7535dd072
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2019 23:57:48.8551 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d9c6kBJNWMVtP1R5A1dlr1ZzKZNRMM+WgWNajmf89zAaKF6iU1r7hj4/4uyDBbUV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2532
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=USWogZlolKefUVQyOr+2AyAfZAvXinTa9hhstqdvWxs=;
 b=BQOk0bszKcUvUUSniJmNmsL1ADvF2BAGUcFFVllagDwGAwyp2KHuN38bFq+1xsD423bSGevgRLmCIsJxvItZckLAgFcAzy3CoaTo0ZrY8WHiQlkWFbdDPHdLYcpE4MH0TyK8nhTC6X+hfJgj/AKroPyHQCMTwjHTKaQF0NC7q6U=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Oak.Zeng@amd.com; 
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Quan,
 Evan" <Evan.Quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SXMgaXQgdGhlIGRlc2lnbiB0aGF0IHdlIGhhdmUgdG8gZGlzYWJsZSBjc3RhdGUgYmVmb3JlIHIv
dyBkZiwgDQoNCm9yIHRoaXMgaXMgb25seSBhIHdvcmthcm91bmQ/IC0gaW4gdGhpcyBjYXNlIHdl
IG5lZWQgdG8gd29yayB3aXRoIGRmIHRvIGZpZ3VyZSBvdXQgdGhlIHJvb3QgY2F1c2Ugb2YgdGhl
IGhhbmcuDQoNClJlZ2FyZHMsDQpPYWsNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZy
b206IGFtZC1nZnggPGFtZC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJl
aGFsZiBPZiBLaW0sIEpvbmF0aGFuDQpTZW50OiBXZWRuZXNkYXksIE9jdG9iZXIgMTYsIDIwMTkg
ODo1MCBQTQ0KVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogS3VlaGxpbmcs
IEZlbGl4IDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPjsgUXVhbiwgRXZhbiA8RXZhbi5RdWFuQGFt
ZC5jb20+DQpTdWJqZWN0OiBSRTogW1BBVENIXSBkcm0vYW1kZ3B1OiBkaXNhYmxlIGMtc3RhdGVz
IG9uIHhnbWkgcGVyZm1vbnMNCg0KKyBGZWxpeA0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KRnJvbTogS2ltLCBKb25hdGhhbiA8Sm9uYXRoYW4uS2ltQGFtZC5jb20+IA0KU2VudDogV2Vk
bmVzZGF5LCBPY3RvYmVyIDE2LCAyMDE5IDg6NDkgUE0NClRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZw0KQ2M6IEZlbGl4LktldWhsaW5nQGFtZC5jb207IFF1YW4sIEV2YW4gPEV2YW4u
UXVhbkBhbWQuY29tPjsgS2ltLCBKb25hdGhhbiA8Sm9uYXRoYW4uS2ltQGFtZC5jb20+OyBLaW0s
IEpvbmF0aGFuIDxKb25hdGhhbi5LaW1AYW1kLmNvbT4NClN1YmplY3Q6IFtQQVRDSF0gZHJtL2Ft
ZGdwdTogZGlzYWJsZSBjLXN0YXRlcyBvbiB4Z21pIHBlcmZtb25zDQoNCnJlYWQgb3Igd3JpdGVz
IHRvIGRmIHJlZ2lzdGVycyB3aGVuIGdwdSBkZiBpcyBpbiBjLXN0YXRlcyB3aWxsIHJlc3VsdCBp
biBoYW5nLiAgZGYgYy1zdGF0ZXMgc2hvdWxkIGJlIGRpc2FibGVkIHByaW9yIHRvIHJlYWQgb3Ig
d3JpdGVzIHRoZW4gcmUtZW5hYmxlZCBhZnRlciByZWFkIG9yIHdyaXRlcy4NCg0KQ2hhbmdlLUlk
OiBJNmQ1YTgzZTRmZTEzZTI5YzczZGZiMDNhOTRmZTdjNjExZTg2N2ZlYw0KU2lnbmVkLW9mZi1i
eTogSm9uYXRoYW4gS2ltIDxKb25hdGhhbi5LaW1AYW1kLmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2RmX3YzXzYuYyB8IDIxICsrKysrKysrKysrKysrKysrKysrLQ0KIDEg
ZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQoNCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9kZl92M182LmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9kZl92M182LmMNCmluZGV4IDE2ZmJkMmJjOGFkMS4uOWE1ODQxNjY2MmUw
IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZGZfdjNfNi5jDQorKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9kZl92M182LmMNCkBAIC0xMDIsNiArMTAyLDkg
QEAgc3RhdGljIHVpbnQ2NF90IGRmX3YzXzZfZ2V0X2ZpY2Eoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYsDQogCWFkZHJlc3MgPSBhZGV2LT5uYmlvLmZ1bmNzLT5nZXRfcGNpZV9pbmRleF9vZmZz
ZXQoYWRldik7DQogCWRhdGEgPSBhZGV2LT5uYmlvLmZ1bmNzLT5nZXRfcGNpZV9kYXRhX29mZnNl
dChhZGV2KTsNCiANCisJaWYgKHNtdV9zZXRfZGZfY3N0YXRlKCZhZGV2LT5zbXUsIDApKQ0KKwkJ
cmV0dXJuIDB4RkZGRkZGRkZGRkZGRkZGRjsNCisNCiAJc3Bpbl9sb2NrX2lycXNhdmUoJmFkZXYt
PnBjaWVfaWR4X2xvY2ssIGZsYWdzKTsNCiAJV1JFRzMyKGFkZHJlc3MsIHNtbkRGX1BJRV9BT05f
RmFicmljSW5kaXJlY3RDb25maWdBY2Nlc3NBZGRyZXNzMyk7DQogCVdSRUczMihkYXRhLCBmaWNh
YV92YWwpOw0KQEAgLTExNCw2ICsxMTcsOCBAQCBzdGF0aWMgdWludDY0X3QgZGZfdjNfNl9nZXRf
ZmljYShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwNCiANCiAJc3Bpbl91bmxvY2tfaXJxcmVz
dG9yZSgmYWRldi0+cGNpZV9pZHhfbG9jaywgZmxhZ3MpOw0KIA0KKwlzbXVfc2V0X2RmX2NzdGF0
ZSgmYWRldi0+c211LCAxKTsNCisNCiAJcmV0dXJuICgoKGZpY2FkaF92YWwgJiAweEZGRkZGRkZG
RkZGRkZGRkYpIDw8IDMyKSB8IGZpY2FkbF92YWwpOyAgfQ0KIA0KQEAgLTEyNSw2ICsxMzAsOSBA
QCBzdGF0aWMgdm9pZCBkZl92M182X3NldF9maWNhKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
LCB1aW50MzJfdCBmaWNhYV92YWwsDQogCWFkZHJlc3MgPSBhZGV2LT5uYmlvLmZ1bmNzLT5nZXRf
cGNpZV9pbmRleF9vZmZzZXQoYWRldik7DQogCWRhdGEgPSBhZGV2LT5uYmlvLmZ1bmNzLT5nZXRf
cGNpZV9kYXRhX29mZnNldChhZGV2KTsNCiANCisJaWYgKHNtdV9zZXRfZGZfY3N0YXRlKCZhZGV2
LT5zbXUsIDApKQ0KKwkJcmV0dXJuOw0KKw0KIAlzcGluX2xvY2tfaXJxc2F2ZSgmYWRldi0+cGNp
ZV9pZHhfbG9jaywgZmxhZ3MpOw0KIAlXUkVHMzIoYWRkcmVzcywgc21uREZfUElFX0FPTl9GYWJy
aWNJbmRpcmVjdENvbmZpZ0FjY2Vzc0FkZHJlc3MzKTsNCiAJV1JFRzMyKGRhdGEsIGZpY2FhX3Zh
bCk7DQpAQCAtMTM0LDggKzE0Miw5IEBAIHN0YXRpYyB2b2lkIGRmX3YzXzZfc2V0X2ZpY2Eoc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHVpbnQzMl90IGZpY2FhX3ZhbCwNCiANCiAJV1JFRzMy
KGFkZHJlc3MsIHNtbkRGX1BJRV9BT05fRmFicmljSW5kaXJlY3RDb25maWdBY2Nlc3NEYXRhSGkz
KTsNCiAJV1JFRzMyKGRhdGEsIGZpY2FkaF92YWwpOw0KLQ0KIAlzcGluX3VubG9ja19pcnFyZXN0
b3JlKCZhZGV2LT5wY2llX2lkeF9sb2NrLCBmbGFncyk7DQorDQorCXNtdV9zZXRfZGZfY3N0YXRl
KCZhZGV2LT5zbXUsIDEpOw0KIH0NCiANCiAvKg0KQEAgLTE1MywxMiArMTYyLDE3IEBAIHN0YXRp
YyB2b2lkIGRmX3YzXzZfcGVyZm1vbl9ycmVnKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LA0K
IAlhZGRyZXNzID0gYWRldi0+bmJpby5mdW5jcy0+Z2V0X3BjaWVfaW5kZXhfb2Zmc2V0KGFkZXYp
Ow0KIAlkYXRhID0gYWRldi0+bmJpby5mdW5jcy0+Z2V0X3BjaWVfZGF0YV9vZmZzZXQoYWRldik7
DQogDQorCWlmIChzbXVfc2V0X2RmX2NzdGF0ZSgmYWRldi0+c211LCAwKSkNCisJCXJldHVybjsN
CisNCiAJc3Bpbl9sb2NrX2lycXNhdmUoJmFkZXYtPnBjaWVfaWR4X2xvY2ssIGZsYWdzKTsNCiAJ
V1JFRzMyKGFkZHJlc3MsIGxvX2FkZHIpOw0KIAkqbG9fdmFsID0gUlJFRzMyKGRhdGEpOw0KIAlX
UkVHMzIoYWRkcmVzcywgaGlfYWRkcik7DQogCSpoaV92YWwgPSBSUkVHMzIoZGF0YSk7DQogCXNw
aW5fdW5sb2NrX2lycXJlc3RvcmUoJmFkZXYtPnBjaWVfaWR4X2xvY2ssIGZsYWdzKTsNCisNCisJ
c211X3NldF9kZl9jc3RhdGUoJmFkZXYtPnNtdSwgMSk7DQogfQ0KIA0KIC8qDQpAQCAtMTc1LDEy
ICsxODksMTcgQEAgc3RhdGljIHZvaWQgZGZfdjNfNl9wZXJmbW9uX3dyZWcoc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYsIHVpbnQzMl90IGxvX2FkZHIsDQogCWFkZHJlc3MgPSBhZGV2LT5uYmlv
LmZ1bmNzLT5nZXRfcGNpZV9pbmRleF9vZmZzZXQoYWRldik7DQogCWRhdGEgPSBhZGV2LT5uYmlv
LmZ1bmNzLT5nZXRfcGNpZV9kYXRhX29mZnNldChhZGV2KTsNCiANCisJaWYgKHNtdV9zZXRfZGZf
Y3N0YXRlKCZhZGV2LT5zbXUsIDApKQ0KKwkJcmV0dXJuOw0KKw0KIAlzcGluX2xvY2tfaXJxc2F2
ZSgmYWRldi0+cGNpZV9pZHhfbG9jaywgZmxhZ3MpOw0KIAlXUkVHMzIoYWRkcmVzcywgbG9fYWRk
cik7DQogCVdSRUczMihkYXRhLCBsb192YWwpOw0KIAlXUkVHMzIoYWRkcmVzcywgaGlfYWRkcik7
DQogCVdSRUczMihkYXRhLCBoaV92YWwpOw0KIAlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZhZGV2
LT5wY2llX2lkeF9sb2NrLCBmbGFncyk7DQorDQorCXNtdV9zZXRfZGZfY3N0YXRlKCZhZGV2LT5z
bXUsIDEpOw0KIH0NCiANCiAvKiBnZXQgdGhlIG51bWJlciBvZiBkZiBjb3VudGVycyBhdmFpbGFi
bGUgKi8NCi0tDQoyLjE3LjENCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18NCmFtZC1nZnggbWFpbGluZyBsaXN0DQphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZw0KaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
bWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
