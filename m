Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1B199003
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Aug 2019 11:51:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1BDE89E2C;
	Thu, 22 Aug 2019 09:51:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770053.outbound.protection.outlook.com [40.107.77.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C010589E2C
 for <amd-gfx@lists.freedesktop.org>; Thu, 22 Aug 2019 09:51:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hk9CElZi95TKZJczmyTIR8f8SEkufIlS3rR2+CDyKAt1fFRiMcoU7ek/Rdu6t6oD4qp+BmoRS1xSNf9lyfe2JbpUwGQDHlOfl0E8QqOPOe44LN9jPJ/OMZhr6Tk2QzSx1UfnQbESGa8q/YqSkAPLu9U8dD+JeSa42ABNez3PFm7/RBkrDdyuTzB81qdilFVKXh4zNhSoQTzlBT9ilQ+yI06SdQoCHXXyoly57VHx5cy4piLnEOBjm8L0awFV1buYr2sM/RWrKrGKjmHiVd6X/sV9KnxGBY4f5nQP66T6Ifd9VO5Fm52uAjqrOawzwv8lYgmGb2PCJTj/niGyRTiYeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sOmrP/1RZh+ItKYOX0RfpEhNLU41Eeev0hptJzu17k0=;
 b=ZP1r1orYMCX3VdAdM9oEzGGqzEX44+A0ahG9CKo5l2SfW7Z68jrJnFG+K58K2i/AY+1neXyrBsvcswH8GCeGBBiMDDANP+GlCpolrlk8UFSjcvrjcPsS5Q4Vfdb29NtkusVhBSq46xO9hyEgxfMCViZrcnB+MKj5kFyB2QiTz7WfQalw5IVLX4ZHUYqjlGZWo5V4S3249ZTE+lUmlDDts2Yh2uequyze8La3N+cKWaMDdHvCMhUD3gQpZHIPU5ZGZyKyXGZNE7S5Hwcv4oYbwMoSRFOjLcajo8eoIxKFGEnygaKgVK/6zbdL4oiJqWrKXsIdGlrotTZaLrgpwA6gTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB3767.namprd12.prod.outlook.com (52.132.244.213) by
 CH2PR12MB4024.namprd12.prod.outlook.com (52.132.245.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Thu, 22 Aug 2019 09:51:31 +0000
Received: from CH2PR12MB3767.namprd12.prod.outlook.com
 ([fe80::503b:f594:5d08:d729]) by CH2PR12MB3767.namprd12.prod.outlook.com
 ([fe80::503b:f594:5d08:d729%7]) with mapi id 15.20.2178.020; Thu, 22 Aug 2019
 09:51:31 +0000
From: "Xu, Feifei" <Feifei.Xu@amd.com>
To: "Min, Frank" <Frank.Min@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 1/3] amd/amdgpu: add Arcturus vf DID support
Thread-Topic: [PATCH 1/3] amd/amdgpu: add Arcturus vf DID support
Thread-Index: AQHVVBDtGtmXcgLW0UWHVWHGApGp7qcG9ikg
Date: Thu, 22 Aug 2019 09:51:31 +0000
Message-ID: <CH2PR12MB376737C4A3EA72C64EC13AA1FEA50@CH2PR12MB3767.namprd12.prod.outlook.com>
References: <1565945960-21236-1-git-send-email-Frank.Min@amd.com>
In-Reply-To: <1565945960-21236-1-git-send-email-Frank.Min@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9d28e570-3ff2-46b1-f0fe-08d726e64f7a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:CH2PR12MB4024; 
x-ms-traffictypediagnostic: CH2PR12MB4024:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR12MB4024F0A3DD6B8619E880BA08FEA50@CH2PR12MB4024.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:296;
x-forefront-prvs: 01371B902F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(396003)(366004)(376002)(39860400002)(346002)(136003)(199004)(189003)(13464003)(76176011)(8676002)(7736002)(229853002)(81166006)(6306002)(25786009)(26005)(81156014)(486006)(9686003)(186003)(71190400001)(66556008)(52536014)(71200400001)(2906002)(6246003)(2501003)(64756008)(66476007)(74316002)(4326008)(66446008)(7696005)(86362001)(66946007)(76116006)(53546011)(14454004)(102836004)(8936002)(33656002)(5660300002)(478600001)(6436002)(305945005)(55016002)(99286004)(110136005)(316002)(446003)(53936002)(6116002)(11346002)(3846002)(966005)(6506007)(256004)(66066001)(476003)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB4024;
 H:CH2PR12MB3767.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: R/8DoxYEfJRVkyMDYZVEJEcwB1Pte2+JHvtvjICv+w30lN48Y7fe2cauWO/NtD6PwWO29issYp8XBR6dKmhLXo44Za5q/0QAVKUFArtw9d2+JeVpC3H1rHL0fsv3stosfF+AVbarVoFhPnNTlDmDzv5MMudGw2hskTaVUV5LZtp7L/WMsjeyvj23DpyADcSRL9u/qe5KtRH111sh6/bPBKsHAQ9YMKWqMxmESJopQx3pnjAOQqLCEQQ/QUPyO8sGo3RF4/UQ7Wf4Ou7ad+6VpCTg1yU+taJuMXMFZ8c7dP01vnz/KXq4J9Uv2MZevYUT1gspzLWvh8YtFP622Zcaku1DvzvWGi2VaA4DUBpUngsP3eGVDpXDXqXJyN5LVy4m6Ng02EyaS3/8u/J94t+Q4rbxsRPYV+vo1QhVttBL+BQ=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d28e570-3ff2-46b1-f0fe-08d726e64f7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2019 09:51:31.2885 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M+33W3f1T2biNI6fPpr/E+lA1kXKH1zrael1MGkL2VnoIbL/52sYD+ktW3HBgZFX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4024
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sOmrP/1RZh+ItKYOX0RfpEhNLU41Eeev0hptJzu17k0=;
 b=vTwVAtBrLIj18Ktif24biMPk2x58bPN1VNk9HDuHcbm3CDK4E/6YytCL04Dgn4Tp7zlB2ZKD2W9J/pFiHOq8alIVFdy2BWktG5Mcl4fA7Sl3HKPz0J/DZrl2ne6GXczZWiMBwy/QOlIZ+tQtc9olZfW/KcFMwqGrzNFTU3DwyY0=
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
Cc: "Min, Frank" <Frank.Min@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

DQpSZXZpZXdlZC1ieTogRmVpZmVpIFh1IDxGZWlmZWkuWHVAYW1kLmNvbT4NCg0KLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IGFtZC1nZnggPGFtZC1nZngtYm91bmNlc0BsaXN0cy5m
cmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBGcmFuay5NaW4NClNlbnQ6IDIwMTnlubQ45pyI
MTbml6UgMTY6NTkNClRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KQ2M6IE1pbiwg
RnJhbmsgPEZyYW5rLk1pbkBhbWQuY29tPg0KU3ViamVjdDogW1BBVENIIDEvM10gYW1kL2FtZGdw
dTogYWRkIEFyY3R1cnVzIHZmIERJRCBzdXBwb3J0DQoNCkNoYW5nZS1JZDogSTcxNTMxNTM3ODVm
ZGQ1NGExMGViYzQ3ZTc3OGUwNjk4MmVkYzc5ZDcNClNpZ25lZC1vZmYtYnk6IEZyYW5rLk1pbiA8
RnJhbmsuTWluQGFtZC5jb20+DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfZHJ2LmMgfCAxICsNCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCg0KZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYw0KaW5kZXggMGU4YzE2NS4uMzg5MGJhMiAx
MDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYw0KKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jDQpAQCAtOTk5LDYgKzk5
OSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCBwY2lpZGxpc3RbXSA9IHsN
CiAJezB4MTAwMiwgMHg3MzhDLCBQQ0lfQU5ZX0lELCBQQ0lfQU5ZX0lELCAwLCAwLCBDSElQX0FS
Q1RVUlVTfSwNCiAJezB4MTAwMiwgMHg3Mzg4LCBQQ0lfQU5ZX0lELCBQQ0lfQU5ZX0lELCAwLCAw
LCBDSElQX0FSQ1RVUlVTfSwNCiAJezB4MTAwMiwgMHg3MzhFLCBQQ0lfQU5ZX0lELCBQQ0lfQU5Z
X0lELCAwLCAwLCBDSElQX0FSQ1RVUlVTfSwNCisJezB4MTAwMiwgMHg3MzkwLCBQQ0lfQU5ZX0lE
LCBQQ0lfQU5ZX0lELCAwLCAwLCBDSElQX0FSQ1RVUlVTfSwNCiAJLyogTmF2aTEwICovDQogCXsw
eDEwMDIsIDB4NzMxMCwgUENJX0FOWV9JRCwgUENJX0FOWV9JRCwgMCwgMCwgQ0hJUF9OQVZJMTB9
LA0KIAl7MHgxMDAyLCAweDczMTIsIFBDSV9BTllfSUQsIFBDSV9BTllfSUQsIDAsIDAsIENISVBf
TkFWSTEwfSwNCi0tIA0KMi43LjQNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18NCmFtZC1nZnggbWFpbGluZyBsaXN0DQphbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZw0KaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
