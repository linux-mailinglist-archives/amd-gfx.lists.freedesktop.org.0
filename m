Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD32E6D1E8
	for <lists+amd-gfx@lfdr.de>; Thu, 18 Jul 2019 18:20:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 291316E43B;
	Thu, 18 Jul 2019 16:20:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770079.outbound.protection.outlook.com [40.107.77.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12AB36E43B
 for <amd-gfx@lists.freedesktop.org>; Thu, 18 Jul 2019 16:20:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jtn5m1EvMH5PIrUBaYHUn9TOjJvYH3pgIeGzSNEKfh3amlol3TMkUPbqShAdgQRfQK7fITf2+dNz19EbJ0Edyh4TXbeK9dEWmldTeWF5THHoa6qy/63nwgQSC7sqokPnoMVDJirbV4l9fbl98abaltajrmbEvs+wZ8QSOT5kBYl37RmuvLuW7EN3X6THKjaZc/E28sgj9fr+VOG10KpnCHUc6tErBuOdBuPHGrbLkcZ6yt+9eAb45gWFa4hTiebfLVDKsHJK8S7DN/g6x3MKKeeTdNyO12oV+Rb45b7WeIGKYlCt0ATlIvwzlfH6kPYVdM33CKMs+1H9OQj0IvL6Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SbVNLsWQMH3i9ZzSZMV937QRbZTbYZT08lzNrsb4uzs=;
 b=ERwRHmpr6acd8GK/AgzDbnHkab+eAhOVBxMbqNFTRSOIK8fFil4HcuUclShQSsDMtGnfQbxhw+bcBiTe5G6RV5wacXDUoIVCvMLqCKOGtTE7FUNACmo8CVNWvOQM8pv/OWrQ3PNPIYJqjJautmcmGna3T23TW9EO6f/ry8BODjohdz9g14ytvYBzVu/xi2R8HCt02H03eOhjG2yExZkji40xxg60RAEcBEsnsSevDWbB7b6r3wrxGlZuQNqmAosY8bXTM/FNxnwAVjRjVPNABT1qUURLQkHgw+CmIj43M+Kbf1E1XkjRd1bZARoIyUfk2uApTXfV173jVkpVGB/XKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BYAPR12MB2853.namprd12.prod.outlook.com (20.179.90.150) by
 BYAPR12MB3302.namprd12.prod.outlook.com (20.179.93.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.12; Thu, 18 Jul 2019 16:20:09 +0000
Received: from BYAPR12MB2853.namprd12.prod.outlook.com
 ([fe80::dd9c:e1c8:face:eaa9]) by BYAPR12MB2853.namprd12.prod.outlook.com
 ([fe80::dd9c:e1c8:face:eaa9%6]) with mapi id 15.20.2094.013; Thu, 18 Jul 2019
 16:20:09 +0000
From: "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>
To: =?utf-8?B?TWljaGVsIETDpG56ZXI=?= <michel@daenzer.net>
Subject: Re: [PATCH 07/87] drm/amd/display: move bw calc code into helpers
Thread-Topic: [PATCH 07/87] drm/amd/display: move bw calc code into helpers
Thread-Index: AQHVO1M/OLE7T7g7U0CmOag9Iz3sGabQeXoAgAAZMQA=
Date: Thu, 18 Jul 2019 16:20:09 +0000
Message-ID: <46cd89f7-2671-7f2c-d24e-b8aaac18e2c0@amd.com>
References: <20190715212049.4584-1-sunpeng.li@amd.com>
 <20190715212049.4584-8-sunpeng.li@amd.com>
 <66c6c4d7-34b3-b73b-4e21-f745fff470cd@daenzer.net>
In-Reply-To: <66c6c4d7-34b3-b73b-4e21-f745fff470cd@daenzer.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0038.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::15) To BYAPR12MB2853.namprd12.prod.outlook.com
 (2603:10b6:a03:12c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bc9bb748-e543-453f-2f5a-08d70b9bcd6a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB3302; 
x-ms-traffictypediagnostic: BYAPR12MB3302:
x-microsoft-antispam-prvs: <BYAPR12MB33023B9D638428BCAAA8CF1082C80@BYAPR12MB3302.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(376002)(346002)(39860400002)(396003)(199004)(189003)(6246003)(7736002)(31696002)(305945005)(68736007)(53936002)(478600001)(2616005)(486006)(476003)(446003)(86362001)(11346002)(316002)(6486002)(8676002)(99286004)(25786009)(6512007)(4326008)(6436002)(54906003)(14454004)(14444005)(256004)(66066001)(8936002)(186003)(26005)(66476007)(66574012)(81166006)(81156014)(71190400001)(71200400001)(6116002)(2906002)(3846002)(66446008)(66556008)(64756008)(66946007)(5660300002)(229853002)(36756003)(76176011)(6916009)(52116002)(31686004)(102836004)(53546011)(386003)(6506007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3302;
 H:BYAPR12MB2853.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ++Qf5+//1NT+VRxfaZLPd7YgUA5j7XawoLQcStHrfeGiPzsWNVeeboUMLdI5u7dLUKNwTGZSHBkLh9d/PWP6KkAmwKShOnfKf/DoU0oN1tD0T2+V1OWmgfKTcnR0+NQK0WVUziUus3A+5jNdwZGI95NguEBQfM1Vz8ZQ503dZ2qQ5Oi/3jGXaE9t71m2PHkQiG/je50NSKk0/A3lp4gLO5DtI1veBgEfTQsXsm2bSaJbziFqeIFqUI6YPInI1+2TQ0iPveJzrzfBDtQFCLU2RGsorWvLxPyo2cWXOQCNJWFbrdyPEeuNJZkfzN1bIGmfPX86aVfvk085wWb4b8OC33wr5s5/EA4/hBEWHx82i2gGFDcNGAfqop4FRQ1Bs1jf0cLpKqF+cKR6CQxHe8NmYAxbuIK9MOOZbhC3Hu7yIWs=
Content-ID: <4C127B440F19944DABE0918607305B08@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc9bb748-e543-453f-2f5a-08d70b9bcd6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 16:20:09.1248 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sunli1@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3302
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SbVNLsWQMH3i9ZzSZMV937QRbZTbYZT08lzNrsb4uzs=;
 b=lGpumcP7oXt6XV2SBGGFgHJ8TGcYd7Cthlc/ozK01VZz3vpS+QsZ7HK11zPl1+xQnPo3lwueXPh9no1w8ZtudbJh31UMm85/nOA2dvSIG1m2Z/aaM87epUbAKpa3kaTMdSUvyA4quUc+fZkkHNQBw2TQBCRon7QNPODn9/Iqvq4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Sunpeng.Li@amd.com; 
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
Cc: "Darbehani, Fatemeh" <Fatemeh.Darbehani@amd.com>, "Yang,
 Eric" <Eric.Yang2@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

DQoNCk9uIDIwMTktMDctMTggMTA6NDkgYS5tLiwgTWljaGVsIETDpG56ZXIgd3JvdGU6DQo+IE9u
IDIwMTktMDctMTUgMTE6MTkgcC5tLiwgc3VucGVuZy5saUBhbWQuY29tIHdyb3RlOg0KPj4gRnJv
bTogRXJpYyBZYW5nIDxFcmljLllhbmcyQGFtZC5jb20+DQo+Pg0KPj4gW1doeV0NCj4+IEZvciBi
ZXR0ZXIgcmVhZGFiaWxpdHkgYW5kIHJldXNhYmlsaXR5DQo+Pg0KPj4gW0hvd10NCj4+IE1vdmUg
c25pcHBldHMgb2YgQlcgY2FsY3VsYXRpb24gY29kZSBpbnRvIGhlbHBlcnMuDQo+Pg0KPj4gU2ln
bmVkLW9mZi1ieTogRXJpYyBZYW5nIDxFcmljLllhbmcyQGFtZC5jb20+DQo+PiBSZXZpZXdlZC1i
eTogRmF0ZW1laCBEYXJiZWhhbmkgPEZhdGVtZWguRGFyYmVoYW5pQGFtZC5jb20+DQo+PiBBY2tl
ZC1ieTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+DQo+PiAtLS0NCj4+ICBbLi4uXQ0KPj4N
Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNl
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMNCj4+IGluZGV4
IDA4NmQyZjNiMGRiMy4uZTljY2Y0MWUzMWVlIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMNCj4+IEBAIC0xMjYsNiArMTI2LDcgQEAgc3RhdGlj
IERFVklDRV9BVFRSKHBjaWVfcmVwbGF5X2NvdW50LCBTX0lSVUdPLA0KPj4gIAkJYW1kZ3B1X2Rl
dmljZV9nZXRfcGNpZV9yZXBsYXlfY291bnQsIE5VTEwpOw0KPj4gIA0KPj4gIHN0YXRpYyB2b2lk
IGFtZGdwdV9kZXZpY2VfZ2V0X3BjaWVfaW5mbyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7
DQo+PiArc3RhdGljIHZvaWQgYW1kZ3B1X2RldmljZV9wYXJzZV9mYWtlZF9kaWQoc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYpOw0KPiANCj4gVGhpcyBmdW5jdGlvbiBpc24ndCBkZWZpbmVkIGFu
eXdoZXJlLCBwcm9kdWNpbmcgYSB3YXJuaW5nOg0KPiANCj4gZHJpdmVycy9ncHUvZHJtLy9hbWQv
YW1kZ3B1L2FtZGdwdV9kZXZpY2UuYzoxMzE6MTM6IHdhcm5pbmc6IOKAmGFtZGdwdV9kZXZpY2Vf
cGFyc2VfZmFrZWRfZGlk4oCZIGRlY2xhcmVkIOKAmHN0YXRpY+KAmSBidXQgbmV2ZXIgZGVmaW5l
ZCBbLVd1bnVzZWQtZnVuY3Rpb25dDQo+ICBzdGF0aWMgdm9pZCBhbWRncHVfZGV2aWNlX3BhcnNl
X2Zha2VkX2RpZChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7DQo+ICAgICAgICAgICAgICBe
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fg0KDQpPb3BzLCBJIGRvbid0IGtub3cgaG93IHRo
YXQgbWFuYWdlZCB0byBnZXQgaW4gdGhlcmUuIEl0J3Mgbm90IGV2ZW4gaW4NCnRoZSBkaXNwbGF5
IGRpci4uLg0KDQpTZW50IGEgZml4Lg0KDQpMZW8NCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA==
