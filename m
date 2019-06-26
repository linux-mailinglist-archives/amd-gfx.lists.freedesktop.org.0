Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A895624B
	for <lists+amd-gfx@lfdr.de>; Wed, 26 Jun 2019 08:24:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A0FD6E284;
	Wed, 26 Jun 2019 06:24:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790070.outbound.protection.outlook.com [40.107.79.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0B756E284
 for <amd-gfx@lists.freedesktop.org>; Wed, 26 Jun 2019 06:24:24 +0000 (UTC)
Received: from BN8PR12MB3602.namprd12.prod.outlook.com (20.178.212.86) by
 BN8PR12MB2929.namprd12.prod.outlook.com (20.179.66.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Wed, 26 Jun 2019 06:24:19 +0000
Received: from BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::b43a:f8f2:2865:dd58]) by BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::b43a:f8f2:2865:dd58%7]) with mapi id 15.20.2008.017; Wed, 26 Jun 2019
 06:24:19 +0000
From: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/powerplay: warn on smu interface version mismatch
Thread-Topic: [PATCH] drm/amd/powerplay: warn on smu interface version mismatch
Thread-Index: AQHVK+fJXp+C2SF0xkCEf4zbx9jaSg==
Date: Wed, 26 Jun 2019 06:24:19 +0000
Message-ID: <20190626062402.18551-1-xiaojie.yuan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR01CA0072.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::36) To BN8PR12MB3602.namprd12.prod.outlook.com
 (2603:10b6:408:49::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c24a0993-4a23-468b-e5b6-08d6f9feeb73
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN8PR12MB2929; 
x-ms-traffictypediagnostic: BN8PR12MB2929:
x-microsoft-antispam-prvs: <BN8PR12MB2929045BE9F05EB796A2224489E20@BN8PR12MB2929.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:639;
x-forefront-prvs: 00808B16F3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(346002)(136003)(376002)(366004)(39860400002)(199004)(189003)(66446008)(66476007)(305945005)(64756008)(66556008)(66066001)(5660300002)(2351001)(73956011)(66946007)(3846002)(6116002)(71200400001)(68736007)(316002)(36756003)(71190400001)(1076003)(14454004)(72206003)(7736002)(478600001)(2906002)(2501003)(6916009)(99286004)(6436002)(53936002)(476003)(8936002)(50226002)(25786009)(2616005)(386003)(8676002)(4326008)(6506007)(81156014)(81166006)(486006)(52116002)(86362001)(26005)(54906003)(6512007)(256004)(4744005)(102836004)(5640700003)(186003)(6486002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB2929;
 H:BN8PR12MB3602.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 3pvyVhQl71KmkOrXZyItthG9Uljc9o3t1ZwNhQOG/YXjrBb/J043k5lCTKWPccvEQuIkQ5BlIFGZ3Nmc3D20EDH1Rui1oV/Ti/8xv7/S27kObqeIW/w2Nv0WyFmuLpIdEOKeT/NvDz1IZq0tWPdFZiD5NIZn0lgFtq7cg4NmySwJVwo6Bh4tuz+n/qNhEp5ejlGz6EZqYPCewAhFXg4ApbVogKhZVbsfxkAIBBUkIDRW1EfYKaRjG4UrtVZjAuU6x/Nqjb2lb/X82TX0MyP1070TKNPaA7OXA904zz9mLzvaBZBe7CV7bwGhKjEBV9B+aYJ8fGWF3/mm087a5xd9nHH9odKQZQpYGJxSuYmrsg3yKcyAGRH3jmXegyweAJ6KeepaPLbtFKl03N5uqsiObZG+oWAxzUJhkli2zHbF2bA=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c24a0993-4a23-468b-e5b6-08d6f9feeb73
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2019 06:24:19.2161 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xiyuan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2929
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6wgr7S3Y2U1tvdXaTS6ghO6d8eXAOj17AQRAEp/5pmA=;
 b=vNCTqnnP+j+bfTYjRg51jHqPhXKvglcn4DwcXHeq77FiqjKLk49F5j9vR730otH6ADpXQY0vFA30am6HLxTJ/a6vAqafuNoxxTYrO8OIjKvJIZOfTy/1eSV80RCfROg2LDtnCheJ0OcHo19QHvhVXg0rJk9ud5Rf9foVN97fkQs=
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
Cc: "Wang, Kevin\(Yang\)" <Kevin1.Wang@amd.com>, "Yuan,
 Xiaojie" <Xiaojie.Yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4NCi0tLQ0K
IGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFfMC5jIHwgMyArLS0NCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92MTFfMC5jDQppbmRleCBjM2Y0OGZhZTZmMzIuLjMzOWQw
NjNlMjRmZiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdV92
MTFfMC5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYw0K
QEAgLTI3Miw4ICsyNzIsNyBAQCBzdGF0aWMgaW50IHNtdV92MTFfMF9jaGVja19md192ZXJzaW9u
KHN0cnVjdCBzbXVfY29udGV4dCAqc211KQ0KIAkJCSJzbXUgZncgdmVyc2lvbiA9IDB4JTA4eCAo
JWQuJWQuJWQpXG4iLA0KIAkJCXNtdS0+c21jX2lmX3ZlcnNpb24sIGlmX3ZlcnNpb24sDQogCQkJ
c211X3ZlcnNpb24sIHNtdV9tYWpvciwgc211X21pbm9yLCBzbXVfZGVidWcpOw0KLQkJcHJfZXJy
KCJTTVUgZHJpdmVyIGlmIHZlcnNpb24gbm90IG1hdGNoZWRcbiIpOw0KLQkJcmV0ID0gLUVJTlZB
TDsNCisJCXByX3dhcm4oIlNNVSBkcml2ZXIgaWYgdmVyc2lvbiBub3QgbWF0Y2hlZFxuIik7DQog
CX0NCiANCiAJcmV0dXJuIHJldDsNCi0tIA0KMi4yMC4xDQoNCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeA==
