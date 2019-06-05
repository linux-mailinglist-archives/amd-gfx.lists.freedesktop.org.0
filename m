Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 686C1360CB
	for <lists+amd-gfx@lfdr.de>; Wed,  5 Jun 2019 18:06:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D387189CFA;
	Wed,  5 Jun 2019 16:06:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740081.outbound.protection.outlook.com [40.107.74.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D0F189CF6
 for <amd-gfx@lists.freedesktop.org>; Wed,  5 Jun 2019 16:06:50 +0000 (UTC)
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2561.namprd12.prod.outlook.com (52.132.27.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Wed, 5 Jun 2019 16:06:49 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b%5]) with mapi id 15.20.1943.018; Wed, 5 Jun 2019
 16:06:49 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 5/6] drm/amdkfd: Fix a circular lock dependency
Thread-Topic: [PATCH 5/6] drm/amdkfd: Fix a circular lock dependency
Thread-Index: AQHVG7iurkeotFUBUU6ez+X1kL2CbA==
Date: Wed, 5 Jun 2019 16:06:49 +0000
Message-ID: <1559750793-16608-5-git-send-email-Oak.Zeng@amd.com>
References: <1559750793-16608-1-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1559750793-16608-1-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTBPR01CA0006.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::19) To BL0PR12MB2580.namprd12.prod.outlook.com
 (2603:10b6:207:3e::19)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ae4be146-dcc1-4462-b070-08d6e9cfd0ac
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BL0PR12MB2561; 
x-ms-traffictypediagnostic: BL0PR12MB2561:
x-microsoft-antispam-prvs: <BL0PR12MB2561B730A6C555A5775D15CE80160@BL0PR12MB2561.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 00594E8DBA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(346002)(366004)(376002)(39860400002)(136003)(199004)(189003)(54906003)(66066001)(6116002)(8676002)(81156014)(81166006)(3846002)(8936002)(4326008)(50226002)(316002)(25786009)(6486002)(2906002)(476003)(36756003)(66446008)(64756008)(66476007)(73956011)(6916009)(71190400001)(71200400001)(66946007)(7736002)(6436002)(86362001)(2501003)(53936002)(102836004)(6506007)(5660300002)(386003)(305945005)(26005)(14454004)(68736007)(5640700003)(186003)(2351001)(76176011)(478600001)(99286004)(5024004)(2616005)(14444005)(486006)(72206003)(66556008)(11346002)(52116002)(256004)(446003)(6512007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2561;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: XGKRRMVdj391U1Tr84ABxxWNAue0TpXBBTL3foo+sLTuY5JM9XyyZ24adaOlO2Crvq0qtkx2yQqaqsjG2rIC0hyHTIxbHwgpAzCFoBDHTYQqvdbRjJWNwhYdgckZg0+quSZke/bYe0ozuvq9pDMs6PgWTyqEgqin6ggnSZvSdhHsGNOydYE+EKBcYnUs8krSHC4uIeIjA9RAvoMPq8btLlmjcyE8DaDxmuCcGX4+r4tKIdqT/6q5O5i3+Yc8jaL29IsfwcFxB1fXuGj1GU/25XH29ROqOj2hdu1TWwuy7iI08JPHk17E3PfxjyF20gscCxT/L4WAsX8g6qv3VTwW1tjggttAAGz9jnFsXp/6yl8WDn1MmSYKnOUnw11Pwf/X9LHb3Ggej3wrPq4AbERrsrzn3a0MZ6VimsDwsvtvgNk=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae4be146-dcc1-4462-b070-08d6e9cfd0ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2019 16:06:49.0522 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ozeng@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2561
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uugy59iRh3UoZtcs4ldNTWB85lPSTIrmMcxXy6KNS4U=;
 b=jDiCUJmvloDRLJT1aRz4vy4ZaGMw9WDmEntRDDRa/F1n9nKuQkmSx0Ap82HGgdp6nNz+wdETUOcBGDQYafw3eE1LruAGxVBrSgOSypWTCe+DQPHWPwwvy/wurVMaevPbmbqx4+c1Dr5g4Ev99y/KlJ+PGWrao40SMH0NrloktS0=
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
Cc: "Zhao, Yong" <Yong.Zhao@amd.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>, "Freehill, Chris" <Chris.Freehill@amd.com>,
 "Zeng, Oak" <Oak.Zeng@amd.com>, "Liu, Alex" <Alex.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlIGlkZWEgdG8gYnJlYWsgdGhlIGNpcmN1bGFyIGxvY2sgZGVwZW5kZW5jeSBpcyB0byBtb3Zl
IGFsbG9jYXRlX21xZA0Kb3V0IG9mIGRxbSBsb2NrIHByb3RlY3Rpb24uIFNlZSBjYWxsc3RhY2sg
IzEgYmVsb3cuDQoNClsgICA1OS41MTAxNDldIFtkcm1dIEluaXRpYWxpemVkIGFtZGdwdSAzLjMw
LjAgMjAxNTAxMDEgZm9yIDAwMDA6MDQ6MDAuMCBvbiBtaW5vciAwDQoNClsgIDUxMy42MDQwMzRd
ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0K
WyAgNTEzLjYwNDIwNV0gV0FSTklORzogcG9zc2libGUgY2lyY3VsYXIgbG9ja2luZyBkZXBlbmRl
bmN5IGRldGVjdGVkDQpbICA1MTMuNjA0Mzc1XSA0LjE4LjAta2ZkLXJvb3QgIzIgVGFpbnRlZDog
RyAgICAgICAgVw0KWyAgNTEzLjYwNDUzMF0gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpbICA1MTMuNjA0Njk5XSBrc3dhcGQwLzYxMSBpcyB0
cnlpbmcgdG8gYWNxdWlyZSBsb2NrOg0KWyAgNTEzLjYwNDg0MF0gMDAwMDAwMDBkMjU0MDIyZSAo
JmRxbS0+bG9ja19oaWRkZW4peysuKy59LCBhdDogZXZpY3RfcHJvY2Vzc19xdWV1ZXNfbm9jcHNj
aCsweDI2LzB4MTQwIFthbWRncHVdDQpbICA1MTMuNjA1MTUwXQ0KICAgICAgICAgICAgICAgYnV0
IHRhc2sgaXMgYWxyZWFkeSBob2xkaW5nIGxvY2s6DQpbICA1MTMuNjA1MzA3XSAwMDAwMDAwMDk2
MTU0N2ZjICgmYW5vbl92bWEtPnJ3c2VtKXsrKysrfSwgYXQ6IHBhZ2VfbG9ja19hbm9uX3ZtYV9y
ZWFkKzB4ZTQvMHgyNTANClsgIDUxMy42MDU1NDBdDQogICAgICAgICAgICAgICB3aGljaCBsb2Nr
IGFscmVhZHkgZGVwZW5kcyBvbiB0aGUgbmV3IGxvY2suDQoNClsgIDUxMy42MDU3NDddDQogICAg
ICAgICAgICAgICB0aGUgZXhpc3RpbmcgZGVwZW5kZW5jeSBjaGFpbiAoaW4gcmV2ZXJzZSBvcmRl
cikgaXM6DQpbICA1MTMuNjA1OTQ0XQ0KICAgICAgICAgICAgICAgLT4gIzQgKCZhbm9uX3ZtYS0+
cndzZW0peysrKyt9Og0KWyAgNTEzLjYwNjEwNl0gICAgICAgIF9fdm1hX2FkanVzdCsweDE0Ny8w
eDdmMA0KWyAgNTEzLjYwNjIzMV0gICAgICAgIF9fc3BsaXRfdm1hKzB4MTc5LzB4MTkwDQpbICA1
MTMuNjA2MzUzXSAgICAgICAgbXByb3RlY3RfZml4dXArMHgyMTcvMHgyNjANClsgIDUxMy42MDY1
NTNdICAgICAgICBkb19tcHJvdGVjdF9wa2V5KzB4MjExLzB4MzgwDQpbICA1MTMuNjA2NzUyXSAg
ICAgICAgX194NjRfc3lzX21wcm90ZWN0KzB4MWIvMHgyMA0KWyAgNTEzLjYwNjk1NF0gICAgICAg
IGRvX3N5c2NhbGxfNjQrMHg1MC8weDFhMA0KWyAgNTEzLjYwNzE0OV0gICAgICAgIGVudHJ5X1NZ
U0NBTExfNjRfYWZ0ZXJfaHdmcmFtZSsweDQ5LzB4YmUNClsgIDUxMy42MDczODBdDQogICAgICAg
ICAgICAgICAtPiAjMyAoJm1hcHBpbmctPmlfbW1hcF9yd3NlbSl7KysrK306DQpbICA1MTMuNjA3
Njc4XSAgICAgICAgcm1hcF93YWxrX2ZpbGUrMHgxZjAvMHgyODANClsgIDUxMy42MDc4ODddICAg
ICAgICBwYWdlX3JlZmVyZW5jZWQrMHhkZC8weDE4MA0KWyAgNTEzLjYwODA4MV0gICAgICAgIHNo
cmlua19wYWdlX2xpc3QrMHg4NTMvMHhjYjANClsgIDUxMy42MDgyNzldICAgICAgICBzaHJpbmtf
aW5hY3RpdmVfbGlzdCsweDMzYi8weDcwMA0KWyAgNTEzLjYwODQ4M10gICAgICAgIHNocmlua19u
b2RlX21lbWNnKzB4MzdhLzB4N2YwDQpbICA1MTMuNjA4NjgyXSAgICAgICAgc2hyaW5rX25vZGUr
MHhkOC8weDQ5MA0KWyAgNTEzLjYwODg2OV0gICAgICAgIGJhbGFuY2VfcGdkYXQrMHgxOGIvMHgz
YjANClsgIDUxMy42MDkwNjJdICAgICAgICBrc3dhcGQrMHgyMDMvMHg1YzANClsgIDUxMy42MDky
NDFdICAgICAgICBrdGhyZWFkKzB4MTAwLzB4MTQwDQpbICA1MTMuNjA5NDIwXSAgICAgICAgcmV0
X2Zyb21fZm9yaysweDI0LzB4MzANClsgIDUxMy42MDk2MDddDQogICAgICAgICAgICAgICAtPiAj
MiAoZnNfcmVjbGFpbSl7Ky4rLn06DQpbICA1MTMuNjA5ODgzXSAgICAgICAga21lbV9jYWNoZV9h
bGxvY190cmFjZSsweDM0LzB4MmUwDQpbICA1MTMuNjEwMDkzXSAgICAgICAgcmVzZXJ2YXRpb25f
b2JqZWN0X3Jlc2VydmVfc2hhcmVkKzB4MTM5LzB4MzAwDQpbICA1MTMuNjEwMzI2XSAgICAgICAg
dHRtX2JvX2luaXRfcmVzZXJ2ZWQrMHgyOTEvMHg0ODAgW3R0bV0NClsgIDUxMy42MTA1NjddICAg
ICAgICBhbWRncHVfYm9fZG9fY3JlYXRlKzB4MWQyLzB4NjUwIFthbWRncHVdDQpbICA1MTMuNjEw
ODExXSAgICAgICAgYW1kZ3B1X2JvX2NyZWF0ZSsweDQwLzB4MWYwIFthbWRncHVdDQpbICA1MTMu
NjExMDQxXSAgICAgICAgYW1kZ3B1X2JvX2NyZWF0ZV9yZXNlcnZlZCsweDI0OS8weDJkMCBbYW1k
Z3B1XQ0KWyAgNTEzLjYxMTI5MF0gICAgICAgIGFtZGdwdV9ib19jcmVhdGVfa2VybmVsKzB4MTIv
MHg3MCBbYW1kZ3B1XQ0KWyAgNTEzLjYxMTU4NF0gICAgICAgIGFtZGdwdV90dG1faW5pdCsweDJj
Yi8weDU2MCBbYW1kZ3B1XQ0KWyAgNTEzLjYxMTgyM10gICAgICAgIGdtY192OV8wX3N3X2luaXQr
MHg0MDAvMHg3NTAgW2FtZGdwdV0NClsgIDUxMy42MTI0OTFdICAgICAgICBhbWRncHVfZGV2aWNl
X2luaXQrMHgxNGViLzB4MTk5MCBbYW1kZ3B1XQ0KWyAgNTEzLjYxMjczMF0gICAgICAgIGFtZGdw
dV9kcml2ZXJfbG9hZF9rbXMrMHg3OC8weDI5MCBbYW1kZ3B1XQ0KWyAgNTEzLjYxMjk1OF0gICAg
ICAgIGRybV9kZXZfcmVnaXN0ZXIrMHgxMTEvMHgxYTANClsgIDUxMy42MTMxNzFdICAgICAgICBh
bWRncHVfcGNpX3Byb2JlKzB4MTFjLzB4MWUwIFthbWRncHVdDQpbICA1MTMuNjEzMzg5XSAgICAg
ICAgbG9jYWxfcGNpX3Byb2JlKzB4M2YvMHg5MA0KWyAgNTEzLjYxMzU4MV0gICAgICAgIHBjaV9k
ZXZpY2VfcHJvYmUrMHgxMDIvMHgxYzANClsgIDUxMy42MTM3NzldICAgICAgICBkcml2ZXJfcHJv
YmVfZGV2aWNlKzB4MmE3LzB4NDgwDQpbICA1MTMuNjEzOTg0XSAgICAgICAgX19kcml2ZXJfYXR0
YWNoKzB4MTBhLzB4MTEwDQpbICA1MTMuNjE0MTc5XSAgICAgICAgYnVzX2Zvcl9lYWNoX2Rldisw
eDY3LzB4YzANClsgIDUxMy42MTQzNzJdICAgICAgICBidXNfYWRkX2RyaXZlcisweDFlYi8weDI2
MA0KWyAgNTEzLjYxNDU2NV0gICAgICAgIGRyaXZlcl9yZWdpc3RlcisweDViLzB4ZTANClsgIDUx
My42MTQ3NTZdICAgICAgICBkb19vbmVfaW5pdGNhbGwrMHhhYy8weDM1Nw0KWyAgNTEzLjYxNDk1
Ml0gICAgICAgIGRvX2luaXRfbW9kdWxlKzB4NWIvMHgyMTMNClsgIDUxMy42MTUxNDVdICAgICAg
ICBsb2FkX21vZHVsZSsweDI1NDIvMHgyZDMwDQpbICA1MTMuNjE1MzM3XSAgICAgICAgX19kb19z
eXNfZmluaXRfbW9kdWxlKzB4ZDIvMHgxMDANClsgIDUxMy42MTU1NDFdICAgICAgICBkb19zeXNj
YWxsXzY0KzB4NTAvMHgxYTANClsgIDUxMy42MTU3MzFdICAgICAgICBlbnRyeV9TWVNDQUxMXzY0
X2FmdGVyX2h3ZnJhbWUrMHg0OS8weGJlDQpbICA1MTMuNjE1OTYzXQ0KICAgICAgICAgICAgICAg
LT4gIzEgKHJlc2VydmF0aW9uX3d3X2NsYXNzX211dGV4KXsrLisufToNClsgIDUxMy42MTYyOTNd
ICAgICAgICBhbWRncHVfYW1ka2ZkX2FsbG9jX2d0dF9tZW0rMHhjZi8weDJjMCBbYW1kZ3B1XQ0K
WyAgNTEzLjYxNjU1NF0gICAgICAgIGluaXRfbXFkKzB4MjIzLzB4MjYwIFthbWRncHVdDQpbICA1
MTMuNjE2Nzc5XSAgICAgICAgY3JlYXRlX3F1ZXVlX25vY3BzY2grMHg0ZDkvMHg2MDAgW2FtZGdw
dV0NClsgIDUxMy42MTcwMzFdICAgICAgICBwcW1fY3JlYXRlX3F1ZXVlKzB4MzdjLzB4NTIwIFth
bWRncHVdDQpbICA1MTMuNjE3MjcwXSAgICAgICAga2ZkX2lvY3RsX2NyZWF0ZV9xdWV1ZSsweDJm
OS8weDY1MCBbYW1kZ3B1XQ0KWyAgNTEzLjYxNzUyMl0gICAgICAgIGtmZF9pb2N0bCsweDIwMi8w
eDM1MCBbYW1kZ3B1XQ0KWyAgNTEzLjYxNzcyNF0gICAgICAgIGRvX3Zmc19pb2N0bCsweDlmLzB4
NmMwDQpbICA1MTMuNjE3OTE0XSAgICAgICAga3N5c19pb2N0bCsweDY2LzB4NzANClsgIDUxMy42
MTgwOTVdICAgICAgICBfX3g2NF9zeXNfaW9jdGwrMHgxNi8weDIwDQpbICA1MTMuNjE4Mjg2XSAg
ICAgICAgZG9fc3lzY2FsbF82NCsweDUwLzB4MWEwDQpbICA1MTMuNjE4NDc2XSAgICAgICAgZW50
cnlfU1lTQ0FMTF82NF9hZnRlcl9od2ZyYW1lKzB4NDkvMHhiZQ0KWyAgNTEzLjYxODY5NV0NCiAg
ICAgICAgICAgICAgIC0+ICMwICgmZHFtLT5sb2NrX2hpZGRlbil7Ky4rLn06DQpbICA1MTMuNjE4
OTg0XSAgICAgICAgX19tdXRleF9sb2NrKzB4OTgvMHg5NzANClsgIDUxMy42MTkxOTddICAgICAg
ICBldmljdF9wcm9jZXNzX3F1ZXVlc19ub2Nwc2NoKzB4MjYvMHgxNDAgW2FtZGdwdV0NClsgIDUx
My42MTk0NTldICAgICAgICBrZmRfcHJvY2Vzc19ldmljdF9xdWV1ZXMrMHgzYi8weGIwIFthbWRn
cHVdDQpbICA1MTMuNjE5NzEwXSAgICAgICAga2dkMmtmZF9xdWllc2NlX21tKzB4MWMvMHg0MCBb
YW1kZ3B1XQ0KWyAgNTEzLjYyMDEwM10gICAgICAgIGFtZGdwdV9hbWRrZmRfZXZpY3RfdXNlcnB0
cisweDM4LzB4NzAgW2FtZGdwdV0NClsgIDUxMy42MjAzNjNdICAgICAgICBhbWRncHVfbW5faW52
YWxpZGF0ZV9yYW5nZV9zdGFydF9oc2ErMHhhNi8weGMwIFthbWRncHVdDQpbICA1MTMuNjIwNjE0
XSAgICAgICAgX19tbXVfbm90aWZpZXJfaW52YWxpZGF0ZV9yYW5nZV9zdGFydCsweDcwLzB4YjAN
ClsgIDUxMy42MjA4NTFdICAgICAgICB0cnlfdG9fdW5tYXBfb25lKzB4N2ZjLzB4OGYwDQpbICA1
MTMuNjIxMDQ5XSAgICAgICAgcm1hcF93YWxrX2Fub24rMHgxMjEvMHgyOTANClsgIDUxMy42MjEy
NDJdICAgICAgICB0cnlfdG9fdW5tYXArMHg5My8weGYwDQpbICA1MTMuNjIxNDI4XSAgICAgICAg
c2hyaW5rX3BhZ2VfbGlzdCsweDYwNi8weGNiMA0KWyAgNTEzLjYyMTYyNV0gICAgICAgIHNocmlu
a19pbmFjdGl2ZV9saXN0KzB4MzNiLzB4NzAwDQpbICA1MTMuNjIxODM1XSAgICAgICAgc2hyaW5r
X25vZGVfbWVtY2crMHgzN2EvMHg3ZjANClsgIDUxMy42MjIwMzRdICAgICAgICBzaHJpbmtfbm9k
ZSsweGQ4LzB4NDkwDQpbICA1MTMuNjIyMjE5XSAgICAgICAgYmFsYW5jZV9wZ2RhdCsweDE4Yi8w
eDNiMA0KWyAgNTEzLjYyMjQxMF0gICAgICAgIGtzd2FwZCsweDIwMy8weDVjMA0KWyAgNTEzLjYy
MjU4OV0gICAgICAgIGt0aHJlYWQrMHgxMDAvMHgxNDANClsgIDUxMy42MjI3NjldICAgICAgICBy
ZXRfZnJvbV9mb3JrKzB4MjQvMHgzMA0KWyAgNTEzLjYyMjk1N10NCiAgICAgICAgICAgICAgIG90
aGVyIGluZm8gdGhhdCBtaWdodCBoZWxwIHVzIGRlYnVnIHRoaXM6DQoNClsgIDUxMy42MjMzNTRd
IENoYWluIGV4aXN0cyBvZjoNCiAgICAgICAgICAgICAgICAgJmRxbS0+bG9ja19oaWRkZW4gLS0+
ICZtYXBwaW5nLT5pX21tYXBfcndzZW0gLS0+ICZhbm9uX3ZtYS0+cndzZW0NCg0KWyAgNTEzLjYy
MzkwMF0gIFBvc3NpYmxlIHVuc2FmZSBsb2NraW5nIHNjZW5hcmlvOg0KDQpbICA1MTMuNjI0MTg5
XSAgICAgICAgQ1BVMCAgICAgICAgICAgICAgICAgICAgQ1BVMQ0KWyAgNTEzLjYyNDM5N10gICAg
ICAgIC0tLS0gICAgICAgICAgICAgICAgICAgIC0tLS0NClsgIDUxMy42MjQ1OTRdICAgbG9jaygm
YW5vbl92bWEtPnJ3c2VtKTsNClsgIDUxMy42MjQ3NzFdICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBsb2NrKCZtYXBwaW5nLT5pX21tYXBfcndzZW0pOw0KWyAgNTEzLjYyNTAyMF0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxvY2soJmFub25fdm1hLT5yd3NlbSk7DQpbICA1
MTMuNjI1MjUzXSAgIGxvY2soJmRxbS0+bG9ja19oaWRkZW4pOw0KWyAgNTEzLjYyNTQzM10NCiAg
ICAgICAgICAgICAgICAqKiogREVBRExPQ0sgKioqDQoNClsgIDUxMy42MjU3ODNdIDMgbG9ja3Mg
aGVsZCBieSBrc3dhcGQwLzYxMToNClsgIDUxMy42MjU5NjddICAjMDogMDAwMDAwMDBmMTRlZGY4
NCAoZnNfcmVjbGFpbSl7Ky4rLn0sIGF0OiBfX2ZzX3JlY2xhaW1fYWNxdWlyZSsweDUvMHgzMA0K
WyAgNTEzLjYyNjMwOV0gICMxOiAwMDAwMDAwMDk2MTU0N2ZjICgmYW5vbl92bWEtPnJ3c2VtKXsr
KysrfSwgYXQ6IHBhZ2VfbG9ja19hbm9uX3ZtYV9yZWFkKzB4ZTQvMHgyNTANClsgIDUxMy42MjY2
NzFdICAjMjogMDAwMDAwMDA2N2I1Y2QxMiAoc3JjdSl7Li4uLn0sIGF0OiBfX21tdV9ub3RpZmll
cl9pbnZhbGlkYXRlX3JhbmdlX3N0YXJ0KzB4NS8weGIwDQpbICA1MTMuNjI3MDM3XQ0KICAgICAg
ICAgICAgICAgc3RhY2sgYmFja3RyYWNlOg0KWyAgNTEzLjYyNzI5Ml0gQ1BVOiAwIFBJRDogNjEx
IENvbW06IGtzd2FwZDAgVGFpbnRlZDogRyAgICAgICAgVyAgICAgICAgIDQuMTguMC1rZmQtcm9v
dCAjMg0KWyAgNTEzLjYyNzYzMl0gSGFyZHdhcmUgbmFtZTogaW5ub3RlayBHbWJIIFZpcnR1YWxC
b3gvVmlydHVhbEJveCwgQklPUyBWaXJ0dWFsQm94IDEyLzAxLzIwMDYNClsgIDUxMy42Mjc5OTBd
IENhbGwgVHJhY2U6DQpbICA1MTMuNjI4MTQzXSAgZHVtcF9zdGFjaysweDdjLzB4YmINClsgIDUx
My42MjgzMTVdICBwcmludF9jaXJjdWxhcl9idWcuaXNyYS4zNysweDIxYi8weDIyOA0KWyAgNTEz
LjYyODU4MV0gIF9fbG9ja19hY3F1aXJlKzB4ZjdkLzB4MTQ3MA0KWyAgNTEzLjYyODc4Ml0gID8g
dW53aW5kX25leHRfZnJhbWUrMHg2Yy8weDRmMA0KWyAgNTEzLjYyODk3NF0gID8gbG9ja19hY3F1
aXJlKzB4ZWMvMHgxZTANClsgIDUxMy42MjkxNTRdICBsb2NrX2FjcXVpcmUrMHhlYy8weDFlMA0K
WyAgNTEzLjYyOTM1N10gID8gZXZpY3RfcHJvY2Vzc19xdWV1ZXNfbm9jcHNjaCsweDI2LzB4MTQw
IFthbWRncHVdDQpbICA1MTMuNjI5NTg3XSAgX19tdXRleF9sb2NrKzB4OTgvMHg5NzANClsgIDUx
My42Mjk3OTBdICA/IGV2aWN0X3Byb2Nlc3NfcXVldWVzX25vY3BzY2grMHgyNi8weDE0MCBbYW1k
Z3B1XQ0KWyAgNTEzLjYzMDA0N10gID8gZXZpY3RfcHJvY2Vzc19xdWV1ZXNfbm9jcHNjaCsweDI2
LzB4MTQwIFthbWRncHVdDQpbICA1MTMuNjMwMzA5XSAgPyBldmljdF9wcm9jZXNzX3F1ZXVlc19u
b2Nwc2NoKzB4MjYvMHgxNDAgW2FtZGdwdV0NClsgIDUxMy42MzA1NjJdICBldmljdF9wcm9jZXNz
X3F1ZXVlc19ub2Nwc2NoKzB4MjYvMHgxNDAgW2FtZGdwdV0NClsgIDUxMy42MzA4MTZdICBrZmRf
cHJvY2Vzc19ldmljdF9xdWV1ZXMrMHgzYi8weGIwIFthbWRncHVdDQpbICA1MTMuNjMxMDU3XSAg
a2dkMmtmZF9xdWllc2NlX21tKzB4MWMvMHg0MCBbYW1kZ3B1XQ0KWyAgNTEzLjYzMTI4OF0gIGFt
ZGdwdV9hbWRrZmRfZXZpY3RfdXNlcnB0cisweDM4LzB4NzAgW2FtZGdwdV0NClsgIDUxMy42MzE1
MzZdICBhbWRncHVfbW5faW52YWxpZGF0ZV9yYW5nZV9zdGFydF9oc2ErMHhhNi8weGMwIFthbWRn
cHVdDQpbICA1MTMuNjMyMDc2XSAgX19tbXVfbm90aWZpZXJfaW52YWxpZGF0ZV9yYW5nZV9zdGFy
dCsweDcwLzB4YjANClsgIDUxMy42MzIyOTldICB0cnlfdG9fdW5tYXBfb25lKzB4N2ZjLzB4OGYw
DQpbICA1MTMuNjMyNDg3XSAgPyBwYWdlX2xvY2tfYW5vbl92bWFfcmVhZCsweDY4LzB4MjUwDQpb
ICA1MTMuNjMyNjkwXSAgcm1hcF93YWxrX2Fub24rMHgxMjEvMHgyOTANClsgIDUxMy42MzI4NzVd
ICB0cnlfdG9fdW5tYXArMHg5My8weGYwDQpbICA1MTMuNjMzMDUwXSAgPyBwYWdlX3JlbW92ZV9y
bWFwKzB4MzMwLzB4MzMwDQpbICA1MTMuNjMzMjM5XSAgPyByY3VfcmVhZF91bmxvY2srMHg2MC8w
eDYwDQpbICA1MTMuNjMzNDIyXSAgPyBwYWdlX2dldF9hbm9uX3ZtYSsweDE2MC8weDE2MA0KWyAg
NTEzLjYzMzYxM10gIHNocmlua19wYWdlX2xpc3QrMHg2MDYvMHhjYjANClsgIDUxMy42MzM4MDBd
ICBzaHJpbmtfaW5hY3RpdmVfbGlzdCsweDMzYi8weDcwMA0KWyAgNTEzLjYzMzk5N10gIHNocmlu
a19ub2RlX21lbWNnKzB4MzdhLzB4N2YwDQpbICA1MTMuNjM0MTg2XSAgPyBzaHJpbmtfbm9kZSsw
eGQ4LzB4NDkwDQpbICA1MTMuNjM0MzYzXSAgc2hyaW5rX25vZGUrMHhkOC8weDQ5MA0KWyAgNTEz
LjYzNDUzN10gIGJhbGFuY2VfcGdkYXQrMHgxOGIvMHgzYjANClsgIDUxMy42MzQ3MThdICBrc3dh
cGQrMHgyMDMvMHg1YzANClsgIDUxMy42MzQ4ODddICA/IHdhaXRfd29rZW4rMHhiMC8weGIwDQpb
ICA1MTMuNjM1MDYyXSAga3RocmVhZCsweDEwMC8weDE0MA0KWyAgNTEzLjYzNTIzMV0gID8gYmFs
YW5jZV9wZ2RhdCsweDNiMC8weDNiMA0KWyAgNTEzLjYzNTQxNF0gID8ga3RocmVhZF9kZWxheWVk
X3dvcmtfdGltZXJfZm4rMHg4MC8weDgwDQpbICA1MTMuNjM1NjI2XSAgcmV0X2Zyb21fZm9yaysw
eDI0LzB4MzANClsgIDUxMy42MzYwNDJdIEV2aWN0aW5nIFBBU0lEIDMyNzY4IHF1ZXVlcw0KWyAg
NTEzLjkzNjIzNl0gUmVzdG9yaW5nIFBBU0lEIDMyNzY4IHF1ZXVlcw0KWyAgNTI0LjcwODkxMl0g
RXZpY3RpbmcgUEFTSUQgMzI3NjggcXVldWVzDQpbICA1MjQuOTk5ODc1XSBSZXN0b3JpbmcgUEFT
SUQgMzI3NjggcXVldWVzDQoNCkNoYW5nZS1JZDogSTMzNGM4YzkzMjliZTEyZTQ2OGVhN2FhYmM4
Nzg4NDJlYzAwM2JkOGUNClNpZ25lZC1vZmYtYnk6IE9hayBaZW5nIDxPYWsuWmVuZ0BhbWQuY29t
Pg0KLS0tDQogLi4uL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIu
YyAgIHwgMjEgKysrKysrKysrKystLS0tLS0tLS0tDQogMSBmaWxlIGNoYW5nZWQsIDExIGluc2Vy
dGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIuYw0KaW5kZXggNzg3YjViZS4uNmIx
YTJlZSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2Vf
cXVldWVfbWFuYWdlci5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2
aWNlX3F1ZXVlX21hbmFnZXIuYw0KQEAgLTI3NCw2ICsyNzQsMTIgQEAgc3RhdGljIGludCBjcmVh
dGVfcXVldWVfbm9jcHNjaChzdHJ1Y3QgZGV2aWNlX3F1ZXVlX21hbmFnZXIgKmRxbSwNCiANCiAJ
cHJpbnRfcXVldWUocSk7DQogDQorCW1xZF9tZ3IgPSBkcW0tPm1xZF9tZ3JzW2dldF9tcWRfdHlw
ZV9mcm9tX3F1ZXVlX3R5cGUoDQorCQkJcS0+cHJvcGVydGllcy50eXBlKV07DQorCXEtPm1xZF9t
ZW1fb2JqID0gbXFkX21nci0+YWxsb2NhdGVfbXFkKG1xZF9tZ3ItPmRldiwgJnEtPnByb3BlcnRp
ZXMpOw0KKwlpZiAoIXEtPm1xZF9tZW1fb2JqKQ0KKwkJcmV0dXJuIC1FTk9NRU07DQorDQogCWRx
bV9sb2NrKGRxbSk7DQogDQogCWlmIChkcW0tPnRvdGFsX3F1ZXVlX2NvdW50ID49IG1heF9udW1f
b2ZfcXVldWVzX3Blcl9kZXZpY2UpIHsNCkBAIC0yOTksOCArMzA1LDYgQEAgc3RhdGljIGludCBj
cmVhdGVfcXVldWVfbm9jcHNjaChzdHJ1Y3QgZGV2aWNlX3F1ZXVlX21hbmFnZXIgKmRxbSwNCiAJ
cS0+cHJvcGVydGllcy50YmFfYWRkciA9IHFwZC0+dGJhX2FkZHI7DQogCXEtPnByb3BlcnRpZXMu
dG1hX2FkZHIgPSBxcGQtPnRtYV9hZGRyOw0KIA0KLQltcWRfbWdyID0gZHFtLT5tcWRfbWdyc1tn
ZXRfbXFkX3R5cGVfZnJvbV9xdWV1ZV90eXBlKA0KLQkJCXEtPnByb3BlcnRpZXMudHlwZSldOw0K
IAlpZiAocS0+cHJvcGVydGllcy50eXBlID09IEtGRF9RVUVVRV9UWVBFX0NPTVBVVEUpIHsNCiAJ
CXJldHZhbCA9IGFsbG9jYXRlX2hxZChkcW0sIHEpOw0KIAkJaWYgKHJldHZhbCkNCkBAIC0zMTks
MTMgKzMyMywxMCBAQCBzdGF0aWMgaW50IGNyZWF0ZV9xdWV1ZV9ub2Nwc2NoKHN0cnVjdCBkZXZp
Y2VfcXVldWVfbWFuYWdlciAqZHFtLA0KIAlpZiAocmV0dmFsKQ0KIAkJZ290byBvdXRfZGVhbGxv
Y2F0ZV9ocWQ7DQogDQotCXEtPm1xZF9tZW1fb2JqID0gbXFkX21nci0+YWxsb2NhdGVfbXFkKG1x
ZF9tZ3ItPmRldiwgJnEtPnByb3BlcnRpZXMpOw0KLQlpZiAoIXEtPm1xZF9tZW1fb2JqKQ0KLQkJ
Z290byBvdXRfZGVhbGxvY2F0ZV9kb29yYmVsbDsNCiAJcmV0dmFsID0gbXFkX21nci0+aW5pdF9t
cWQobXFkX21nciwgJnEtPm1xZCwgcS0+bXFkX21lbV9vYmosDQogCQkJCSZxLT5nYXJ0X21xZF9h
ZGRyLCAmcS0+cHJvcGVydGllcyk7DQogCWlmIChyZXR2YWwpDQotCQlnb3RvIG91dF91bmluaXRf
bXFkOw0KKwkJZ290byBvdXRfZGVhbGxvY2F0ZV9kb29yYmVsbDsNCiANCiAJaWYgKHEtPnByb3Bl
cnRpZXMuaXNfYWN0aXZlKSB7DQogDQpAQCAtMzM2LDcgKzMzNyw3IEBAIHN0YXRpYyBpbnQgY3Jl
YXRlX3F1ZXVlX25vY3BzY2goc3RydWN0IGRldmljZV9xdWV1ZV9tYW5hZ2VyICpkcW0sDQogCQkJ
cmV0dmFsID0gbXFkX21nci0+bG9hZF9tcWQobXFkX21nciwgcS0+bXFkLCBxLT5waXBlLA0KIAkJ
CQkJcS0+cXVldWUsICZxLT5wcm9wZXJ0aWVzLCBjdXJyZW50LT5tbSk7DQogCQlpZiAocmV0dmFs
KQ0KLQkJCWdvdG8gb3V0X3VuaW5pdF9tcWQ7DQorCQkJZ290byBvdXRfZGVhbGxvY2F0ZV9kb29y
YmVsbDsNCiAJfQ0KIA0KIAlsaXN0X2FkZCgmcS0+bGlzdCwgJnFwZC0+cXVldWVzX2xpc3QpOw0K
QEAgLTM1NiwxMCArMzU3LDkgQEAgc3RhdGljIGludCBjcmVhdGVfcXVldWVfbm9jcHNjaChzdHJ1
Y3QgZGV2aWNlX3F1ZXVlX21hbmFnZXIgKmRxbSwNCiAJZHFtLT50b3RhbF9xdWV1ZV9jb3VudCsr
Ow0KIAlwcl9kZWJ1ZygiVG90YWwgb2YgJWQgcXVldWVzIGFyZSBhY2NvdW50YWJsZSBzbyBmYXJc
biIsDQogCQkJZHFtLT50b3RhbF9xdWV1ZV9jb3VudCk7DQotCWdvdG8gb3V0X3VubG9jazsNCisJ
ZHFtX3VubG9jayhkcW0pOw0KKwlyZXR1cm4gcmV0dmFsOw0KIA0KLW91dF91bmluaXRfbXFkOg0K
LQltcWRfbWdyLT51bmluaXRfbXFkKG1xZF9tZ3IsIHEtPm1xZCwgcS0+bXFkX21lbV9vYmopOw0K
IG91dF9kZWFsbG9jYXRlX2Rvb3JiZWxsOg0KIAlkZWFsbG9jYXRlX2Rvb3JiZWxsKHFwZCwgcSk7
DQogb3V0X2RlYWxsb2NhdGVfaHFkOg0KQEAgLTM3Myw2ICszNzMsNyBAQCBzdGF0aWMgaW50IGNy
ZWF0ZV9xdWV1ZV9ub2Nwc2NoKHN0cnVjdCBkZXZpY2VfcXVldWVfbWFuYWdlciAqZHFtLA0KIAkJ
ZGVhbGxvY2F0ZV92bWlkKGRxbSwgcXBkLCBxKTsNCiBvdXRfdW5sb2NrOg0KIAlkcW1fdW5sb2Nr
KGRxbSk7DQorCW1xZF9tZ3ItPnVuaW5pdF9tcWQobXFkX21nciwgcS0+bXFkLCBxLT5tcWRfbWVt
X29iaik7DQogCXJldHVybiByZXR2YWw7DQogfQ0KIA0KLS0gDQoyLjcuNA0KDQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
