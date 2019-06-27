Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0654357FDD
	for <lists+amd-gfx@lfdr.de>; Thu, 27 Jun 2019 12:03:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85DDC6E0BF;
	Thu, 27 Jun 2019 10:03:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam03on0631.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe49::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 967356E0BF
 for <amd-gfx@lists.freedesktop.org>; Thu, 27 Jun 2019 10:03:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=EhO0bML+dqEpLXNjxIS9vfQNq2ZQOLdaLGnfcNTF+vae+4dPS961bY9bDm9S5LLTQrewm3PkqNqc2MI+/teC41ok5iu+2N7pvo1BZh5sthhmTrpLRIE0AGf999vszDu2gI150MosMOzwhBj9Z+4kFYTsUm0QKpXYxyj+YcTgMu0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GI5nh9qNkTRcMsJs4YQBDBC1YG4i5QXaQxs6oDvSREo=;
 b=IzsFMMZXfsKfh8wSn4lJe7JQHKol2OJxYjJ6WoHTxzube9iY0IT1lUINRxkNqZ9eV77NFvQhqg+hjTZbH3jSSyxHB/28kQm6Oh2KgFGx8lUqwbgQT2JRA2ETd3KDtdKUtrOddM8sH6wydeP4llu+WeVCk51VS7EHPlg87ggesY4=
ARC-Authentication-Results: i=1; test.office365.com
 1;spf=none;dmarc=none;dkim=none;arc=none
Received: from MN2PR12MB3312.namprd12.prod.outlook.com (20.179.83.160) by
 MN2PR12MB3584.namprd12.prod.outlook.com (20.178.242.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Thu, 27 Jun 2019 10:03:16 +0000
Received: from MN2PR12MB3312.namprd12.prod.outlook.com
 ([fe80::842b:e55b:7196:50f5]) by MN2PR12MB3312.namprd12.prod.outlook.com
 ([fe80::842b:e55b:7196:50f5%6]) with mapi id 15.20.2008.018; Thu, 27 Jun 2019
 10:03:16 +0000
From: "Cui, Flora" <Flora.Cui@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2] drm/amdgpu: fix scheduler timeout calc
Thread-Topic: [PATCH v2] drm/amdgpu: fix scheduler timeout calc
Thread-Index: AQHVLM+JtftM5gXUOEyqva4XabrZIw==
Date: Thu, 27 Jun 2019 10:03:15 +0000
Message-ID: <1561629780-21649-1-git-send-email-flora.cui@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-clientproxiedby: HK2P15301CA0009.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::19) To MN2PR12MB3312.namprd12.prod.outlook.com
 (2603:10b6:208:106::32)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7632b553-e959-48de-d9ed-08d6fae6abf3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3584; 
x-ms-traffictypediagnostic: MN2PR12MB3584:
x-microsoft-antispam-prvs: <MN2PR12MB35843AAD25FFBE8984FCDF95FAFD0@MN2PR12MB3584.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 008184426E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(346002)(376002)(136003)(396003)(39860400002)(189003)(199004)(476003)(2616005)(486006)(53936002)(6512007)(316002)(71190400001)(6116002)(478600001)(5640700003)(3846002)(71200400001)(6436002)(6486002)(64756008)(66556008)(72206003)(66446008)(86362001)(73956011)(66946007)(66476007)(5660300002)(50226002)(99286004)(36756003)(8936002)(66066001)(14454004)(26005)(8676002)(6916009)(186003)(4326008)(81166006)(81156014)(2906002)(102836004)(7736002)(305945005)(386003)(52116002)(68736007)(6506007)(256004)(25786009)(2501003)(2351001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3584;
 H:MN2PR12MB3312.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1KXZnLfMkayb2g3qhnSnMRydMc5hZQkuAjEMUQwcL83gKnYCeNVnCQjAxYYgNk5nLZ821llti4JE9mvov6A4FRWRQKgfG/EVJYoYsB6jLStEHpkTQ1FjNZYOpxWDsmfNHzQRVP0Ip3k6JypJQIu88Zrs0CW2x+hWquv9cj/+BKOfQroV45OuL5ywBqVri2q40rxd/lyZUY/4+JqiyUzT1f+7G/oguPlT0jbZkVlkTCHp3+J4iCVDsVXq/yjpnlMn3WOY5XaNlmc5NUqxreJ4bnIndebr++/0rbeTdkp9j8eBCPDo79Yj0R7P1h/8OkWZYnsH4ov4e+QN1QwHY82ZUO5XxAK8z6ri8gCwentkeJ4270tLgJ4Oa8D7lMYGabWrgSwJxhtv/PHLKEP8mVIy1tjwAK94QRD9wCR7OLl8Hb0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7632b553-e959-48de-d9ed-08d6fae6abf3
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2019 10:03:15.9357 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fcui@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3584
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GI5nh9qNkTRcMsJs4YQBDBC1YG4i5QXaQxs6oDvSREo=;
 b=sMR3aUs1rz3nvl5iyZbtnIrF4jeVnj1aOM5GtM6ISgTGKrIiuGYAciy6KNmpZO0NFvwENEarSoVDpLfR1ctK70T6KmtJl1g6Z/pXvJ0/thJ/KTZJqjAMd8Rc0rFUj/pbt/WSjXKNCH+RfL0Dsulyjd29WJoaS6I5wvWoChg8VJs=
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

c2NoZWR1bGVyIHRpbWVvdXQgaXMgaW4gamlmZmllcw0KdjI6IG1vdmUgdGltZW91dCBjaGVjayB0
byBhbWRncHVfZGV2aWNlX2dldF9qb2JfdGltZW91dF9zZXR0aW5ncyBhZnRlcg0KcGFyc2luZyB0
aGUgdmFsdWUNCg0KQ2hhbmdlLUlkOiBJMjY3MDhjMTYzZGI5NDNmZjhkOTMwZGQ4MWJjYWI0YjRi
OWQ4NGViMg0KU2lnbmVkLW9mZi1ieTogRmxvcmEgQ3VpIDxmbG9yYS5jdWlAYW1kLmNvbT4NCi0t
LQ0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYyB8IDcgKysrKystLQ0K
IDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQoNCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMNCmluZGV4IGU3NGExNzUuLmNjMjlkNzAg
MTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMNCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYw0KQEAgLTEzMDAsNyAr
MTMwMCw5IEBAIGludCBhbWRncHVfZGV2aWNlX2dldF9qb2JfdGltZW91dF9zZXR0aW5ncyhzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCiAJICogQnkgZGVmYXVsdCB0aW1lb3V0IGZvciBub24g
Y29tcHV0ZSBqb2JzIGlzIDEwMDAwLg0KIAkgKiBBbmQgdGhlcmUgaXMgbm8gdGltZW91dCBlbmZv
cmNlZCBvbiBjb21wdXRlIGpvYnMuDQogCSAqLw0KLQlhZGV2LT5nZnhfdGltZW91dCA9IGFkZXYt
PnNkbWFfdGltZW91dCA9IGFkZXYtPnZpZGVvX3RpbWVvdXQgPSAxMDAwMDsNCisJYWRldi0+Z2Z4
X3RpbWVvdXQgPSBcDQorCQlhZGV2LT5zZG1hX3RpbWVvdXQgPSBcDQorCQlhZGV2LT52aWRlb190
aW1lb3V0ID0gbXNlY3NfdG9famlmZmllcygxMDAwMCk7DQogCWFkZXYtPmNvbXB1dGVfdGltZW91
dCA9IE1BWF9TQ0hFRFVMRV9USU1FT1VUOw0KIA0KIAlpZiAoc3RybmxlbihpbnB1dCwgQU1ER1BV
X01BWF9USU1FT1VUX1BBUkFNX0xFTlRIKSkgew0KQEAgLTEzMTQsNyArMTMxNiw4IEBAIGludCBh
bWRncHVfZGV2aWNlX2dldF9qb2JfdGltZW91dF9zZXR0aW5ncyhzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldikNCiAJCQlpZiAodGltZW91dCA8PSAwKSB7DQogCQkJCWluZGV4Kys7DQogCQkJCWNv
bnRpbnVlOw0KLQkJCX0NCisJCQl9IGVsc2UNCisJCQkJdGltZW91dCA9IG1zZWNzX3RvX2ppZmZp
ZXModGltZW91dCk7DQogDQogCQkJc3dpdGNoIChpbmRleCsrKSB7DQogCQkJY2FzZSAwOg0KLS0g
DQoyLjcuNA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
