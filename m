Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A61BD8CE9
	for <lists+amd-gfx@lfdr.de>; Wed, 16 Oct 2019 11:51:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA3CD6E90D;
	Wed, 16 Oct 2019 09:51:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680081.outbound.protection.outlook.com [40.107.68.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 519466E90D
 for <amd-gfx@lists.freedesktop.org>; Wed, 16 Oct 2019 09:51:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jTd48tAtRTvKGeofWXnZyhz8bBCHeHb00OswmqpWxCRvFRBiPMi8MbaHFNAc9/2Pc7lyf62Be3/n6p09ZaOoAB+6lQ4EPhUtb7fsfD2Jk2gYSCkZVpw8mpcNHRdrofzgGgNbqGhuWWmv5WlpMaHA81gw+X4AC5gX4FErWPGCkiJZRjO7FL40STpgLpr7Borwmny+yumv9BndbewrM3ujx/Nd0WQ5ZCETw6OF3GsD9uILjAjzXK0F0l7vd/FJONMWd2RaFYUQkExHdD4X1IMBLJLAA6Op89mB8S6D3nK/kNh+HTjyvAy0LF69FNVgkULlf1XFZOJjSiZTk1NuTpiVUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PK7yuw6mY564ScEjKwDonyILgVpYjlEHWZgfDb9XVKc=;
 b=GXKekewSwzpIdskV32c5J/l6gq99Ify9EJlDsYTBRzDaggdW83jqaSRTxeJ9wSL0mRYPSlKRa54tzve43k/Uj72lYs0Z3vnB0y6WA4U/94oCtPesM9SgPVUBoPUdUHa+QMJG15hmwDoenzlUYGuNdpmyWtLGgY+oElGysiEbl9gQlguaXUC0qMNQOfQvBMsLTyIwbE1skX91+dX8CHXF28sz0eFIdJkHAssP96wnFlQxasbd6AuDqWQgnwg90VZVzTA3Hg0//VTGBF0EqT+4obK8uw6pCGCQc9vYBdNTqIDvequpN8qv2ybBRMEAghdmJhTEQCqZMjIl4xDK5cUk2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3950.namprd12.prod.outlook.com (10.255.239.10) by
 MN2PR12MB3392.namprd12.prod.outlook.com (20.178.242.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Wed, 16 Oct 2019 09:51:06 +0000
Received: from MN2PR12MB3950.namprd12.prod.outlook.com
 ([fe80::a595:3962:ad4c:ca1b]) by MN2PR12MB3950.namprd12.prod.outlook.com
 ([fe80::a595:3962:ad4c:ca1b%4]) with mapi id 15.20.2347.023; Wed, 16 Oct 2019
 09:51:06 +0000
From: "Xiao, Jack" <Jack.Xiao@amd.com>
To: "Feng, Kenneth" <Kenneth.Feng@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amd/powerplay: bug fix for memory clock request from
 display
Thread-Topic: [PATCH] drm/amd/powerplay: bug fix for memory clock request from
 display
Thread-Index: AQHVg//j3TwgTGNs40y8PJ4ky5CHJqddAH/g
Date: Wed, 16 Oct 2019 09:51:06 +0000
Message-ID: <MN2PR12MB3950B7BF6AB59ED33DBBADA8EF920@MN2PR12MB3950.namprd12.prod.outlook.com>
References: <1571216302-898-1-git-send-email-kenneth.feng@amd.com>
In-Reply-To: <1571216302-898-1-git-send-email-kenneth.feng@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2040ce90-2f22-4f41-10d4-08d7521e5d37
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MN2PR12MB3392:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3392C68064140C83840F2858EF920@MN2PR12MB3392.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0192E812EC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(136003)(376002)(396003)(366004)(13464003)(199004)(189003)(229853002)(6436002)(8676002)(14444005)(66066001)(64756008)(8936002)(66446008)(33656002)(256004)(66556008)(55016002)(25786009)(66946007)(76116006)(66476007)(3846002)(81166006)(6116002)(81156014)(2906002)(6506007)(53546011)(186003)(102836004)(476003)(74316002)(11346002)(446003)(7736002)(26005)(99286004)(486006)(6246003)(305945005)(7696005)(52536014)(76176011)(71200400001)(71190400001)(316002)(14454004)(86362001)(9686003)(4326008)(966005)(110136005)(478600001)(2501003)(6306002)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3392;
 H:MN2PR12MB3950.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sOaUnE8CqOXK6LJrtZwRzl276rlppkaw3vvjjjDB6qk4ejFXTfR2o9G4ch3agnzYg3Kk+um6LYdOkaC6LbxoHwlxJL2wBqS8o/gqCOlxKbifN/SAbsxjZwCnpj3kTT0fFhcOLW0JEGY2guMmUEu2+cTfAv3YQk2sPt86yU054B4TkdQ1RKEjMSfDCJ0E9+BvJBvbvgGcnBT5gvXtRg0Wt0AsDjIBMepQZGggAudcK2qjqDttFYV95S9nLY4ymDBLaUEyuaKCRWHPSnzBtwZIkt9L4hrvpDSQraOzkFMQ2tHCkpquSyDH2EWR7dWzMUD85bet/ea3kdP0di5LbrmVbRlpQfCRYuYnK1SKAwDMuzWsMrkigI7RjtC4S1/o459fhsI8aIYEswGNxMjUYriaZCfUNtOxkt+fiIkRbflLTZ95WuRZxZDCpsNccmEPOJsRwUo0GFBm+hCNQOlKXZLiDA==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2040ce90-2f22-4f41-10d4-08d7521e5d37
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2019 09:51:06.1001 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mZsN3CBvq6CRvRrpHzQo0Fspurs83mwpesEMJxAAh83no9WsJv2lEaI2JJBQrQZD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3392
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PK7yuw6mY564ScEjKwDonyILgVpYjlEHWZgfDb9XVKc=;
 b=T6NV2KaXnruq6ALDxlVADB44hM+FVQEn7E6xnXL5XFEiF1BmdqOMJY6HKUjzPUYRBAZkPmeVE91d0cRXZHSKMZ4oAcI2fSAF5bNHoNMIqPb02zeqOM2rvfJloufBEp5qB1/sSmMqIIXGxiu/GS26D9rPRrAk84UtMmJ5mA/qOWY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Jack.Xiao@amd.com; 
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

UmV2aWV3ZWQtYnk6IEphY2sgWGlhbyA8SmFjay5YaWFvQGFtZC5jb20+DQoNCi0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgS2VubmV0aCBGZW5nDQpTZW50OiBXZWRuZXNkYXks
IE9jdG9iZXIgMTYsIDIwMTkgNDo1OCBQTQ0KVG86IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnDQpDYzogRmVuZywgS2VubmV0aCA8S2VubmV0aC5GZW5nQGFtZC5jb20+DQpTdWJqZWN0OiBb
UEFUQ0hdIGRybS9hbWQvcG93ZXJwbGF5OiBidWcgZml4IGZvciBtZW1vcnkgY2xvY2sgcmVxdWVz
dCBmcm9tIGRpc3BsYXkNCg0KSW4gc29tZSBjYXNlcywgZGlzcGxheSBmaXhlcyBtZW1vcnkgY2xv
Y2sgZnJlcXVlbmN5IHRvIGEgaGlnaCB2YWx1ZSByYXRoZXIgdGhhbiB0aGUgbmF0dXJhbCBtZW1v
cnkgY2xvY2sgc3dpdGNoaW5nLg0KV2hlbiB3ZSBjb21lcyBiYWNrIGZyb20gczMgcmVzdW1lLCB0
aGUgcmVxdWVzdCBmcm9tIGRpc3BsYXkgaXMgbm90IHJlc2V0LCB0aGlzIGNhdXNlcyB0aGUgYnVn
IHdoaWNoIG1ha2VzIHRoZSBtZW1vcnkgY2xvY2sgZ29lcyBpbnRvIGEgbG93IHZhbHVlLg0KVGhl
biBkdWUgdG8gdGhlIGluc3VmZmNpZW50IG1lbW9yeSBjbG9jaywgdGhlIHNjcmVlbiBmbGlja3Mu
DQoNClNpZ25lZC1vZmYtYnk6IEtlbm5ldGggRmVuZyA8a2VubmV0aC5mZW5nQGFtZC5jb20+DQot
LS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMgfCAyICsrDQog
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9w
b3dlcnBsYXkvYW1kZ3B1X3NtdS5jDQppbmRleCBlMmEwM2Y0Li5lZTM3NGRmIDEwMDY0NA0KLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jDQorKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMNCkBAIC0xMzU0LDYgKzEzNTQs
OCBAQCBzdGF0aWMgaW50IHNtdV9yZXN1bWUodm9pZCAqaGFuZGxlKQ0KIAlpZiAoc211LT5pc19h
cHUpDQogCQlzbXVfc2V0X2dmeF9jZ3BnKCZhZGV2LT5zbXUsIHRydWUpOw0KIA0KKwlzbXUtPmRp
c2FibGVfdWNsa19zd2l0Y2ggPSAwOw0KKw0KIAltdXRleF91bmxvY2soJnNtdS0+bXV0ZXgpOw0K
IA0KIAlwcl9pbmZvKCJTTVUgaXMgcmVzdW1lZCBzdWNjZXNzZnVsbHkhXG4iKTsNCi0tDQoyLjcu
NA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KYW1k
LWdmeCBtYWlsaW5nIGxpc3QNCmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngNCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
