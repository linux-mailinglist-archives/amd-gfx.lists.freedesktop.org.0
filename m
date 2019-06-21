Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 903884EC0C
	for <lists+amd-gfx@lfdr.de>; Fri, 21 Jun 2019 17:31:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23AC16E8DF;
	Fri, 21 Jun 2019 15:31:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760045.outbound.protection.outlook.com [40.107.76.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B7776E8DF
 for <amd-gfx@lists.freedesktop.org>; Fri, 21 Jun 2019 15:31:09 +0000 (UTC)
Received: from CH2PR12MB3831.namprd12.prod.outlook.com (52.132.245.141) by
 CH2PR12MB3880.namprd12.prod.outlook.com (52.132.246.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.13; Fri, 21 Jun 2019 15:31:06 +0000
Received: from CH2PR12MB3831.namprd12.prod.outlook.com
 ([fe80::3459:726f:43e7:a64c]) by CH2PR12MB3831.namprd12.prod.outlook.com
 ([fe80::3459:726f:43e7:a64c%4]) with mapi id 15.20.1987.014; Fri, 21 Jun 2019
 15:31:06 +0000
From: "Kim, Jonathan" <Jonathan.Kim@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu:  add sw_init to df_v1_7
Thread-Topic: [PATCH] drm/amdgpu:  add sw_init to df_v1_7
Thread-Index: AQHVKEZX54G3G3wJK0OJo66BzCVvTQ==
Date: Fri, 21 Jun 2019 15:31:06 +0000
Message-ID: <20190621153054.88153-1-jonathan.kim@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0023.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::36) To CH2PR12MB3831.namprd12.prod.outlook.com
 (2603:10b6:610:29::13)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8b5e7bc1-d2e2-48a7-83a0-08d6f65d79ec
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CH2PR12MB3880; 
x-ms-traffictypediagnostic: CH2PR12MB3880:
x-microsoft-antispam-prvs: <CH2PR12MB38807AEE83E9727FB58BC75485E70@CH2PR12MB3880.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-forefront-prvs: 0075CB064E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(136003)(39860400002)(396003)(346002)(376002)(199004)(189003)(7736002)(5640700003)(66946007)(66476007)(256004)(186003)(64756008)(50226002)(66446008)(68736007)(86362001)(66066001)(476003)(72206003)(305945005)(66556008)(6512007)(73956011)(52116002)(2501003)(2351001)(6506007)(99286004)(316002)(102836004)(386003)(8936002)(8676002)(81166006)(81156014)(6486002)(26005)(53936002)(14454004)(2906002)(71190400001)(71200400001)(4326008)(6916009)(6436002)(25786009)(5660300002)(6116002)(3846002)(1076003)(2616005)(54906003)(486006)(478600001)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB3880;
 H:CH2PR12MB3831.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: pP0/cASmIqLrZPm1bPvO1KW98IE2X/DarzSaqad7vN1OwPC2CQekvSTFfYRfCmc9maRfj1JFmBxx1q0T4zVZ4/aM2jhZmgMADMMsctPIPnXQ5HQ6sq3JKRcrepmePbgr8kD0dYvlG9oTeaACvkP3QSUOT0HpyB88R9oqGfUdUjA1BpeVLqWHqQzmAqc91YDNXyhZURD7aV+gv1KfAYtSAbfwDwqPeae4jOxXL9zyp/zwhvBYVo1uv8fT/fzcklSb8VtsVmnppiJP5hfzUA1ubJg6ThJ/3LAUSEtPcEgO/gT4F5OABfp86QGHQn/Ez66YrkgmvmZ5OwUIV2nqUHTThELt7h6lVLoBiifXNJOgmitl56TdykMCyw7IfnizKvH6O8n1RaeeNLGe4/yKfB+m/Zrm+w062jWNVcPxbQuGzu0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b5e7bc1-d2e2-48a7-83a0-08d6f65d79ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2019 15:31:06.2175 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jokim@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3880
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dkx4qOuRO0wmhXEQxUDu3PYYUV5Fs0nfhNWkIR7NMlE=;
 b=bpC1L4UCdJw8tuzv3hc8Ywnw2OWvjF9vitYsOp7dIi+GkFNtzvI12jQADt1O22d4AHGjG+aT0+gbq0S84GT0mD+6PfrbjuTRPLoupV11KWOrH4V1LFR5Z/XtiLAfm9XrFKF7T+FzHjWuC1sqst7nCCgs5EnnLzLI5zw/jh5aL18=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Jonathan.Kim@amd.com; 
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
Cc: "Kim, Jonathan" <Jonathan.Kim@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Y2hhbmdlIGRmX2luaXQgdG8gZGZfc3dfaW5pdCBkZiAxLjcgdG8gcHJldmVudCByZWdyZXNzaW9u
IGlzc3VlcyBvbiBwcmUtdmVnYTIwDQpwcm9kdWN0cyB3aGVuIGNhbGxiYWNrIGlzIGNhbGxlZCBp
biBzd19jb21tb25fc3dfaW5pdC4NCg0KQ2hhbmdlLUlkOiBJNDk0MTAwM2VhNGE5OWJhMGVhNzM2
YzdlY2M4ODAwMTQ4NDIzYzM3OQ0KU2lnbmVkLW9mZi1ieTogSm9uYXRoYW4gS2ltIDxKb25hdGhh
bi5LaW1AYW1kLmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RmX3YxXzcu
YyB8IDQgKystLQ0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9kZl92MV83LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9kZl92MV83LmMNCmluZGV4IDk5MzUzNzFkYjdj
ZS4uODQ0YzAzODY4MjQ4IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
ZGZfdjFfNy5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9kZl92MV83LmMNCkBA
IC0yOSw3ICsyOSw3IEBADQogDQogc3RhdGljIHUzMiBkZl92MV83X2NoYW5uZWxfbnVtYmVyW10g
PSB7MSwgMiwgMCwgNCwgMCwgOCwgMCwgMTYsIDJ9Ow0KIA0KLXN0YXRpYyB2b2lkIGRmX3YxXzdf
aW5pdCAoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpDQorc3RhdGljIHZvaWQgZGZfdjFfN19z
d19pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0KIHsNCiB9DQogDQpAQCAtMTEwLDcg
KzExMCw3IEBAIHN0YXRpYyB2b2lkIGRmX3YxXzdfZW5hYmxlX2VjY19mb3JjZV9wYXJfd3Jfcm13
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LA0KIH0NCiANCiBjb25zdCBzdHJ1Y3QgYW1kZ3B1
X2RmX2Z1bmNzIGRmX3YxXzdfZnVuY3MgPSB7DQotCS5pbml0ID0gZGZfdjFfN19pbml0LA0KKwku
c3dfaW5pdCA9IGRmX3YxXzdfc3dfaW5pdCwNCiAJLmVuYWJsZV9icm9hZGNhc3RfbW9kZSA9IGRm
X3YxXzdfZW5hYmxlX2Jyb2FkY2FzdF9tb2RlLA0KIAkuZ2V0X2ZiX2NoYW5uZWxfbnVtYmVyID0g
ZGZfdjFfN19nZXRfZmJfY2hhbm5lbF9udW1iZXIsDQogCS5nZXRfaGJtX2NoYW5uZWxfbnVtYmVy
ID0gZGZfdjFfN19nZXRfaGJtX2NoYW5uZWxfbnVtYmVyLA0KLS0gDQoyLjE3LjENCg0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5n
IGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
