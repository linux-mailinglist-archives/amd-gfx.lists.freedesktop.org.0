Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7423D4DA19
	for <lists+amd-gfx@lfdr.de>; Thu, 20 Jun 2019 21:22:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 240D56E4AD;
	Thu, 20 Jun 2019 19:22:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740054.outbound.protection.outlook.com [40.107.74.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB9BE6E433
 for <amd-gfx@lists.freedesktop.org>; Thu, 20 Jun 2019 19:22:11 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB2828.namprd12.prod.outlook.com (20.177.221.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.11; Thu, 20 Jun 2019 19:22:10 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::5964:8c3c:1b5b:c480%2]) with mapi id 15.20.1987.014; Thu, 20 Jun 2019
 19:22:10 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amdkfd: Disable idle optimization for chained runlist
Thread-Topic: [PATCH 2/2] drm/amdkfd: Disable idle optimization for chained
 runlist
Thread-Index: AQHVJ511/yXp6Ssh1EGNmWRTUJADSg==
Date: Thu, 20 Jun 2019 19:22:10 +0000
Message-ID: <20190620192155.20226-2-Felix.Kuehling@amd.com>
References: <20190620192155.20226-1-Felix.Kuehling@amd.com>
In-Reply-To: <20190620192155.20226-1-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-mailer: git-send-email 2.17.1
x-clientproxiedby: YTXPR0101CA0016.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::29) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cfffedb2-1937-43c0-54eb-08d6f5b4975c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB2828; 
x-ms-traffictypediagnostic: DM6PR12MB2828:
x-microsoft-antispam-prvs: <DM6PR12MB28280E956D59C466D67E992B92E40@DM6PR12MB2828.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1265;
x-forefront-prvs: 0074BBE012
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(396003)(39860400002)(376002)(136003)(366004)(189003)(199004)(6116002)(446003)(2501003)(66556008)(478600001)(64756008)(53936002)(99286004)(66066001)(186003)(25786009)(26005)(36756003)(2906002)(102836004)(386003)(256004)(72206003)(52116002)(486006)(2351001)(68736007)(14454004)(86362001)(6506007)(8936002)(50226002)(8676002)(81156014)(81166006)(3846002)(6512007)(476003)(2616005)(5640700003)(316002)(76176011)(7736002)(4326008)(305945005)(6486002)(6436002)(73956011)(1076003)(11346002)(71200400001)(71190400001)(66446008)(6916009)(66476007)(5660300002)(66946007)(4744005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2828;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: gPg0caarrmekpW3d4X7sUMTd52fAOHbRraSmY61Q1hiQia72vQiq5fFEb2wbsTLOhwjR63n9P6IV39IH//yt6UZjLoCk3ZopqWeyomCQa3Mp9/df06pz0eYuXNXeatEPyYKEGM+PgKgBZFAQKKgUbIogh90pqKz6Bn7QkGfCXnnKVaVPzRuSCcyqDtW6oaECD5stJG/Ziy7/zbMH8MW5KMo/eF6K8s+h7ltRk2O+DQtk6CSmyAWhF4zdcv/9lYX4vnXVqyVREYlWPMywG8vzvEph/+5tkyhu10fJVWBpB84JmVqBQMhhIb7E8Z5wp35xMyMKdRAi0X2/LteVVjMELnSldxodP0YPtXxNT5wjt79SiKPZLUuE4RayZ589w1HeSFMKLQwxBQD9bXfzuTk3EbQYKBu0mhmYQ6BUIFPKWfA=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfffedb2-1937-43c0-54eb-08d6f5b4975c
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2019 19:22:10.7479 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2828
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wiQhno4oV5kYA7T23zH4eczZb5r0vi6Yd/oWluDYk/U=;
 b=fcJGbYOmiqrNleAdE3HFAiQMYOnvwXO+3DIfnyP7GxTMqqhfAAxfpudZmiomMShpk+qwrCv3MGeaIhPqDC5P9D3thALTx/M3fZrf74s8cud/yjms//hY1kT2I14KoSqMVtA3pQu79uEqmvIXNsK2yAx5gc+nMaFb8cIE6Kgdg0I=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyB3b3JrcyBhcm91bmQgZGlmZmljdWx0LXRvLXJlcHJvZHVjZSBzb2Z0IGhhbmdzIG9uIG92
ZXJzdWJzY3JpYmVkDQpydW5saXN0cy4NCg0KU2lnbmVkLW9mZi1ieTogRmVsaXggS3VlaGxpbmcg
PEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtm
ZC9rZmRfa2VybmVsX3F1ZXVlX3Y5LmMgfCAxICsNCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKykNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9rZXJu
ZWxfcXVldWVfdjkuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9rZXJuZWxfcXVl
dWVfdjkuYw0KaW5kZXggMDdmMDJmOGU0ZmU0Li4yZDVkZGYxOTliZDAgMTAwNjQ0DQotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfa2VybmVsX3F1ZXVlX3Y5LmMNCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9rZXJuZWxfcXVldWVfdjkuYw0KQEAgLTEzNCw2
ICsxMzQsNyBAQCBzdGF0aWMgaW50IHBtX3J1bmxpc3Rfdjkoc3RydWN0IHBhY2tldF9tYW5hZ2Vy
ICpwbSwgdWludDMyX3QgKmJ1ZmZlciwNCiAJcGFja2V0LT5iaXRmaWVsZHM0LmliX3NpemUgPSBp
Yl9zaXplX2luX2R3b3JkczsNCiAJcGFja2V0LT5iaXRmaWVsZHM0LmNoYWluID0gY2hhaW4gPyAx
IDogMDsNCiAJcGFja2V0LT5iaXRmaWVsZHM0Lm9mZmxvYWRfcG9sbGluZyA9IDA7DQorCXBhY2tl
dC0+Yml0ZmllbGRzNC5jaGFpbmVkX3J1bmxpc3RfaWRsZV9kaXNhYmxlID0gY2hhaW4gPyAxIDog
MDsNCiAJcGFja2V0LT5iaXRmaWVsZHM0LnZhbGlkID0gMTsNCiAJcGFja2V0LT5iaXRmaWVsZHM0
LnByb2Nlc3NfY250ID0gY29uY3VycmVudF9wcm9jX2NudDsNCiAJcGFja2V0LT5vcmRpbmFsMiA9
IGxvd2VyXzMyX2JpdHMoaWIpOw0KLS0gDQoyLjE3LjENCg0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4
