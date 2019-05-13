Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD66B1B696
	for <lists+amd-gfx@lfdr.de>; Mon, 13 May 2019 15:02:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AACB88984D;
	Mon, 13 May 2019 13:02:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740089.outbound.protection.outlook.com [40.107.74.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A15089823
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 May 2019 13:02:15 +0000 (UTC)
Received: from BN6PR12MB1618.namprd12.prod.outlook.com (10.172.21.149) by
 BN6PR12MB1154.namprd12.prod.outlook.com (10.168.227.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.26; Mon, 13 May 2019 13:02:13 +0000
Received: from BN6PR12MB1618.namprd12.prod.outlook.com
 ([fe80::cc4d:3c41:57ba:522]) by BN6PR12MB1618.namprd12.prod.outlook.com
 ([fe80::cc4d:3c41:57ba:522%2]) with mapi id 15.20.1878.024; Mon, 13 May 2019
 13:02:13 +0000
From: "Russell, Kent" <Kent.Russell@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdkfd: Add missing Polaris10 ID
Thread-Topic: [PATCH] drm/amdkfd: Add missing Polaris10 ID
Thread-Index: AQHVCYwV9art1FTzy0KajedQPaKAoQ==
Date: Mon, 13 May 2019 13:02:13 +0000
Message-ID: <20190513130203.7918-1-kent.russell@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-clientproxiedby: YTOPR0101CA0061.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::38) To BN6PR12MB1618.namprd12.prod.outlook.com
 (2603:10b6:405:b::21)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ede9a150-03bc-4c49-87b4-08d6d7a33791
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1154; 
x-ms-traffictypediagnostic: BN6PR12MB1154:
x-microsoft-antispam-prvs: <BN6PR12MB1154C8C48189D222894D7E00850F0@BN6PR12MB1154.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2512;
x-forefront-prvs: 0036736630
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(376002)(346002)(396003)(366004)(39860400002)(199004)(189003)(14454004)(316002)(99286004)(52116002)(478600001)(6116002)(3846002)(72206003)(1076003)(256004)(25786009)(36756003)(66066001)(2906002)(71190400001)(71200400001)(4744005)(73956011)(4326008)(2351001)(68736007)(66476007)(66946007)(64756008)(66556008)(66446008)(86362001)(6916009)(50226002)(6506007)(386003)(5660300002)(6486002)(2501003)(5640700003)(102836004)(6436002)(53936002)(6512007)(26005)(186003)(2616005)(81156014)(81166006)(476003)(305945005)(7736002)(8676002)(486006)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1154;
 H:BN6PR12MB1618.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: PA8fLVdzFthmMVfBqX45Hz5N9A+gYVycg5mxAbPwReMZSi2gfYCfv5dcLwtg3J1H/dn2njGsBrYIWqjlmjJqfhClLo0TpLKc4jWQ7PaCy9UIa/jjl30anzrUJj7HZjYnAszztvjXsRoj6Ci5zgXZJc3avL1mWAlw57A+OXXx8K1QlNGHlgoizCusjhK8Y856wcdn/yaDm7CaiP5ZxHsKv4Xoja+hovQgi32HEXZTvmenTGlFam16zKx6tV++Ngesd4U6Db9exB2CXBphQ8q00jEZLHR5FWzJWavMxDd41dG+UgSuThNi+LhA1sYcH9MXwxk5oJfNa8SK0NVS6UqsWv4maj4SDZsyTOXqQixRb/MbH2dnQ1iigFT7vIwV6V2MB3ulPQVrK6PYmnmrfwdTYSPCXBxqtTzXDbvjdXqhxPo=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ede9a150-03bc-4c49-87b4-08d6d7a33791
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2019 13:02:13.4461 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1154
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oyR3tS38OVBDuoSWYs6HCyecYcdmR9NukGWsBi119pw=;
 b=QN3fh7JjLIz29vm5w2l15D8DiHq3N+PgGW8aX1CNQ8nqraZx0k+IjlVK1kgdk+3kthnttmRcauipng/O5wK+DNsGoza7i/wMXLO+pElIsHshPlT3VQMFUbbDPmmNTtmYMM7v5EwnponwuAobd7SWwxavZaG0766D+R+87udffR8=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kent.Russell@amd.com; 
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
Cc: "Russell, Kent" <Kent.Russell@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyB3YXMgYWRkZWQgdG8gYW1kZ3B1IGJ1dCB3YXMgbWlzc2VkIGluIGFtZGtmZA0KQ2hhbmdl
LUlkOiBJYWI1OWNjZmQ1YTQyZWZhZTE4ODQ2NzQ5ZGVlYjdjOTY0OTA4MTJkNA0KDQpTaWduZWQt
b2ZmLWJ5OiBLZW50IFJ1c3NlbGwgPGtlbnQucnVzc2VsbEBhbWQuY29tPg0KLS0tDQogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZS5jIHwgMSArDQogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtm
ZC9rZmRfZGV2aWNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMN
CmluZGV4IGE1M2RkYTkwNzFiMS4uN2I0ZWEyNGM4N2Y4IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZS5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGtmZC9rZmRfZGV2aWNlLmMNCkBAIC0zODcsNiArMzg3LDcgQEAgc3RhdGljIGNvbnN0IHN0
cnVjdCBrZmRfZGV2aWNlaWQgc3VwcG9ydGVkX2RldmljZXNbXSA9IHsNCiAJeyAweDY3Q0YsICZw
b2xhcmlzMTBfZGV2aWNlX2luZm8gfSwJLyogUG9sYXJpczEwICovDQogCXsgMHg2N0QwLCAmcG9s
YXJpczEwX3ZmX2RldmljZV9pbmZvIH0sCS8qIFBvbGFyaXMxMCB2ZiovDQogCXsgMHg2N0RGLCAm
cG9sYXJpczEwX2RldmljZV9pbmZvIH0sCS8qIFBvbGFyaXMxMCAqLw0KKwl7IDB4NkZERiwgJnBv
bGFyaXMxMF9kZXZpY2VfaW5mbyB9LAkvKiBQb2xhcmlzMTAgKi8NCiAJeyAweDY3RTAsICZwb2xh
cmlzMTFfZGV2aWNlX2luZm8gfSwJLyogUG9sYXJpczExICovDQogCXsgMHg2N0UxLCAmcG9sYXJp
czExX2RldmljZV9pbmZvIH0sCS8qIFBvbGFyaXMxMSAqLw0KIAl7IDB4NjdFMywgJnBvbGFyaXMx
MV9kZXZpY2VfaW5mbyB9LAkvKiBQb2xhcmlzMTEgKi8NCi0tIA0KMi4xNy4xDQoNCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
