Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7F25D6BA
	for <lists+amd-gfx@lfdr.de>; Tue,  2 Jul 2019 21:16:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1E856E036;
	Tue,  2 Jul 2019 19:16:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680073.outbound.protection.outlook.com [40.107.68.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D94D6E036
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jul 2019 19:16:46 +0000 (UTC)
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB4026.namprd12.prod.outlook.com (10.255.175.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.18; Tue, 2 Jul 2019 19:16:45 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::91a2:f9e7:8c86:f927%7]) with mapi id 15.20.2032.019; Tue, 2 Jul 2019
 19:16:45 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/amdgpu: Use FENCE_OWNER_KFD in process_sync_pds_resv
Thread-Topic: [PATCH 1/2] drm/amdgpu: Use FENCE_OWNER_KFD in
 process_sync_pds_resv
Thread-Index: AQHVMQqvv6tRIaP3PkeScrNc4OVNrA==
Date: Tue, 2 Jul 2019 19:16:44 +0000
Message-ID: <20190702191622.3176-1-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-mailer: git-send-email 2.17.1
x-clientproxiedby: YT1PR01CA0025.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::38)
 To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 15a132d3-83ce-4980-df46-08d6ff21d23b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR12MB4026; 
x-ms-traffictypediagnostic: DM6PR12MB4026:
x-microsoft-antispam-prvs: <DM6PR12MB40264FB0A93840BFF598F1AD92F80@DM6PR12MB4026.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 008663486A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(39860400002)(136003)(376002)(346002)(199004)(189003)(66446008)(2351001)(4326008)(102836004)(66556008)(86362001)(66476007)(5660300002)(26005)(81156014)(3846002)(50226002)(305945005)(5640700003)(8676002)(256004)(4744005)(6506007)(71190400001)(73956011)(2616005)(486006)(81166006)(8936002)(7736002)(68736007)(1076003)(386003)(2906002)(14444005)(66946007)(71200400001)(6116002)(476003)(64756008)(6512007)(99286004)(316002)(14454004)(36756003)(25786009)(6436002)(66066001)(72206003)(6486002)(186003)(478600001)(2501003)(53936002)(6916009)(52116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB4026;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: L39bQGKS+pw6HDoepyGdSaHB8U8AmfDzvZmH3ermTBltVdg+6wF2K4b2w7kD+UV/2T2tq+o1b+UdTaEnqML46XPsd3lPL/8bLv9JC83AMXxPiCcIQfZP3xvebeMU0CXwjCm2pi76ML4g2nKuJ1H8BNgMHwmjxWOuivM5pq2QcnT//9+pKO/4vscHnsN3CHSYqaKSQaKIqSt/WSvMY5uZN/07dGhe+3nQwn8C0+7cLiHkgy55wAvuCdEj9pGiKwgarnS1THZA0yDLYApJ8+NdVwox08nXRtlv8MVSyElzfeyLw40ypvXLgF0bZkH2Q9end5prM3Mp8JJG9KSgH9ATL6+yXW/fKRiJtrdQrSrDRAtRg/iR3BPhDv8VYRkWfORiDKM8lNWmd6+EbUj90MY86pK929HRq3BtIdTHOxrUjcY=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15a132d3-83ce-4980-df46-08d6ff21d23b
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2019 19:16:44.8824 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4026
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PrlF6lubleUXWinKFuOhu6GDA3FOkm119qQY8/eMpF0=;
 b=rPbdGcdKvNcQHuA6K9S37LI+cZLdltS9P/tM1lTX1EohZCFR8eT/I43rTbfQGLLry8oNSHaUNm/pEq3jqTbeBbQT0pDN5PQkKb8TMKEeAxmVo8cDm+PcqCVlOatNSyfOFoZVJ4cby5hOiVpOp+IL/aYqz3Wr8mYX+MFjF6Id2ow=
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

V2UgZG9uJ3Qgd2FudCBldmljdGlvbiBmZW5jZXMgdG8gdHJpZ2dlciB3aGVuIHdhaXRpbmcgZm9y
IHBhZ2UgdGFibGUKdXBkYXRlcyB0byBjb21wbGV0ZSBkdXJpbmcgcmVzdG9yZS4gSW4gdGhlb3J5
IHRoZXJlIHNob3VsZG4ndCBiZSBhbnkKdW5zaWduYWxlZCBldmljdGlvbiBmZW5jZXMgaW4gdGhl
IFBEIHJlc2VydmF0aW9uIG9iamVjdCwgYnV0IEknbQpzZWVpbmcgdGhlbSBpbiBpbnN0cnVtZW50
ZWQgY29kZSBmb3IgcmVhc29ucyBub3QgZnVsbHkgdW5kZXJzdG9vZC4KClNpZ25lZC1vZmYtYnk6
IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPgpSZXZpZXdlZC1ieTogUGhp
bGlwIFlhbmcgPFBoaWxpcC5ZYW5nQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jCmluZGV4IDEwYWJhZTM5OGU1MS4uODY3YWY2NmMyMTI2
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dw
dXZtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2
bS5jCkBAIC04MTIsNyArODEyLDcgQEAgc3RhdGljIGludCBwcm9jZXNzX3N5bmNfcGRzX3Jlc3Yo
c3RydWN0IGFtZGtmZF9wcm9jZXNzX2luZm8gKnByb2Nlc3NfaW5mbywKIAogCQlyZXQgPSBhbWRn
cHVfc3luY19yZXN2KE5VTEwsCiAJCQkJCXN5bmMsIHBkLT50Ym8ucmVzdiwKLQkJCQkJQU1ER1BV
X0ZFTkNFX09XTkVSX1VOREVGSU5FRCwgZmFsc2UpOworCQkJCQlBTURHUFVfRkVOQ0VfT1dORVJf
S0ZELCBmYWxzZSk7CiAJCWlmIChyZXQpCiAJCQlyZXR1cm4gcmV0OwogCX0KLS0gCjIuMTcuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
