Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D53C1A50
	for <lists+amd-gfx@lfdr.de>; Mon, 30 Sep 2019 05:20:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6204F89A1A;
	Mon, 30 Sep 2019 03:20:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720049.outbound.protection.outlook.com [40.107.72.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F22BE8994D
 for <amd-gfx@lists.freedesktop.org>; Mon, 30 Sep 2019 03:19:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vaj0glMeei2ozdIhrMAdh9bTiMdPAKsSIVXqj40gx8j4kF7PBxysr/dzf+n2HiJHQD2t2EX9TZqjlIHwafsLs4dIqbJIisBne3fiexgovt+6f79VkRHjLXjUze5uPwggd/ybv6hAv21Zpvly3NDXslwwkBmGUvj0AxlbxWiUDB2yR8Z0EDhAnYO2Dwx1xtfXC38LCI+Q+WEG7cMWjjoNK4WXjf/QGOO1BlcJEhZBtmrMyceSC2hQlGBO9ns3ArS46bAIJVKo7+XXtEOa0NG3/C/jPL03Szvu1kg9dT8/ikuBlrPx5XJDzcSjRfdrERpCJdm0bEWABDe55bWciDhSvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BYYUEpMnzw/BDPEWXUk5z6/TMVufjs46KqLunkVjqqA=;
 b=bYLYQX/0xTO1CtR+tDBg61ElUHm9tAM1uP2vvsY19nK7HvJt54Zqj9coh4QcvJzKACPJ0FwoEBCPrN5RiqiN6nSvmnM4b8DhSoT8NVVRrfyvNHV128ZwdBIwJMv3Yazmc1+v/dQ19Sv1e6LfDD+hE3Ro8zkrZTl73e2dOyq3cqSxWa0MXzfHImS1X/3G8LCUAAigYccUMhEc0erpOeFS+RpJgN1LfeWty973Ij/sZJ89bZs+QbiuVjElR1YN9r+QDFFireN21EYA+slpWhOQqxjNZCjv1VKWx5i0QzcQX0MvwrfWuQAWWsbyR1M9NWG/yCQPUGkfSIXQLi1gnZKjGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB3629.namprd12.prod.outlook.com (20.178.242.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Mon, 30 Sep 2019 03:19:58 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::a404:dfd4:47a9:497]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::a404:dfd4:47a9:497%7]) with mapi id 15.20.2305.017; Mon, 30 Sep 2019
 03:19:58 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>, "Chen, Guchun"
 <Guchun.Chen@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Subject: [PATCH 2/3] drm/amdgpu: initialize ras bad page bo array to NULL
Thread-Topic: [PATCH 2/3] drm/amdgpu: initialize ras bad page bo array to NULL
Thread-Index: AQHVdz3wps7+6ri7HUKgt9n8xK3q0g==
Date: Mon, 30 Sep 2019 03:19:58 +0000
Message-ID: <20190930031938.10982-2-tao.zhou1@amd.com>
References: <20190930031938.10982-1-tao.zhou1@amd.com>
In-Reply-To: <20190930031938.10982-1-tao.zhou1@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR01CA0006.apcprd01.prod.exchangelabs.com
 (2603:1096:203:92::18) To MN2PR12MB3054.namprd12.prod.outlook.com
 (2603:10b6:208:d1::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c9ca5881-7e0b-47ba-17cf-08d745551261
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB3629; 
x-ms-traffictypediagnostic: MN2PR12MB3629:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB36297020B72802CF4C0AA532B0820@MN2PR12MB3629.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:605;
x-forefront-prvs: 01762B0D64
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(396003)(366004)(136003)(39860400002)(199004)(189003)(66066001)(26005)(71200400001)(71190400001)(1076003)(5660300002)(316002)(186003)(76176011)(3846002)(2906002)(4744005)(6116002)(52116002)(66556008)(66476007)(64756008)(66946007)(6486002)(102836004)(86362001)(99286004)(6636002)(6436002)(386003)(14444005)(6506007)(50226002)(305945005)(256004)(6512007)(81166006)(110136005)(476003)(2616005)(486006)(25786009)(7736002)(4326008)(478600001)(66446008)(36756003)(11346002)(8936002)(8676002)(446003)(14454004)(2501003)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3629;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: yxfxap2t/3G9jjGV6haQVUpcHW74hAP+3N6C5QlkPr8ZuZ3ohHy6KHZqjjo42gZVRc6f++jr0pe5LZpn/fUGDIo7MwVKG6vdiDtBeUMBT56EmLcqvD+qd9CjmNyP48s9JKCoTpZBXqGWgY1ReFYKfJi1WSeJkICVzEp3iAOpsAzs/aP+seZpnzO8O1MqJEP6fkMwv4bfs8ZUR1SuNTlOsMdBkj32gH0ART7/2dxZm81tAf8IzRckNi2A8VZPkNxwffHCRjUOly0L/mnX+HuR8KoI1LYYWPWVJDlTttTuqLDVaivPPeGMKtRCRXWOa8J6Yeq0Q9qQxGITkgtrj5D6l6+rZgeFROw+glTrZwj+j9buuzmfYRMiTFpsInND5Re4AlXsDlpJi7+NZae9T1sgGcgnfcJIE4lCMZMmHLhXJnY=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9ca5881-7e0b-47ba-17cf-08d745551261
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2019 03:19:58.4910 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LAqkW72etyjPemVrecKSxVlgBXdTSnBn3wqRJIC+7qhcVc2wuB7Fr6FM0s9FUGvR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3629
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BYYUEpMnzw/BDPEWXUk5z6/TMVufjs46KqLunkVjqqA=;
 b=rnW8Q273Eb6fflhKJAKSv+7csfT9f+yliqR7jPNapYsvHAEe+LvrTew0AT4vzVukU6hpeX35m4FBhq9IyBYq9vTH5f2w/8bC9AyN0MiRU7Rzynx15Plx25D9VeSut62b0tgf/A/8AabBpisyqvteHfXLnZemfacO8DozBjxc6C0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Tao.Zhou1@amd.com; 
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
Cc: "Zhou1, Tao" <Tao.Zhou1@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Z3VhcmFudGVlIGJvIHBvaW50ZXJzIGluIGJhZCBwYWdlIGJvIGFycmF5IGFyZSBOVUxMIGFmdGVy
IGFsbG9jYXRpb24KClNpZ25lZC1vZmYtYnk6IFRhbyBaaG91IDx0YW8uemhvdTFAYW1kLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfcmFzLmMKaW5kZXggM2YyYTJmMTNlNGM2Li5kMWJhZmE5MmNhOTEg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMKQEAgLTEzMTAsNyArMTMx
MCw3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3Jhc19yZWFsbG9jX2VoX2RhdGFfc3BhY2Uoc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJdW5zaWduZWQgaW50IGFsaWduX3NwYWNlID0gQUxJR04o
bmV3X3NwYWNlLCA1MTIpOwogCXZvaWQgKmJwcyA9IGttYWxsb2MoYWxpZ25fc3BhY2UgKiBzaXpl
b2YoKmRhdGEtPmJwcyksIEdGUF9LRVJORUwpOwogCXN0cnVjdCBhbWRncHVfYm8gKipicHNfYm8g
PQotCQkJa21hbGxvYyhhbGlnbl9zcGFjZSAqIHNpemVvZigqZGF0YS0+YnBzX2JvKSwgR0ZQX0tF
Uk5FTCk7CisJCQlremFsbG9jKGFsaWduX3NwYWNlICogc2l6ZW9mKCpkYXRhLT5icHNfYm8pLCBH
RlBfS0VSTkVMKTsKIAogCWlmICghYnBzIHx8ICFicHNfYm8pIHsKIAkJa2ZyZWUoYnBzKTsKLS0g
CjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
