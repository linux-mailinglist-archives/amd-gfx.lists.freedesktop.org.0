Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B1582BEC
	for <lists+amd-gfx@lfdr.de>; Tue,  6 Aug 2019 08:46:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96B7C89DAB;
	Tue,  6 Aug 2019 06:46:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750077.outbound.protection.outlook.com [40.107.75.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2750F89DAB
 for <amd-gfx@lists.freedesktop.org>; Tue,  6 Aug 2019 06:46:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fnb32FlPNVLtJnNmEZ/DZMrZGF+dPVpGuhDUCfjAVRG1AnLsX71H+Z92HxkagfteYx7mrbeeIfe08/SH9zYNYXDIvhXkViG2H1r4xSNQWepA1yaMYhjUkI6irf8hR1m1tXDcOIgv5LFoWf+1M+XQanesHR/bbmZK98bl7o/Q4a4aCwsu2bnP+j3CCQV5veRYN311w++zC8nyB4sg2HClFmgX3tQy4vvIPlZTk90MMWfLQfqZAU9FEWHV0gfoc8WK7rLSj3JXz4OQ9kUdDKfaUhfyD6qpx897TsPvBGy/DjIyFMEWhE3T+CR2W/7ObMJpJda/PQGkrBb6P/71pauJLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5MPIZa1UJel6qdiwUfTo5PoGaMfckeyKAKb5dVQAfW0=;
 b=QIVjTFNZfEcofxnmMycDnEtSci+XnZDXUusXf3SPT2nCigYA3D9rzPUNmi5dpcEwg2agF+s4IqxTnt3GpCaZlRoj0DutZVZWXDUUAb7BAf6S1GLj/bgClbT8YT/x2wpgRJrpCO2hmX9IYR/MAzgUZ9h0M2JA7v5+Rkju+2GIuXRUG/TK1h7nSYIFYeHdSLBqjeW8pRzocf+27DB0csLeMXKNMrY0Tg5chrY+YMxfY1zOjDxCTCgUhqULQ19YRe4snWXl0ImfhFkR6eBtFF8fjW4DUnGChXGAXktp56Kp7x+kI6f6mrzjSg23GbEC5iMnsC88A4+tngxSwmOVxlqmvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BN8PR12MB3602.namprd12.prod.outlook.com (20.178.212.86) by
 BN8PR12MB3540.namprd12.prod.outlook.com (20.179.67.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.16; Tue, 6 Aug 2019 06:46:04 +0000
Received: from BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::14b1:e78d:199:be00]) by BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::14b1:e78d:199:be00%3]) with mapi id 15.20.2136.018; Tue, 6 Aug 2019
 06:46:04 +0000
From: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 00/10] Enable clock gating for Navi12
Thread-Topic: [PATCH 00/10] Enable clock gating for Navi12
Thread-Index: AQHVTCKeffdv/Lr98EmydDK4yzSFAg==
Date: Tue, 6 Aug 2019 06:46:04 +0000
Message-ID: <20190806064546.19434-1-xiaojie.yuan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0P153CA0001.APCP153.PROD.OUTLOOK.COM
 (2603:1096:203:18::13) To BN8PR12MB3602.namprd12.prod.outlook.com
 (2603:10b6:408:49::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3469aea5-6d9b-44da-4029-08d71a39c04d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN8PR12MB3540; 
x-ms-traffictypediagnostic: BN8PR12MB3540:
x-microsoft-antispam-prvs: <BN8PR12MB3540E6D56C2AF8D80F3AEB0189D50@BN8PR12MB3540.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 0121F24F22
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(39860400002)(366004)(346002)(136003)(189003)(199004)(5660300002)(50226002)(8676002)(71190400001)(71200400001)(8936002)(6512007)(81166006)(6916009)(86362001)(25786009)(53936002)(316002)(4326008)(81156014)(26005)(2616005)(68736007)(14444005)(66066001)(2501003)(102836004)(186003)(3846002)(99286004)(52116002)(6506007)(2351001)(256004)(486006)(1076003)(14454004)(36756003)(476003)(66476007)(305945005)(5640700003)(386003)(478600001)(6486002)(64756008)(66446008)(66556008)(6116002)(2906002)(4744005)(66946007)(6436002)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3540;
 H:BN8PR12MB3602.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qZsz1+81TC7lcbsEJHgBSxs5BpnD0dta2Ykl+LCmvlAY58kdBtG2wQBK0u7BnjT8+GiztNZOrcwsAugjALoP/2IGgFBvMGkDFJ8p3YFq8f8D4NPcC2e0b4HTsGTSnBO54SoJ/yD1v3TeTv2aHV77Nnb5M65NpODUWAXp1w43Sn2R++9+BcC82GRVVIGM5PbnahR26d3VDETzJwN7PiJHGkM05DPtQiHdYyTNmOD3la6ifJB6oqPPUra7y4jAp5DGhF3JYmdHEJFv/GHmu1pvEepmU3DaFbHWgeiM8FIrNyH0YF3yN0HntqFyz6UVHDApdFX0vhvnRgm+7jopgVnfcHRR8h1RkdXe2/W3fmPzg3CkCEAt8ru65O7MrDuU/Wbus2bc1SWE+ajTfOlAmoM+zS4YKZbyD3tDHmXDTn8RIg8=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3469aea5-6d9b-44da-4029-08d71a39c04d
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2019 06:46:04.2588 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xiyuan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3540
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5MPIZa1UJel6qdiwUfTo5PoGaMfckeyKAKb5dVQAfW0=;
 b=ocYAb20fbE19g82sK4kWajBJzd7A8oO0z9jFva0Gg235LBcOGjw6eqfylHKpcmNrpSITrXOGHqGYzH9OG2TRmYU6btx6hD2ZzoWL87cn6bmzf6x4OGRwm5Isu/9W0xQaR45mRSDsx93C0OFSboV1ngObijKRKNLKk+Pjaqq7MhY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Xiaojie.Yuan@amd.com; 
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
Cc: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QWxleCBoYXMgaGVscGVkIHRvIHJldmlld2VkIHRoZXNlIHBhdGNoZXMgaW4gQU1EIGludGVybmFs
bHkuClJlLXNlbmQgdGhlbSB0byBwdWJsaWMgbWFpbCBsaXN0LgoKWGlhb2ppZSBZdWFuICgxMCk6
CiAgZHJtL2FtZGdwdTogZW5hYmxlIGdmeCBjbG9jayBnYXRpbmdzIGZvciBuYXZpMTIKICBkcm0v
YW1kZ3B1OiBlbmFibGUgaGRwIGNsb2NrIGdhdGluZyBmb3IgbmF2aTEyCiAgZHJtL2FtZGdwdS9z
ZG1hNTogc2V0IHNkbWEgY2xvY2sgZ2F0aW5nIGZvciBuYXZpMTIKICBkcm0vYW1kZ3B1OiBlbmFi
bGUgc2RtYSBjbG9jayBnYXRpbmcgZm9yIG5hdmkxMgogIGRybS9hbWRncHUvbW1odWIyOiBzZXQg
Y2xvY2sgZ2F0aW5nIGZvciBuYXZpMTIKICBkcm0vYW1kZ3B1OiBlbmFibGUgbW1odWIgY2xvY2sg
Z2F0aW5nIGZvciBuYXZpMTIKICBkcm0vYW1kZ3B1OiBlbmFibGUgaWggY2xvY2sgZ2F0aW5nIGZv
ciBuYXZpMTIKICBkcm0vYW1kZ3B1L2F0aHViMjogc2V0IGNsb2NrIGdhdGluZyBmb3IgbmF2aTEy
CiAgZHJtL2FtZGdwdTogZW5hYmxlIGF0aHViIGNsb2NrIGdhdGluZyBmb3IgbmF2aTEyCiAgZHJt
L2FtZGdwdTogZW5hYmxlIHZjbiBjbG9jayBnYXRpbmcgZm9yIG5hdmkxMgoKIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2F0aHViX3YyXzAuYyB8ICAxICsKIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L21taHViX3YyXzAuYyB8ICAxICsKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252
LmMgICAgICAgICB8IDE2ICsrKysrKysrKysrKysrKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L3NkbWFfdjVfMC5jICB8ICAxICsKIDQgZmlsZXMgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQoKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4
