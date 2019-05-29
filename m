Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6492D598
	for <lists+amd-gfx@lfdr.de>; Wed, 29 May 2019 08:36:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E57CB6E241;
	Wed, 29 May 2019 06:36:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730049.outbound.protection.outlook.com [40.107.73.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0681B6E117
 for <amd-gfx@lists.freedesktop.org>; Wed, 29 May 2019 06:36:41 +0000 (UTC)
Received: from MN2PR12MB3312.namprd12.prod.outlook.com (20.179.83.160) by
 MN2PR12MB3088.namprd12.prod.outlook.com (20.178.241.29) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.21; Wed, 29 May 2019 06:36:39 +0000
Received: from MN2PR12MB3312.namprd12.prod.outlook.com
 ([fe80::b828:da4:7aaf:485f]) by MN2PR12MB3312.namprd12.prod.outlook.com
 ([fe80::b828:da4:7aaf:485f%3]) with mapi id 15.20.1922.021; Wed, 29 May 2019
 06:36:39 +0000
From: "Cui, Flora" <Flora.Cui@amd.com>
To: "Daenzer, Michel" <Michel.Daenzer@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] dri2: reply to client for WaitMSC request in any case
Thread-Topic: [PATCH] dri2: reply to client for WaitMSC request in any case
Thread-Index: AQHVFejeEqWpoXG6W0aleVwTMJxbcw==
Date: Wed, 29 May 2019 06:36:39 +0000
Message-ID: <1559111780-32513-1-git-send-email-flora.cui@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-clientproxiedby: HK2PR03CA0056.apcprd03.prod.outlook.com
 (2603:1096:202:17::26) To MN2PR12MB3312.namprd12.prod.outlook.com
 (2603:10b6:208:106::32)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0ff4fc3f-730e-4e8f-36f7-08d6e400011c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3088; 
x-ms-traffictypediagnostic: MN2PR12MB3088:
x-microsoft-antispam-prvs: <MN2PR12MB308833BD0F2312D04938864FFA1F0@MN2PR12MB3088.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1775;
x-forefront-prvs: 0052308DC6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(366004)(396003)(346002)(136003)(376002)(199004)(189003)(66446008)(66476007)(64756008)(71190400001)(73956011)(66946007)(4326008)(14454004)(52116002)(71200400001)(86362001)(81166006)(7736002)(25786009)(305945005)(110136005)(8676002)(6506007)(50226002)(8936002)(81156014)(99286004)(72206003)(386003)(102836004)(66556008)(53936002)(2906002)(6486002)(2501003)(186003)(36756003)(5660300002)(14444005)(256004)(68736007)(486006)(6436002)(6512007)(66066001)(2616005)(316002)(476003)(6116002)(478600001)(4744005)(3846002)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3088;
 H:MN2PR12MB3312.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: GBphS93JuMU/aak4w0riaoNXCQLrPnQNYA6xD+T1+v69JS+GkXrEU6rN8vQK3BL5ieUTC8xclBFjh+RVlg5uMbsdX7RLuzV/Yhh9YY1zOzvaXR6cN8nqkvCWYhOI0AoHvylCTNfVPLtcpwlIQF+ytM7xSUU2z0KIGBU/ZcqtBQWTfN0DSWl0UkGtwl0YbT9PZIFY3ZOmygHJODTZUGr9HkVKO+wtVWE0kum2eTtq3zn+pzl3XfU/W6WL0cIOOPkaOiZxxlwh4BNOODH4lemsWD0dxEJTWHAQwCOuQ1BtR6iLUf1WfbzLrTxS7rqHkFqLFaE4hAkP2fBfB9ndZqi56GO+3vSlQtBvwZ03zGuRW4bbt2auYS+5+nlDXgOOMrtWOeNs5jCueUjw1LGmFtZfdJT8OPigJok7s9HImgSICLc=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ff4fc3f-730e-4e8f-36f7-08d6e400011c
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2019 06:36:39.4919 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fcui@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3088
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pGOLIiARi8MZdsgqdIYwV2rxgCV3E0CHnOZ5+0mfRVE=;
 b=wFAw5bGs+BuLNx486rRfkAZO7JUCkPjPefzj9J3ecCPz9P3bKx8uRbgMNhVTfAUI1l7FezOr5c/vfCgJ+gETfmjg5CUX/8FYKTD0M+bBEg7GwwHvN6jdp4TvffY+ZU1r3kgxGQ5WaZ5qrc6hXxgcbtbdnc86fivqiubTuwQIv40=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Flora.Cui@amd.com; 
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
Cc: "Cui, Flora" <Flora.Cui@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

b3RoZXJ3aXNlIGNsaWVudCB3b3VsZCB3YWl0IGZvciByZXBseSBmb3JldmVyIGFuZCBkZXNrdG9w
IGFwcGVhcnMgaGFuZy4NCg0KU2lnbmVkLW9mZi1ieTogRmxvcmEgQ3VpIDxmbG9yYS5jdWlAYW1k
LmNvbT4NCi0tLQ0KIHNyYy9hbWRncHVfZHJpMi5jIHwgMyArKysNCiAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS9zcmMvYW1kZ3B1X2RyaTIuYyBiL3NyYy9h
bWRncHVfZHJpMi5jDQppbmRleCA0NDMxNmFjLi4zNDM1M2E3IDEwMDY0NA0KLS0tIGEvc3JjL2Ft
ZGdwdV9kcmkyLmMNCisrKyBiL3NyYy9hbWRncHVfZHJpMi5jDQpAQCAtMTA2Miw2ICsxMDYyLDkg
QEAgc3RhdGljIGludCBhbWRncHVfZHJpMl9zY2hlZHVsZV93YWl0X21zYyhDbGllbnRQdHIgY2xp
ZW50LCBEcmF3YWJsZVB0ciBkcmF3LA0KIG91dF9jb21wbGV0ZToNCiAJaWYgKHdhaXRfaW5mbykN
CiAJCWFtZGdwdV9kcmkyX2RlZmVycmVkX2V2ZW50KE5VTEwsIDAsIHdhaXRfaW5mbyk7DQorDQor
CURSSTJXYWl0TVNDQ29tcGxldGUoY2xpZW50LCBkcmF3LCB0YXJnZXRfbXNjLCAwLCAwKTsNCisN
CiAJcmV0dXJuIFRSVUU7DQogfQ0KIA0KLS0gDQoyLjcuNA0KDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=
