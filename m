Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA3B17D87
	for <lists+amd-gfx@lfdr.de>; Wed,  8 May 2019 17:51:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95F4589786;
	Wed,  8 May 2019 15:51:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790079.outbound.protection.outlook.com [40.107.79.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A723F89786
 for <amd-gfx@lists.freedesktop.org>; Wed,  8 May 2019 15:51:29 +0000 (UTC)
Received: from DM5PR12MB2456.namprd12.prod.outlook.com (52.132.141.37) by
 DM5PR12MB1450.namprd12.prod.outlook.com (10.172.33.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.11; Wed, 8 May 2019 15:51:26 +0000
Received: from DM5PR12MB2456.namprd12.prod.outlook.com
 ([fe80::c877:3a1:f536:96]) by DM5PR12MB2456.namprd12.prod.outlook.com
 ([fe80::c877:3a1:f536:96%3]) with mapi id 15.20.1856.012; Wed, 8 May 2019
 15:51:26 +0000
From: "Liu, Leo" <Leo.Liu@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/6] drm/amdgpu: add no_user_fence flag to ring funcs
Thread-Topic: [PATCH 1/6] drm/amdgpu: add no_user_fence flag to ring funcs
Thread-Index: AQHVBbXkZ/S3KL0ib0CAkpZtHUTJ0g==
Date: Wed, 8 May 2019 15:51:26 +0000
Message-ID: <20190508155100.7810-1-leo.liu@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-clientproxiedby: YT1PR01CA0018.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::31)
 To DM5PR12MB2456.namprd12.prod.outlook.com
 (2603:10b6:4:b4::37)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a17d9fc5-0e39-4a01-a31a-08d6d3cd0721
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1450; 
x-ms-traffictypediagnostic: DM5PR12MB1450:
x-microsoft-antispam-prvs: <DM5PR12MB1450658DB58FF1148575045CE5320@DM5PR12MB1450.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:935;
x-forefront-prvs: 0031A0FFAF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(136003)(366004)(39860400002)(346002)(396003)(199004)(189003)(6436002)(71190400001)(71200400001)(256004)(86362001)(2351001)(476003)(2501003)(6486002)(305945005)(316002)(50226002)(66066001)(4744005)(6916009)(1076003)(81166006)(81156014)(8676002)(8936002)(478600001)(73956011)(99286004)(4326008)(486006)(72206003)(14454004)(66946007)(66556008)(66446008)(66476007)(64756008)(7736002)(6116002)(3846002)(6512007)(53936002)(25786009)(2906002)(68736007)(36756003)(52116002)(186003)(2616005)(5640700003)(6506007)(102836004)(26005)(5660300002)(386003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1450;
 H:DM5PR12MB2456.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +Fzc5IGRqhx1GsbXa2f2vkbLKI5Fzw054e5tWIDYPicJ5BiAkE4BmtV2yswzGEU0haORDkeJ7L4uJDosag3Xl0jjA/w20AFDZsWPfbdYSXB5Trmx/p8k6/Uyw1bWFibcFp6nkPI9gZ3+gjkfqFXOVX5ZTlJmrmDbWtKeDTRt2q/Z1cYQv90JaWPmOHCIdfsZfJj8sDhShgXEy5NHnn1xoOuwEsdZLpkVEIceB33NyKNGd1saUbUB71tLLJnHwTYWHVQ+W0J+i7crjnAKdc9m9TZs0l65DCk80RjvUkPvEjyY9erg1lE5Cl+ygAleWgeyUbXO9FuuWXiY6hKj0roDKKJvdmjFa/JLK77TqWjcLYwmQ9JjNJ7gOWm3sBaR7ljmwCntL3UxZ6S05L2BZJEq7uRUrQRKBaPNoYUWfXlgCN0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a17d9fc5-0e39-4a01-a31a-08d6d3cd0721
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2019 15:51:26.3647 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1450
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A3QPgNUFPG2rv75nSnGZABAMyGHFs/RyOI5uDl8K/Xs=;
 b=Hmq5z3Ef7lR9kpX1GGZFuY/HsnrIy44chf10Bup5dnZtqN1co1t+zUJY/F5IZEX2d3THofvfGiImSSDScAVrjSkfefljJhi3MSy2Ncu9S7fO2fkBrlpnhZ8cVKQ0SA7FOj7p3S70vMd7/X/SYLmoh1j9BiL+rTGTol4GNgaTgu0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Leo.Liu@amd.com; 
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
Cc: "Liu, Leo" <Leo.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U28gd2UgY2FuIGdlbmVyYWxpemUgdGhlIG5vIHVzZXIgZmVuY2Ugc3VwcG9ydGVkIGVuZ2luZQ0K
DQpTaWduZWQtb2ZmLWJ5OiBMZW8gTGl1IDxsZW8ubGl1QGFtZC5jb20+DQotLS0NCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmluZy5oIHwgMSArDQogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfcmluZy5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jpbmcu
aA0KaW5kZXggZDdmYWUyNjc2MjY5Li5jZGRkY2U5MzhiZjUgMTAwNjQ0DQotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmluZy5oDQorKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfcmluZy5oDQpAQCAtMTE0LDYgKzExNCw3IEBAIHN0cnVjdCBhbWRn
cHVfcmluZ19mdW5jcyB7DQogCXVpbnQzMl90CQlhbGlnbl9tYXNrOw0KIAl1MzIJCQlub3A7DQog
CWJvb2wJCQlzdXBwb3J0XzY0Yml0X3B0cnM7DQorCWJvb2wJCQlub191c2VyX2ZlbmNlOw0KIAl1
bnNpZ25lZAkJdm1odWI7DQogCXVuc2lnbmVkCQlleHRyYV9kdzsNCiANCi0tIA0KMi4xNy4xDQoN
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZngg
bWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
