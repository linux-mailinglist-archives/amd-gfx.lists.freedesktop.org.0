Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3075AF4AC
	for <lists+amd-gfx@lfdr.de>; Wed, 11 Sep 2019 05:23:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26A876E9EF;
	Wed, 11 Sep 2019 03:23:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700048.outbound.protection.outlook.com [40.107.70.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93C6B6E9EF
 for <amd-gfx@lists.freedesktop.org>; Wed, 11 Sep 2019 03:23:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dph7LCvRF5DV97KB0ysrJLOoiSFrcKw10q9ZEN8mNfhDh3j4j3VDihrHlfT/ZipA5uLF6lAXACbNRsB9sJdBkAcX4HYirLqCcWGAEhcx/0oC5lLEGAj6lYsXhFNjL4tCJAtyIXkdHBoObicUoN2l9j54B4gLz7Q78Sfgld0DKsLrlGU8YDzEnoYOQR5QqMpztX7MRibFhF3MJRs51j3lPkqJqpfMSlZRx/MF5EC8Dc63yHTUaNABQlkYrp3ea3PaCOivbeRahLL/QH72BDX1YRVlVpfrEMLsyxII3RiN2C1HJUmoLAdW247te4o7hB+OESPQp/tbcIaL2NEo5YFpdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fLFppSGpSef9oFAYXYEY3dds1k6kwhlH2a9wjkDYPGI=;
 b=Q+0PlvLEB6lUtuJnVN+RIrd7TMvIyuOQhkSYqT2GPc61lx4BCzyUPhFtMloez5jhM7p5Gi8hH+7IVytY3N9PbYrAefN4PUKlY5l9T2bc4x1pOxyBfVFoomjV0dO25UrJxe6kEWjWo9h7ompP9mUKCV72f0122Q1zAFo/SOWYKAGSmlry3ZcvvzRY7IJU/L8GMfsDdpDRIWIt8TxNSpBDaxTmE8woiq0jkOBiZebRRrudXSRnF31gR3KG8v6wf9QByMmhQXH6zoGR6+jTX5+QRmqjWz1fSLD3clxHDoDAVBpUz/EcBgl1+p09jKboDgEGm569j6yUO4lmVQNu+LMSGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1418.namprd12.prod.outlook.com (10.168.240.15) by
 DM5PR12MB2360.namprd12.prod.outlook.com (52.132.141.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Wed, 11 Sep 2019 03:23:00 +0000
Received: from DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::7c63:a72:e42d:c97d]) by DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::7c63:a72:e42d:c97d%7]) with mapi id 15.20.2241.018; Wed, 11 Sep 2019
 03:23:00 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "Chen, Guchun" <Guchun.Chen@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Li, Dennis" <Dennis.Li@amd.com>, "Zhou1,
 Tao" <Tao.Zhou1@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: RE: [PATCH 4/4] drm/amdgpu: implement ras query function for pcie bif
Thread-Topic: [PATCH 4/4] drm/amdgpu: implement ras query function for pcie bif
Thread-Index: AQHVaE/2CN+vHW+6U0OW1bO/bo3nQKclz61w
Date: Wed, 11 Sep 2019 03:23:00 +0000
Message-ID: <DM5PR12MB1418272EF377973FAE740FFDFCB10@DM5PR12MB1418.namprd12.prod.outlook.com>
References: <20190911032016.10313-1-guchun.chen@amd.com>
 <20190911032016.10313-5-guchun.chen@amd.com>
In-Reply-To: <20190911032016.10313-5-guchun.chen@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6d279643-44f6-4b45-0619-08d736675943
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB2360; 
x-ms-traffictypediagnostic: DM5PR12MB2360:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB23604000D292D6BE83AA02B9FCB10@DM5PR12MB2360.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:619;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(39860400002)(366004)(396003)(136003)(189003)(199004)(13464003)(33656002)(66556008)(71200400001)(76116006)(7736002)(64756008)(54906003)(53546011)(6506007)(186003)(66446008)(86362001)(55016002)(102836004)(66946007)(8936002)(14454004)(6636002)(476003)(53936002)(11346002)(26005)(446003)(66066001)(486006)(52536014)(316002)(256004)(478600001)(4326008)(3846002)(305945005)(71190400001)(66476007)(25786009)(9686003)(8676002)(6246003)(110136005)(2501003)(81156014)(81166006)(99286004)(2906002)(5660300002)(6436002)(229853002)(76176011)(7696005)(74316002)(6116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2360;
 H:DM5PR12MB1418.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Y8VDRWf3XthiFpdzoMCbILFY8WzDiSPRwiDTzx+dy7k3V0xlCgAelyjTnF7s1TreibRNpLk8e+egM1RpBV9VracMsxbXwK4VoxPdzAv9yoU1kjr2QNofYcS1saHMyb3kr/dy7EEsalALNkm+lIbpzo0w/i+qX4bZfZ12C+gIEHa/COIoBGTFhfxAn3EU/hCMZsBNOPoOxVJErxePLRThNM3kT9705peFIX75GJz4LaTl5okzOrZRwp9/EkiHfK2/gghK/8QS1868HfUqJvyKxaGn4l61IzJ8EFGRDiNA5BF9pWO+Zd47+tjSyE8d9tGI3Y5Cc8q0G/v+V0j62KbDP9zPEwG7ZEqTbKiaaPQDdgtPj30SpqC3qYURE0I/sh9HclHlH+dR54xSob6CaV9KrSwXY1X77640KgRFnnAx+pk=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d279643-44f6-4b45-0619-08d736675943
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 03:23:00.2480 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xi7sh9Birn6SGvA3qzeKUvQ2Ny0QggxHyMzv9SIonNV6vTea7I/o/A9rOhm6WQtYOuzfdlQR28DCQnLZKhcnOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2360
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fLFppSGpSef9oFAYXYEY3dds1k6kwhlH2a9wjkDYPGI=;
 b=VyaMMilwhjwUtM8Hzzsvyqzo7pzIihNbYy5zzOolBMO9Yvytv5Pwji9buWxGAVkvDLgplYXZQo8hRKEFfjnbRm8a+0ZSZw2SoRnYvdFSxqWY/G0h5ROrg/JHxdSSJJHux5avM4t2Z2cEFovG2TUpLfWBQP+N4VjnWZL85aJEVL8=
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
Cc: "Zhou1, Tao" <Tao.Zhou1@amd.com>, "Li, Candice" <Candice.Li@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U2VyaWVzIGlzDQpSZXZpZXdlZC1ieTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQu
Y29tPg0KDQpSZWdhcmRzLA0KSGF3a2luZw0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZy
b206IENoZW4sIEd1Y2h1biA8R3VjaHVuLkNoZW5AYW1kLmNvbT4gDQpTZW50OiAyMDE55bm0Oeac
iDEx5pelIDExOjIxDQpUbzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IFpoYW5nLCBI
YXdraW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+OyBMaSwgRGVubmlzIDxEZW5uaXMuTGlAYW1k
LmNvbT47IFpob3UxLCBUYW8gPFRhby5aaG91MUBhbWQuY29tPjsgRGV1Y2hlciwgQWxleGFuZGVy
IDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPg0KQ2M6IExpLCBDYW5kaWNlIDxDYW5kaWNlLkxp
QGFtZC5jb20+OyBDaGVuLCBHdWNodW4gPEd1Y2h1bi5DaGVuQGFtZC5jb20+OyBaaG91MSwgVGFv
IDxUYW8uWmhvdTFAYW1kLmNvbT4NClN1YmplY3Q6IFtQQVRDSCA0LzRdIGRybS9hbWRncHU6IGlt
cGxlbWVudCByYXMgcXVlcnkgZnVuY3Rpb24gZm9yIHBjaWUgYmlmDQoNCnJhcyBlcnJvciBxdWVy
eSBmdW50aW9uYWxpdHkgaW1wbGVtZW50YXRpb24NCg0KQ2hhbmdlLUlkOiBJZDdkOGMzNTYyMTk2
MDY4NWEyYTc1MDdlNGU5NTkzOWY1YTA1YmRjNg0KU2lnbmVkLW9mZi1ieTogVGFvIFpob3UgPHRh
by56aG91MUBhbWQuY29tPg0KU2lnbmVkLW9mZi1ieTogR3VjaHVuIENoZW4gPGd1Y2h1bi5jaGVu
QGFtZC5jb20+DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9uYmlvX3Y3XzQuYyB8
IDMwICsrKysrKysrKysrKysrKysrKysrKysrKysrDQogMSBmaWxlIGNoYW5nZWQsIDMwIGluc2Vy
dGlvbnMoKykNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L25iaW9f
djdfNC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbmJpb192N180LmMNCmluZGV4IGZh
NmE4OTE4ZGM4Yy4uYjc3NjMzMmQ5NzlmIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvbmJpb192N180LmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L25i
aW9fdjdfNC5jDQpAQCAtNDc2LDYgKzQ3NiwzNiBAQCBzdGF0aWMgaW50IG5iaW9fdjdfNF9pbml0
X3Jhc19lcnJfZXZlbnRfYXRodWJfaW50ZXJydXB0IChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYSAg
c3RhdGljIHZvaWQgbmJpb192N180X3F1ZXJ5X3Jhc19lcnJvcl9jb3VudChzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldiwNCiAJCQkJCXZvaWQgKnJhc19lcnJvcl9zdGF0dXMpDQogew0KKwl1aW50
MzJfdCBnbG9iYWxfc3RzLCBjZW50cmFsX3N0cywgaW50X2VvaTsNCisJdWludDMyX3QgY29yciwg
ZmF0YWwsIG5vbl9mYXRhbDsNCisJc3RydWN0IHJhc19lcnJfZGF0YSAqZXJyX2RhdGEgPSAoc3Ry
dWN0IHJhc19lcnJfZGF0YSANCisqKXJhc19lcnJvcl9zdGF0dXM7DQorDQorCWdsb2JhbF9zdHMg
PSBSUkVHMzJfUENJRShzbW5SQVNfR0xPQkFMX1NUQVRVU19MTyk7DQorCWNvcnIgPSBSRUdfR0VU
X0ZJRUxEKGdsb2JhbF9zdHMsIFJBU19HTE9CQUxfU1RBVFVTX0xPLCBQYXJpdHlFcnJDb3JyKTsN
CisJZmF0YWwgPSBSRUdfR0VUX0ZJRUxEKGdsb2JhbF9zdHMsIFJBU19HTE9CQUxfU1RBVFVTX0xP
LCBQYXJpdHlFcnJGYXRhbCk7DQorCW5vbl9mYXRhbCA9IFJFR19HRVRfRklFTEQoZ2xvYmFsX3N0
cywgUkFTX0dMT0JBTF9TVEFUVVNfTE8sDQorCQkJCVBhcml0eUVyck5vbkZhdGFsKTsNCisNCisJ
aWYgKGNvcnIpDQorCQllcnJfZGF0YS0+Y2VfY291bnQrKzsNCisJaWYgKGZhdGFsKQ0KKwkJZXJy
X2RhdGEtPnVlX2NvdW50Kys7DQorDQorCWlmIChjb3JyIHx8IGZhdGFsIHx8IG5vbl9mYXRhbCkg
ew0KKwkJY2VudHJhbF9zdHMgPSBSUkVHMzJfUENJRShzbW5CSUZMX1JBU19DRU5UUkFMX1NUQVRV
Uyk7DQorCQkvKiBjbGVhciBlcnJvciBzdGF0dXMgcmVnaXN0ZXIgKi8NCisJCVdSRUczMl9QQ0lF
KHNtblJBU19HTE9CQUxfU1RBVFVTX0xPLCBnbG9iYWxfc3RzKTsNCisNCisJCWlmIChSRUdfR0VU
X0ZJRUxEKGNlbnRyYWxfc3RzLCBCSUZMX1JBU19DRU5UUkFMX1NUQVRVUywNCisJCQkJQklGTF9S
YXNDb250bGxlcl9JbnRyX1JlY3YpKSB7DQorCQkJLyogY2xlYXIgaW50ZXJydXB0IHN0YXR1cyBy
ZWdpc3RlciAqLw0KKwkJCVdSRUczMl9QQ0lFKHNtbkJJRkxfUkFTX0NFTlRSQUxfU1RBVFVTLCBj
ZW50cmFsX3N0cyk7DQorCQkJaW50X2VvaSA9IFJSRUczMl9QQ0lFKHNtbklPSENfSU5URVJSVVBU
X0VPSSk7DQorCQkJaW50X2VvaSA9IFJFR19TRVRfRklFTEQoaW50X2VvaSwNCisJCQkJCUlPSENf
SU5URVJSVVBUX0VPSSwgU01JX0VPSSwgMSk7DQorCQkJV1JFRzMyX1BDSUUoc21uSU9IQ19JTlRF
UlJVUFRfRU9JLCBpbnRfZW9pKTsNCisJCX0NCisJfQ0KIH0NCiANCiBjb25zdCBzdHJ1Y3QgYW1k
Z3B1X25iaW9fZnVuY3MgbmJpb192N180X2Z1bmNzID0gew0KLS0NCjIuMTcuMQ0KDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
