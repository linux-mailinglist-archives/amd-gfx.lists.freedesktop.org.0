Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCF495893
	for <lists+amd-gfx@lfdr.de>; Tue, 20 Aug 2019 09:34:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1040489204;
	Tue, 20 Aug 2019 07:34:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800055.outbound.protection.outlook.com [40.107.80.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 842B26E605
 for <amd-gfx@lists.freedesktop.org>; Tue, 20 Aug 2019 07:34:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QAyD8zbSz00DhJRaM2B+do2n4r3IIvIpauaS26LLTqdtzOcKG1P80+Xn2tmBEY0YtiUEVxGnqebzPMK7bTKqhURJzNThqzPLv1b4sPFyB3bmC0mrghLj5GeeDIHFK76922/fXAclpdoqQl4KfGUZKOsGv0MgD3Rv3UVxXuTr4UuVRPWNvq4xZ8stGUHm2VQV2gYDSWbLtKiJO2pKrfOrSP08I728BRmmVRc6dfVy1wXArJBZkJGuEI19nSnu7QpENyTGr7shgnyZ+DJup5MKVGP9G05vLku4iWzwjZjNfzStq0nX/81OCnIQ/HsaEMCeTFi29d6yBUyY+HQAcXfvwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bqNgeEvJNIbb9xAoWSRhuzygzfUH/tmuM4bYaa/NfbU=;
 b=RucqgBkkdSJ/cPHHB2Q5BGeakM1/SV3v++o8BzbLQlQ+9pZxnbVPuXRoU6UrR5rTFHQOmfgysXBB1Ia/tSqElSQtMvdbsQM1hUfpUFdDZ8c722vKadcvAOj7uVO/zdueow1EZq9dfrfLjbflzgXuuDoElc/RhY7hFLPQxb3SMR79o1hDzYRxhhB58F0zcCLGa1lZ3s7khO+BkkcpTFMkNWyDBjvwqEi0g94TmuwQ0BoqCWNahIBlszOuOat4Tkqn+514PYl7rezIWmMsmWjtXESAQDOzRMz+saCDdUNxKdJ1iCj8igLl3oKja+hNRPA625QpX8/2+EhYU5p5B+60GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1418.namprd12.prod.outlook.com (10.168.240.15) by
 DM5PR12MB1609.namprd12.prod.outlook.com (10.172.40.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Tue, 20 Aug 2019 07:34:23 +0000
Received: from DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::9c59:de8d:9ec:5350]) by DM5PR12MB1418.namprd12.prod.outlook.com
 ([fe80::9c59:de8d:9ec:5350%4]) with mapi id 15.20.2178.018; Tue, 20 Aug 2019
 07:34:23 +0000
From: "Zhang, Hawking" <Hawking.Zhang@amd.com>
To: "Feng, Kenneth" <Kenneth.Feng@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v2] drm/amd/amdgpu: disable MMHUB PG for navi10
Thread-Topic: [PATCH v2] drm/amd/amdgpu: disable MMHUB PG for navi10
Thread-Index: AQHVVydWNhZUqa+1B0OIq+MWQdwLh6cDpOYA
Date: Tue, 20 Aug 2019 07:34:23 +0000
Message-ID: <DM5PR12MB1418EC9D9E83A675F3584341FCAB0@DM5PR12MB1418.namprd12.prod.outlook.com>
References: <1566285434-12651-1-git-send-email-kenneth.feng@amd.com>
In-Reply-To: <1566285434-12651-1-git-send-email-kenneth.feng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3a8301f6-ff6a-4c5f-3238-08d72540d2af
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1609; 
x-ms-traffictypediagnostic: DM5PR12MB1609:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB160939850DDF08B8891BF174FCAB0@DM5PR12MB1609.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 013568035E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(366004)(39860400002)(136003)(396003)(13464003)(189003)(199004)(52536014)(76116006)(5660300002)(66556008)(66476007)(64756008)(66446008)(74316002)(7696005)(6246003)(186003)(76176011)(26005)(316002)(71200400001)(66946007)(71190400001)(14454004)(86362001)(478600001)(66066001)(110136005)(6506007)(53546011)(2501003)(33656002)(99286004)(229853002)(6306002)(9686003)(55016002)(486006)(476003)(102836004)(53936002)(256004)(14444005)(446003)(81156014)(81166006)(25786009)(7736002)(8676002)(305945005)(11346002)(6436002)(8936002)(4326008)(966005)(6116002)(3846002)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1609;
 H:DM5PR12MB1418.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: VmTy6Sv9D8O3SYP8JNktqdPIyiAPbw0aEoG4TSO/pJjsNSCnxoM/2NIIX645Zv0BoEyzcU6hVPL2pWvLB6I28KOpw9219kU7n0LKsDeXFV30JSdXPs7523uIfXLX/JnGQbynQopkhsjDuDSxdtAxC6wKlXvieADTEW3ZnaQX9rw0CJXA0iSFfy4bKi+eFX4RcV5/3Cw5+fctFMsVZs+jY/qck0Gz0ITGnx+gd2NOWy45q9Fe7L5UnDhbf/HLVDWVp+pbXXod1z0vBQ2WmCTkEslLzl6wrTkFMAeC9Uiktr38kwtEqljwTfnleTZEZtdwdklJm6/xNCzSqvnsgL7R5+kFe3nIsN6gnLnMAu8l2Khbk/GEj9Er90KulFBj0vvzXcGi9oDPneohu12RPVACzxBZViZgZZi9Mr0BQWFylvQ=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a8301f6-ff6a-4c5f-3238-08d72540d2af
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2019 07:34:23.6577 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QXqC2nf8F7sUhHoRVggyRXaLqjFHtWz3ENs5SKj3V+xDW3kuzsuf59zfHWAg75/svwetsrcMr/WsRuiB01p89Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1609
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bqNgeEvJNIbb9xAoWSRhuzygzfUH/tmuM4bYaa/NfbU=;
 b=BLloWezCixqJKX3vOQCcNUzH1FK7hSgoo/pszz84OTR4zXl/ZxAd899razwPrNzezuIek1pitfcPnr1YjaFkzQds0X9sBkyUzlaEhzaq0kFEbrmHqGglwrwft2zdAF9EYgfKCOcbcQR34Szp3iMwKJGYF+4fkWICRqknsS6Jj6k=
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
Cc: "Feng, Kenneth" <Kenneth.Feng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhhbmtzIEtlbm5ldGguIFRoZSBwYXRjaCBpcw0KDQpSZXZpZXdlZC1ieTogSGF3a2luZyBaaGFu
ZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPg0KDQpSZWdhcmRzLA0KSGF3a2luZw0KLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IGFtZC1nZnggPGFtZC1nZngtYm91bmNlc0BsaXN0cy5m
cmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBLZW5uZXRoIEZlbmcNClNlbnQ6IDIwMTnlubQ4
5pyIMjDml6UgMTU6MTcNClRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KQ2M6IEZl
bmcsIEtlbm5ldGggPEtlbm5ldGguRmVuZ0BhbWQuY29tPg0KU3ViamVjdDogW1BBVENIIHYyXSBk
cm0vYW1kL2FtZGdwdTogZGlzYWJsZSBNTUhVQiBQRyBmb3IgbmF2aTEwDQoNCkRpc2FibGUgTU1I
VUIgUEcgZm9yIG5hdmkxMCBhY2NvcmRpbmcgdG8gdGhlIHByb2R1Y3Rpb24gcmVxdWlyZW1lbnQu
DQoNClNpZ25lZC1vZmYtYnk6IEtlbm5ldGggRmVuZyA8a2VubmV0aC5mZW5nQGFtZC5jb20+DQot
LS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jIHwgMSAtDQogMSBmaWxlIGNoYW5n
ZWQsIDEgZGVsZXRpb24oLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L252LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jIGluZGV4IGQ0YTIwMTIu
LjQ2ZjQwMmEgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jDQor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jDQpAQCAtNjE2LDcgKzYxNiw2IEBA
IHN0YXRpYyBpbnQgbnZfY29tbW9uX2Vhcmx5X2luaXQodm9pZCAqaGFuZGxlKQ0KIAkJCUFNRF9D
R19TVVBQT1JUX0JJRl9MUzsNCiAJCWFkZXYtPnBnX2ZsYWdzID0gQU1EX1BHX1NVUFBPUlRfVkNO
IHwNCiAJCQlBTURfUEdfU1VQUE9SVF9WQ05fRFBHIHwNCi0JCQlBTURfUEdfU1VQUE9SVF9NTUhV
QiB8DQogCQkJQU1EX1BHX1NVUFBPUlRfQVRIVUI7DQogCQlhZGV2LT5leHRlcm5hbF9yZXZfaWQg
PSBhZGV2LT5yZXZfaWQgKyAweDE7DQogCQlicmVhazsNCi0tDQoyLjcuNA0KDQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KYW1kLWdmeCBtYWlsaW5nIGxp
c3QNCmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngNCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==
