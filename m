Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74760BAFDC
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Sep 2019 10:44:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DED836E222;
	Mon, 23 Sep 2019 08:44:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760089.outbound.protection.outlook.com [40.107.76.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 596826E22E
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Sep 2019 08:44:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GdhWToTpsQydWSXmImFHkEEtEZZj7wvcBYvD5iSMq9wMUy9+LBBwm486TrhiPmWJs4f9MUWPw2C0Z0cb1rQ8YY0bm8EKKJ/PkkQQycECrUsDCth+6s7SNKp8R8qCjobX2ySLuaPVmHup3vXYaNi4EUL1i1hXnCiXLlVjW0WYg23F4D0DbhRpKDcvDSbBX5ARkvmWsVP/xAFJbUVf+hgPECGU1s9VUNLvdNBGxp0FdI9VJLbsmFMIbISTN6+xACayBUwY+pksYLXGQrJEIWNNTa0fY6JTYPNL/v/0heSdfuCytCqSPF5v4ORs7d0RZwDA6L8UIsfRNr5sYJCQI+yzTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WRqBtEMo7oRtuoKXzRYmz4nx3dQmgHJi996m4ANeuIY=;
 b=GBd7wmb4NmtrRPnCFWX+eSetilZ5Unw/aIjcwVWGSOlPQmOe3DC9UvBt7ACWJXxFOGK5oUCqT60ptTFIaBvQNW1WKFz3ev/Cb6vWeVsrA8grWXEsdKA/NcuqMMTdY9VRMr8hrfM3HIWVMHF42Dwf12Vow7XAaEif6V7ph7j6hFJQlEkp38/ew110Y8DWjBfHB/Ppf/ms+FHzXZHPImSFz/OghmPCr2kgx/KOdKWZpzRJ712KHoJHpzKDbsFox2wKRh7zU/6LbMJY4OtHPjQbqn4WjdecLAr3dqlVVLZRGJ4IbUYCRVPQw04zh2KtXVYQwdALH0D7Re1hFMniL6iNcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1418.namprd12.prod.outlook.com (10.168.240.15) by
 DM5PR12MB2518.namprd12.prod.outlook.com (52.132.139.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.18; Mon, 23 Sep 2019 08:44:33 +0000
Received: from DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::7c63:a72:e42d:c97d]) by DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::7c63:a72:e42d:c97d%7]) with mapi id 15.20.2284.023; Mon, 23 Sep 2019
 08:44:33 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "Ma, Le" <Le.Ma@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 3/3] drm/amdgpu: enable psp front door loading by default
 on Arcturus
Thread-Topic: [PATCH 3/3] drm/amdgpu: enable psp front door loading by default
 on Arcturus
Thread-Index: AQHVcdgxbF/ED7SZY0qT+SSqjpfMX6c48HMA
Date: Mon, 23 Sep 2019 08:44:32 +0000
Message-ID: <DM5PR12MB14184A138F275846CF1D2F05FC850@DM5PR12MB1418.namprd12.prod.outlook.com>
References: <1569220126-4033-1-git-send-email-le.ma@amd.com>
 <1569220126-4033-3-git-send-email-le.ma@amd.com>
In-Reply-To: <1569220126-4033-3-git-send-email-le.ma@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f050c6c8-d97b-4fe2-63df-08d740024193
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM5PR12MB2518; 
x-ms-traffictypediagnostic: DM5PR12MB2518:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB2518D109B0F52A75F71AC62EFC850@DM5PR12MB2518.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 0169092318
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(346002)(136003)(376002)(396003)(13464003)(199004)(189003)(14454004)(3846002)(6246003)(476003)(6436002)(9686003)(25786009)(74316002)(6306002)(86362001)(64756008)(55016002)(305945005)(99286004)(256004)(2906002)(7736002)(4326008)(5660300002)(8936002)(486006)(478600001)(52536014)(229853002)(66946007)(110136005)(26005)(7696005)(53546011)(76176011)(71200400001)(71190400001)(186003)(81156014)(81166006)(76116006)(33656002)(966005)(66556008)(102836004)(316002)(11346002)(66476007)(66446008)(2501003)(6116002)(6506007)(8676002)(66066001)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2518;
 H:DM5PR12MB1418.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: z3rXctdSljMvfhGp8JpsGgMHyI/EXa9qlhntaL4kx6XdpkvfmI2tY/APXBouxbJ6Dt1TPkahRx+etEJowFR8J7+r1I46dwNLtDknl0SZu/EDJ0X0QIM4SDTRpJ036+JP8VsiT58BI3CCVWl/6V+3OoBqN3deQhC20JOvyTrXtYEZfLTPJNUDeqQtTzDvoJGqEjvbCY3UlWwuqfR2HoRZ8Qpq27zJ/6DhATlKENsi1Iogi3UTGtUScrS3+BKfwKaxE849Wj5G45Jgi8otcUVWKbI9Vuq6QiBQ8KYnXwDHF7KqFC67ppPrTSdEzcwlgvmt6A8KK2n1e+xa80nCdbjc2CFqWdG8WE1gXPbol52MbD1A+HJOPdZljR7emURuaATCkcaZKPqdz6Dsk1DrBplEFId0dqndnXaRPV7EV/McRUA=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f050c6c8-d97b-4fe2-63df-08d740024193
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2019 08:44:32.8676 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3PW0E6IrBRW5j4TFdvHhAe6AAqW61MTFgd0Uysb1Z+0m3h6jHhJOzr2+5/s9R1QOepGrSFV3O53m9HkRRMEPJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2518
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WRqBtEMo7oRtuoKXzRYmz4nx3dQmgHJi996m4ANeuIY=;
 b=CkCkPQV5h7nloikHOYQSJAXo4+s5tNu7b7uzRu9ZeX7XcZdo/TpKGrPg3HHR5qV1i5DoeCY9I5YDcvuXkqUtK5zQgxtz2MiGXhuCq5rhwfEupUh+TLTOqJh/XoQadDVJifxWc5B77CJzHJFq6fGFIYKFc2OJlsvy52C+Z8W6Aho=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Hawking.Zhang@amd.com; 
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
Cc: "Ma, Le" <Le.Ma@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UGF0Y2ggIzIgc2hvdWxkIGJlIGFscmVhZHkgaW4gZHJtLW5leHQuIFBsZWFzZSBkcm9wIGl0IGZy
b20gdGhlIHNlcmllcyB3aGVuIHlvdSBwdXNoIHRoZW0uIFRoZSBzZXJpZXMgaXMNCg0KUmV2aWV3
ZWQtYnk6IEhhd2tpbmcgWmhhbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT4NCg0KUmVnYXJkcywN
Ckhhd2tpbmcNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBhbWQtZ2Z4IDxhbWQt
Z2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgTGUgTWENClNl
bnQ6IDIwMTnlubQ55pyIMjPml6UgMTQ6MjkNClRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZw0KQ2M6IE1hLCBMZSA8TGUuTWFAYW1kLmNvbT4NClN1YmplY3Q6IFtQQVRDSCAzLzNdIGRy
bS9hbWRncHU6IGVuYWJsZSBwc3AgZnJvbnQgZG9vciBsb2FkaW5nIGJ5IGRlZmF1bHQgb24gQXJj
dHVydXMNCg0KQ2hhbmdlLUlkOiBJMTNhNWY1OTBkNWE0OTY1NTk2NWExM2ViN2NlNzczZDFlZmZm
Y2JkMA0KU2lnbmVkLW9mZi1ieTogTGUgTWEgPGxlLm1hQGFtZC5jb20+DQotLS0NCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdWNvZGUuYyB8IDMgKy0tDQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Vjb2RlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfdWNvZGUuYw0KaW5kZXggODJmNmI0MS4uZmNlMWY3MSAxMDA2NDQNCi0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91Y29kZS5jDQorKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdWNvZGUuYw0KQEAgLTM2MCw2ICszNjAsNyBA
QCBhbWRncHVfdWNvZGVfZ2V0X2xvYWRfdHlwZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwg
aW50IGxvYWRfdHlwZSkNCiAJY2FzZSBDSElQX1JBVkVOOg0KIAljYXNlIENISVBfVkVHQTEyOg0K
IAljYXNlIENISVBfVkVHQTIwOg0KKwljYXNlIENISVBfQVJDVFVSVVM6DQogCWNhc2UgQ0hJUF9S
RU5PSVI6DQogCWNhc2UgQ0hJUF9OQVZJMTA6DQogCWNhc2UgQ0hJUF9OQVZJMTQ6DQpAQCAtMzY4
LDggKzM2OSw2IEBAIGFtZGdwdV91Y29kZV9nZXRfbG9hZF90eXBlKHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2LCBpbnQgbG9hZF90eXBlKQ0KIAkJCXJldHVybiBBTURHUFVfRldfTE9BRF9ESVJF
Q1Q7DQogCQllbHNlDQogCQkJcmV0dXJuIEFNREdQVV9GV19MT0FEX1BTUDsNCi0JY2FzZSBDSElQ
X0FSQ1RVUlVTOg0KLQkJcmV0dXJuIEFNREdQVV9GV19MT0FEX0RJUkVDVDsNCiANCiAJZGVmYXVs
dDoNCiAJCURSTV9FUlJPUigiVW5rbm93biBmaXJtd2FyZSBsb2FkIHR5cGVcbiIpOw0KLS0gDQoy
LjcuNA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0K
YW1kLWdmeCBtYWlsaW5nIGxpc3QNCmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngNCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
