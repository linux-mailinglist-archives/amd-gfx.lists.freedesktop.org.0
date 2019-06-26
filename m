Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCA156D8F
	for <lists+amd-gfx@lfdr.de>; Wed, 26 Jun 2019 17:22:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E95616E485;
	Wed, 26 Jun 2019 15:22:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750081.outbound.protection.outlook.com [40.107.75.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94F7E6E47A
 for <amd-gfx@lists.freedesktop.org>; Wed, 26 Jun 2019 15:22:56 +0000 (UTC)
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2468.namprd12.prod.outlook.com (52.132.11.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Wed, 26 Jun 2019 15:22:55 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::991:7474:933e:d61]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::991:7474:933e:d61%4]) with mapi id 15.20.2008.017; Wed, 26 Jun 2019
 15:22:55 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: Set queue_preemption_timeout_ms default value
Thread-Topic: [PATCH] drm/amdgpu: Set queue_preemption_timeout_ms default value
Thread-Index: AQHVLDMGOXB306YnLk+9PYZ8IHgniw==
Date: Wed, 26 Jun 2019 15:22:54 +0000
Message-ID: <1561562565-24858-1-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0032.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::45) To BL0PR12MB2580.namprd12.prod.outlook.com
 (2603:10b6:207:3e::19)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 884dc5db-c80d-4cd5-7771-08d6fa4a2935
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BL0PR12MB2468; 
x-ms-traffictypediagnostic: BL0PR12MB2468:
x-microsoft-antispam-prvs: <BL0PR12MB246818BEC9A126F783E4800F80E20@BL0PR12MB2468.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-forefront-prvs: 00808B16F3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(376002)(366004)(396003)(136003)(346002)(199004)(189003)(52116002)(386003)(26005)(71200400001)(102836004)(2501003)(186003)(6506007)(2616005)(486006)(72206003)(25786009)(99286004)(14454004)(4326008)(476003)(2906002)(7736002)(305945005)(8936002)(81166006)(256004)(68736007)(8676002)(3846002)(81156014)(73956011)(50226002)(4744005)(6116002)(66476007)(66946007)(6436002)(66556008)(64756008)(66446008)(6486002)(53936002)(6916009)(5660300002)(478600001)(86362001)(2351001)(71190400001)(316002)(36756003)(66066001)(54906003)(5640700003)(14444005)(6512007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2468;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ZGAis3yXdHMQRpyMrG5eSHsL8BMat0NPwaeez179a0GL36zBxUzZC7Nv/UV4B8jKj2vgWyWVZ1k7GdG/4mIuUt0oClk/N6TPTICh8ZrFSK4+vJCKs7lUbjoNaB5MqwXigvf9LaA/5w1E1WAJYSkWFU1Ihw/Od0Z2byFwyk28DgyQWIejoc1+wYeJqFjHXH++mFln3PnqVjARElCwK8XoU3TY3rvZuaHA4uySj5ZA5HYCeT3HYoGhcs2GpoClY6/W8nTGSXWpArd65Jkg7sA+JZna6SOGA5bHqyR+z5ngGScnSbWwZ0NObakk0FTnF4vNpz5FsRHdaPCjx+6tk8Fgzakw4o6nQm/DtWl2UpRREGINApIXuq9a30tp17TQcHIWDupElhE6T+0tKUBbWykjp5kO2VKun2cxGnrkJ3LNihg=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 884dc5db-c80d-4cd5-7771-08d6fa4a2935
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2019 15:22:54.8785 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ozeng@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2468
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sK+9AkAllHgplQoTqFQPPHQ2pRQGLpk8UBVHSMB1QTY=;
 b=PfUTqxYL22mEZKqZ0AKd9GzfTS8KVUyG1XTgg6hEbQOSQZn6NuyrpdodsSaKJ/DqxRTRT861FOz4ryDlIEyLRwHG/4JYNCKuSCo+N2oqVRCf4NaHTITiFyKjIS21IiCohv8wGVtrs5sr3ScJ3XVaO0Bvm0aUYxlliESba8fbBog=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>, "Li, Candice" <Candice.Li@amd.com>, "Zeng,
 Oak" <Oak.Zeng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U2V0IGRlZmF1bHQgdmFsdWUgb2YgdGhpcyBrZXJuZWwgcGFyYW1ldGVyIHRvIDkwMDANCg0KQ2hh
bmdlLUlkOiBJZjkxZGI0ZDJjMmFjMDhlMjVkNzcyOGQ0OTYyOWNiYWVjMGQ2Yzc3Mw0KU2lnbmVk
LW9mZi1ieTogT2FrIFplbmcgPE9hay5aZW5nQGFtZC5jb20+DQotLS0NCiBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMgfCAyICstDQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfZHJ2LmMNCmluZGV4IDdjZjZhYjAuLmU3NGExNzUgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9kcnYuYw0KQEAgLTcwMCw3ICs3MDAsNyBAQCBNT0RVTEVfUEFSTV9ERVND
KGh3c19nd3Nfc3VwcG9ydCwgIk1FQyBGVyBzdXBwb3J0IGd3cyBiYXJyaWVycyAoZmFsc2UgPSBu
b3Qgc3VwcA0KICAgKiBET0M6IHF1ZXVlX3ByZWVtcHRpb25fdGltZW91dF9tcyAoaW50KQ0KICAg
KiBxdWV1ZSBwcmVlbXB0aW9uIHRpbWVvdXQgaW4gbXMgKDEgPSBNaW5pbXVtLCA5MDAwID0gZGVm
YXVsdCkNCiAgICovDQotaW50IHF1ZXVlX3ByZWVtcHRpb25fdGltZW91dF9tczsNCitpbnQgcXVl
dWVfcHJlZW1wdGlvbl90aW1lb3V0X21zID0gOTAwMDsNCiBtb2R1bGVfcGFyYW0ocXVldWVfcHJl
ZW1wdGlvbl90aW1lb3V0X21zLCBpbnQsIDA2NDQpOw0KIE1PRFVMRV9QQVJNX0RFU0MocXVldWVf
cHJlZW1wdGlvbl90aW1lb3V0X21zLCAicXVldWUgcHJlZW1wdGlvbiB0aW1lb3V0IGluIG1zICgx
ID0gTWluaW11bSwgOTAwMCA9IGRlZmF1bHQpIik7DQogI2VuZGlmDQotLSANCjIuNy40DQoNCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
