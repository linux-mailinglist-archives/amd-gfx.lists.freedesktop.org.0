Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D29D6984FE
	for <lists+amd-gfx@lfdr.de>; Wed, 21 Aug 2019 22:02:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD5D16E9F7;
	Wed, 21 Aug 2019 20:02:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-cys01nam02on060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe45::60b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 424AE6E9F1;
 Wed, 21 Aug 2019 20:02:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ivvmkhg/D1Yqn0IlCrnea0KabpUdpHrk+DXxJzogkKQ5FizBmXLLPxP2gpTTZT/dPDFJ64G6N5H0tBWDZz9UaM7uyF7BYOW9oENfgniJPwRo7hBUm58eRlXT+LSCUVskSsleqOzkEtelMdlsLm/0eXf62yrieKVayQaxMcWSCp7gEO2cfWvn+GcYMgOtoDuUxZhd/NYgST+kiPvWwBKm3031QV7ErKLly86eSx2mEZB1MKO2xWDz1gAONMSdAcpzTso85DQvWq5dbqmdnIsfdtIbjuUaY7+/BuIXPql4r9/idlGJl2XpyHdNz2NmLmEljaSopspqIDIDUVv/8mX+Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7jCTuqg753zcG2DWqF+rNOfZS/xoldEwEFDIOrkqB8s=;
 b=DokeGWYFBTv2taAOucH5pNyaXa1tL7+Gkck3R33yzs1Y06tByECap55+bjreadlUkYaxF1PoZpIrV1NOxNPgE1FO0h6oOAiq+2AmZIxvjPhdJxs8yupJqxt19JZzPaJu2+F/K7/WO8+c59mLTogGmgBqrQB0ql4Qayk9NtI554NVmz5r7Je25usU2PSQL/VmMhCL4YrhsqmE7ceU2XB7w2fatbOh/dtdxe/+6Gi66N6cDpBh900NbKm9hv4bcKdoFtSdS+UnxUk5Ci0zJvHt6alr+pBYfJviD/fbotO3Vy3iyG9xKWAPUMI2U9bFhFaiRpjsuw+Hmj6ahxD8FtoXxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN4PR12CA0009.namprd12.prod.outlook.com (10.164.241.19) by
 BN6PR12MB1267.namprd12.prod.outlook.com (10.168.224.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Wed, 21 Aug 2019 20:02:06 +0000
Received: from CO1NAM03FT063.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::208) by BN4PR12CA0009.outlook.office365.com
 (2603:10b6:403:2::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Wed, 21 Aug 2019 20:02:06 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT063.mail.protection.outlook.com (10.152.81.61) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Wed, 21 Aug 2019 20:02:04 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1;
 Wed, 21 Aug 2019 15:01:42 -0500
From: David Francis <David.Francis@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v3 12/16] drm/dp-mst: Add helpers for querying and enabling
 MST DSC
Date: Wed, 21 Aug 2019 16:01:25 -0400
Message-ID: <20190821200129.11575-13-David.Francis@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190821200129.11575-1-David.Francis@amd.com>
References: <20190821200129.11575-1-David.Francis@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(136003)(396003)(346002)(2980300002)(428003)(189003)(199004)(81156014)(70206006)(50226002)(6666004)(356004)(54906003)(110136005)(476003)(5024004)(14444005)(478600001)(36756003)(70586007)(5660300002)(486006)(86362001)(126002)(11346002)(446003)(316002)(53936002)(2616005)(16586007)(186003)(8936002)(51416003)(49486002)(50466002)(426003)(8676002)(305945005)(4326008)(2906002)(1076003)(48376002)(26005)(81166006)(76176011)(336012)(47776003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1267; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4148f11e-a464-4822-cb4d-08d726727076
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:BN6PR12MB1267; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1267:
X-Microsoft-Antispam-PRVS: <BN6PR12MB126706DA164C5C448C12B2F6EFAA0@BN6PR12MB1267.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0136C1DDA4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: uakFFQofUXVwPv50pku880OTjffwMVHeiQh9BtucPekHXkvDtnJoIUHryCCBgv/+xsx41T7RL7rWPjvgL6SQLj8/f7NsEirHMUQZWJXhDBIm6XIsrm2648N959e2R2tzcm9d38gtRQ6tgXOEqtum9kFPC4SxwMuOe7xaeAG+szJiLRKL0Qase6VKJmK5RprwHCCU+S+wyLWdNmXMT4K46bM+HMOwQHP75TR5b1ICfn51H7f7YUmVUV7HPPuw1k+Aw7T0GtRpjtHg/4c1p3Ilqpyi05wZfZqynGqTw5+PrWQC7TkPeIT4HNToORPUpfgEG1DlwWLCP4C7xEvWgTqCEoBd9Ajp14A1O2lg0bMO2lD8/Ocd8jK+NqBXSVmNSGSGWfO6VNuJ0Q8dhdO/vYZLS56SH5W7blFivNzDnJbZBwM=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2019 20:02:04.9043 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4148f11e-a464-4822-cb4d-08d726727076
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1267
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7jCTuqg753zcG2DWqF+rNOfZS/xoldEwEFDIOrkqB8s=;
 b=SFbl8WZajH6KWfoMYhNqPn435AjgBlSwhOaWxbKJE1L5TgL0KoPzv/ssoik5EYcfE36Mp+OUX7E30nAj6fLNgjQ/Y/aq04FvHUrUAcQUk+igsNcgdsKB4cMMOOJo627PNc19DZG3qD9e7xGYQw5x/qnw9CdAgkhoartwrztHGco=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=permerror action=none header.from=amd.com;
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
Cc: Wenjing Liu <Wenjing.Liu@amd.com>, David Francis <David.Francis@amd.com>,
 Nikola Cornij <Nikola.Cornij@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QWRkIGRybV9kcF9tc3RfZHNjX2NhcHNfZm9yX3BvcnQgYW5kIGRybV9kcF9tc3RfZHNjX2VuYWJs
ZSwKdHdvIGhlbHBlciBmdW5jdGlvbnMgZm9yIE1TVCBEU0MKClRoZSBmb3JtZXIsIGdpdmVuIGEg
cG9ydCwgcmV0dXJucyB0aGUgcmF3IERQQ0QgRFNDIGNhcHMgb2ZmCnRoYXQgcG9ydC4KClRoZSBs
YXR0ZXIsIGdpdmVuIGEgcG9ydCwgZW5hYmxlcyBvciBkaXNhYmxlcyBEU0Mgb24gdGhhdCBwb3J0
LgoKSW4gYm90aCBjYXNlcywgdGhlIHBvcnQgZ2l2ZW4gYXMgaW5wdXQgc2hvdWxkIGJlIGEgbGVh
ZiBvZgp0aGUgTVNUIHRyZWUgd2l0aCBhbiBhdHRhY2hlZCBkaXNwbGF5LgoKVGhlIGxvZ2ljIGZv
ciB0aGlzIGlzIHNvbWV3aGF0IGNvbXBsaWNhdGVkLCBhcyBEU0MgY2FuIGJlCmVuYWJsZWQgaW4g
NCBkaWZmZXJlbnQgd2F5cy4KCkNhc2UgMTogRFAtdG8tRFAgcGVlciBkZXZpY2UKaWYgdGhlIGJy
YW5jaCBpbW1lZGlhdGVseSB1cHN0cmVhbSBoYXMKIC0gUERUID0gRFBfUEVFUl9ERVZJQ0VfRFBf
TVNUX0JSQU5DSElORyAoMikKIC0gRFBDRCByZXYuID49IERQIDEuNAogLSBFeGFjdGx5IG9uZSBp
bnB1dCBhbmQgb25lIG91dHB1dAogLSBUaGUgb3V0cHV0IGhhcyBQRFQgPSBEUF9QRUVSX0RFVklD
RV9TU1RfU0lOSyAoMykKCkluIHRoaXMgY2FzZSwgRFNDIGNvdWxkIGJlIHBvc3NpYmxlIGVpdGhl
ciBvbiB0aGUgZW5kcG9pbnQKb3IgdGhlIHBlZXIgZGV2aWNlLiBQcmVmZXIgdGhlIGVuZHBvaW50
LCB3aGljaCBpcyBwb3NzaWJsZSBpZgogLSBUaGUgZW5kcG9pbnQgaGFzIERQX0RTQ19ERUNPTVBS
RVNTSU9OX0lTX1NVUFBPUlRFRCBiaXQgc2V0CiAtIFRoZSBlbmRwb2ludCBoYXMgRFBfRkVDX0NB
UEFCTEUgYml0IHNldAogLSBUaGUgcGVlciBkZXZpY2UgaGFzIERTQ19QQVNTVEhST1VHSF9DQVBB
QklMSVRZIGJpdCBzZXQgKGZyb20gRFAgdjIuMCkKCk90aGVyd2lzZSwgdXNlIHRoZSBwZWVyIGRl
dmljZQoKQ2FzZSAyOiBEUC10by1IRE1JIHBlZXIgZGV2aWNlCklmIHRoZSBvdXRwdXQgcG9ydCBo
YXMKIC0gUERUID0gRFBfUEVFUl9ERVZJQ0VfRFBfTEVHQUNZX0NPTlYgKDQpCiAtIERQQ0QgcmV2
LiA+PSBEUCAxLjQKIC0gTERQUyA9IHRydWUKIC0gTUNTID0gZmFsc2UKCkluIHRoaXMgY2FzZSwg
RFNDIGNhbiBvbmx5IGJlIGF0dGVtcHRlZCBvbiB0aGUgcGVlciBkZXZpY2UKKHRoZSBvdXRwdXQg
cG9ydCkKCkNhc2UgMzogVmlydHVhbCBEUCBTaW5rIChJbnRlcm5hbCBEaXNwbGF5IFBhbmVsKQpJ
ZiB0aGUgb3V0cHV0IHBvcnQgaGFzCiAtIERQQ0QgcmV2LiA+PSBEUCAxLjQKIC0gcG9ydF9udW0g
Pj0gOAoKSW4gdGhpcyBjYXNlLCBEU0MgY2FuIG9ubHkgYmUgYXR0ZW1wdGVkIG9uIHRoZSBwZWVy
IGRldmljZQoodGhlIG91dHB1dCBwb3J0KQoKQ2FzZSA0OiBTeW5hcHRpeCBXb3JrYXJvdW5kCklm
IHRoZSBvdXRwdXQgaGFzCiAtIGxpbmsgRFBDRCByZXYuID49IERQIDEuNAogLSBsaW5rIGJyYW5j
aF9kZXZfaWQgPSAweDkwQ0MyNCAoU3luYXB0aXgpCiAtIFRoZXJlIGlzIGV4YWN0bHkgb25lIGJy
YW5jaCBkZXZpY2UgYmV0d2VlbiB0aGUgbGluayBhbmQgb3V0cHV0CgpJbiB0aGlzIGNhc2UsIERT
QyBjYW4gYmUgYXR0ZW1wdGVkLCBidXQgb25seSB1c2luZyB0aGUgKmxpbmsqCmF1eCBkZXZpY2Un
cyBjYXBzLiBUaGlzIGlzIGEgcXVpcmsuCgpDYzogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNv
bT4KQ2M6IFdlbmppbmcgTGl1IDxXZW5qaW5nLkxpdUBhbWQuY29tPgpDYzogTmlrb2xhIENvcm5p
aiA8Tmlrb2xhLkNvcm5pakBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBEYXZpZCBGcmFuY2lzIDxE
YXZpZC5GcmFuY2lzQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9w
b2xvZ3kuYyB8IDE5MiArKysrKysrKysrKysrKysrKysrKysrKysrKwogaW5jbHVkZS9kcm0vZHJt
X2RwX21zdF9oZWxwZXIuaCAgICAgICB8ICAgMyArCiAyIGZpbGVzIGNoYW5nZWQsIDE5NSBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xv
Z3kuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKaW5kZXggN2RlY2I1
YmVmMDYyLi45NDc0MjUzODU1MWUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBf
bXN0X3RvcG9sb2d5LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3ku
YwpAQCAtNDE4MywzICs0MTgzLDE5NSBAQCBzdGF0aWMgdm9pZCBkcm1fZHBfbXN0X3VucmVnaXN0
ZXJfaTJjX2J1cyhzdHJ1Y3QgZHJtX2RwX2F1eCAqYXV4KQogewogCWkyY19kZWxfYWRhcHRlcigm
YXV4LT5kZGMpOwogfQorCisvKioKKyAqIGRybV9kcF9tc3RfaXNfdmlydHVhbF9kcGNkKCkgLSBJ
cyB0aGUgZ2l2ZW4gcG9ydCBhIHZpcnR1YWwgRFBDRCBkZXZpY2U/CisgKiBAcG9ydDogVGhlIHBv
cnQgdG8gY2hlY2sKKyAqCisgKiBSZXR1cm5zOgorICogdHJ1ZSBpZiB0aGUgcG9ydCBpcyBhIHZp
cnR1YWwgRFBDRCBwZWVyIGRldmljZSwgZmFsc2Ugb3RoZXJ3aXNlCisgKi8KK3N0YXRpYyBib29s
IGRybV9kcF9tc3RfaXNfdmlydHVhbF9kcGNkKHN0cnVjdCBkcm1fZHBfbXN0X3BvcnQgKnBvcnQp
Cit7CisJc3RydWN0IGRybV9kcF9tc3RfcG9ydCAqZG93bnN0cmVhbV9wb3J0OworCisJaWYgKCFw
b3J0KQorCQlyZXR1cm4gZmFsc2U7CisKKwkvKiBWaXJ0dWFsIERQIFNpbmsgKEludGVybmFsIERp
c3BsYXkgUGFuZWwpICovCisJaWYgKHBvcnQtPnBvcnRfbnVtID49IDggJiYgcG9ydC0+ZHBjZF9y
ZXYgPj0gRFBfRFBDRF9SRVZfMTQpCisJCXJldHVybiB0cnVlOworCisJLyogRFAtdG8tSERNSSBQ
cm90b2NvbCBDb252ZXJ0ZXIgKi8KKwlpZiAocG9ydC0+cGR0ID09IERQX1BFRVJfREVWSUNFX0RQ
X0xFR0FDWV9DT05WICYmCisJCQkhcG9ydC0+bWNzICYmCisJCQlwb3J0LT5sZHBzICYmCisJCQlw
b3J0LT5kcGNkX3JldiA+PSBEUF9EUENEX1JFVl8xNCkKKwkJcmV0dXJuIHRydWU7CisKKwkvKiBE
UC10by1EUCAqLworCWlmIChwb3J0LT5wZHQgPT0gRFBfUEVFUl9ERVZJQ0VfTVNUX0JSQU5DSElO
RyAmJgorCQkJcG9ydC0+bXN0YiAmJgorCQkJcG9ydC0+ZHBjZF9yZXYgPj0gRFBfRFBDRF9SRVZf
MTQgJiYKKwkJCXBvcnQtPm1zdGItPm51bV9wb3J0cyA9PSAyKSB7CisJCWxpc3RfZm9yX2VhY2hf
ZW50cnkoZG93bnN0cmVhbV9wb3J0LCAmcG9ydC0+bXN0Yi0+cG9ydHMsIG5leHQpIHsKKwkJCWlm
ICghZG93bnN0cmVhbV9wb3J0LT5pbnB1dCAmJgorCQkJCWRvd25zdHJlYW1fcG9ydC0+cGR0ID09
IERQX1BFRVJfREVWSUNFX1NTVF9TSU5LKQorCQkJCXJldHVybiB0cnVlOworCQl9CisJfQorCisJ
cmV0dXJuIGZhbHNlOworfQorCisvKioKKyAqIGRybV9kcF9tc3RfaXNfdmlydHVhbF9kcGNkKCkg
LSBEb2VzIHRoaXMgcG9ydCByZXF1aXJlIFN5bmFwdGl4IERTQyB3b3JrYXJvdW5kPworICogQHBv
cnQ6IFRoZSBwb3J0IHRvIGNoZWNrCisgKgorICogU29tZSBTeW5hcHRpeCBNU1QgaHVicyBzdXBw
b3J0IERTQyBldmVuIHRob3VnaCB0aGV5IGRvIG5vdCBzdXBwb3J0IHZpcnR1YWwKKyAqIERQQ0Qu
IFRoaXMgaXMgYSBxdWlyay4KKyAqCisgKiBSZXR1cm5zOgorICogdHJ1ZSBpZiB0aGUgU3luYXB0
aXggd29ya2Fyb3VuZCBpcyByZXF1aXJlZCwgZmFsc2Ugb3RoZXJ3aXNlCisgKi8KK3N0YXRpYyBi
b29sIGRybV9kcF9tc3RfZHNjX3N5bmFwdGl4X3dvcmthcm91bmQoc3RydWN0IGRybV9kcF9tc3Rf
cG9ydCAqcG9ydCkKK3sKKwl1OCBkYXRhWzNdID0geyAwIH07CisJdTMyIGRldl9pZDsKKwlzdHJ1
Y3QgZHJtX2RwX2F1eCAqcGh5c19hdXg7CisKKwkvKiBUaGUgaHViIG11c3QgYmUgZGlyZWN0bHkg
Y29ubmVjdGVkIHRvIHRoZSBjb25uZWN0b3IgKi8KKwlpZiAocG9ydC0+bWdyLT5tc3RfcHJpbWFy
eSAhPSBwb3J0LT5wYXJlbnQpCisJCXJldHVybiBmYWxzZTsKKworCXBoeXNfYXV4ID0gcG9ydC0+
bWdyLT5hdXg7CisJaWYgKGRybV9kcF9kcGNkX3JlYWQocGh5c19hdXgsIERQX0JSQU5DSF9PVUks
IGRhdGEsIDMpIDwgMCkKKwkJcmV0dXJuIGZhbHNlOworCWRldl9pZCA9IChkYXRhWzBdIDw8IDE2
KSAmIChkYXRhWzFdIDw8IDgpICYgZGF0YVszXTsKKwkvKiBTeW5hcHRpeCBkZXZpY2UgSUQgKi8K
KwlpZiAoZGV2X2lkICE9IDB4OTBDQzI0KQorCQlyZXR1cm4gZmFsc2U7CisKKwlpZiAoZHJtX2Rw
X2RwY2RfcmVhZChwaHlzX2F1eCwgRFBfRFBDRF9SRVYsIGRhdGEsIDEpIDwgMCkKKwkJcmV0dXJu
IGZhbHNlOworCS8qIE11c3QgYmUgRFBDRCByZXYuIDEuNCBvciBsYXRlciAqLworCWlmIChkYXRh
WzBdIDwgRFBfRFBDRF9SRVZfMTQpCisJCXJldHVybiBmYWxzZTsKKworCWlmIChkcm1fZHBfZHBj
ZF9yZWFkKCZwb3J0LT5hdXgsIERQX0RPV05TVFJFQU1QT1JUX1BSRVNFTlQsIGRhdGEsIDEpIDwg
MCkKKwkJcmV0dXJuIGZhbHNlOworCS8qIE11c3Qgbm90IGJlIGEgVkdBIGNvbnZlcnRlciAqLwor
CWlmICgoZGF0YVswXSAmIDcpID09IDMpCisJCXJldHVybiBmYWxzZTsKKworCXJldHVybiB0cnVl
OworfQorCisvKioKKyAqIGRybV9kcF9tc3RfZHNjX2F1eF9mb3JfcG9ydCgpIC0gRmluZCB0aGUg
Y29ycmVjdCBhdXggZm9yIERTQworICogQHBvcnQ6IFRoZSBwb3J0IHRvIGNoZWNrLiBBIGxlYWYg
b2YgdGhlIE1TVCB0cmVlIHdpdGggYW4gYXR0YWNoZWQgZGlzcGxheS4KKyAqCisgKiBEZXBlbmRp
bmcgb24gdGhlIHNpdHVhdGlvbiwgRFNDIG1heSBiZSBlbmFibGVkIHZpYSB0aGUgZW5kcG9pbnQg
YXV4LAorICogdGhlIGltbWVkaWF0ZWx5IHVwc3RyZWFtIGF1eCwgb3IgdGhlIGNvbm5lY3Rvcidz
IHBoeXNpY2FsIGF1eC4KKyAqCisgKiBSZXR1cm5zOgorICogTlVMTCBpZiBEU0MgY2Fubm90IGJl
IGVuYWJsZWQgb24gdGhpcyBwb3J0LCBvdGhlcndpc2UgdGhlIGF1eCBkZXZpY2UKKyAqLworc3Ry
dWN0IGRybV9kcF9hdXggKmRybV9kcF9tc3RfZHNjX2F1eF9mb3JfcG9ydChzdHJ1Y3QgZHJtX2Rw
X21zdF9wb3J0ICpwb3J0KQoreworCXU4IHVwc3RyZWFtX2RzY19jYXBzID0gMDsKKwl1OCBlbmRw
b2ludF9kc2NfY2FwcyA9IDA7CisJdTggZW5kcG9pbnRfZmVjX2NhcHMgPSAwOworCXN0cnVjdCBk
cm1fZHBfbXN0X3BvcnQgKmltbWVkaWF0ZV91cHN0cmVhbV9wb3J0OworCXN0cnVjdCBkcm1fZHBf
bXN0X3BvcnQgKmZlY19wb3J0OworCisJaWYgKHBvcnQgJiYgcG9ydC0+cGFyZW50KQorCQlpbW1l
ZGlhdGVfdXBzdHJlYW1fcG9ydCA9IHBvcnQtPnBhcmVudC0+cG9ydF9wYXJlbnQ7CisJZWxzZQor
CQlpbW1lZGlhdGVfdXBzdHJlYW1fcG9ydCA9IE5VTEw7CisKKwlmZWNfcG9ydCA9IGltbWVkaWF0
ZV91cHN0cmVhbV9wb3J0OworCXdoaWxlIChmZWNfcG9ydCkgeworCQlpZiAoIWZlY19wb3J0LT5m
ZWNfY2FwYWJsZSkKKwkJCXJldHVybiBOVUxMOworCisJCWZlY19wb3J0ID0gZmVjX3BvcnQtPnBh
cmVudC0+cG9ydF9wYXJlbnQ7CisJfQorCisJaWYgKGltbWVkaWF0ZV91cHN0cmVhbV9wb3J0KSB7
CisJCWlmIChkcm1fZHBfZHBjZF9yZWFkKCZpbW1lZGlhdGVfdXBzdHJlYW1fcG9ydC0+YXV4LAor
CQkJCURQX0RTQ19TVVBQT1JULCAmdXBzdHJlYW1fZHNjX2NhcHMsIDEpIDwgMCkKKwkJCXJldHVy
biBOVUxMOworCX0KKworCWlmIChkcm1fZHBfZHBjZF9yZWFkKCZwb3J0LT5hdXgsIERQX0RTQ19T
VVBQT1JULCAmZW5kcG9pbnRfZHNjX2NhcHMsIDEpIDwgMCkKKwkJcmV0dXJuIE5VTEw7CisJaWYg
KGRybV9kcF9kcGNkX3JlYWQoJnBvcnQtPmF1eCwgRFBfRkVDX0NBUEFCSUxJVFksICZlbmRwb2lu
dF9mZWNfY2FwcywgMSkgPCAwKQorCQlyZXR1cm4gTlVMTDsKKworCS8qIEVucG9pbnQgZGVjb21w
cmVzc2lvbiB3aXRoIERQLXRvLURQIHBlZXIgZGV2aWNlICovCisJaWYgKGRybV9kcF9tc3RfaXNf
dmlydHVhbF9kcGNkKGltbWVkaWF0ZV91cHN0cmVhbV9wb3J0KQorCQkJJiYgKHVwc3RyZWFtX2Rz
Y19jYXBzICYgMHgyKSAvKiBEU0MgcGFzc3Rocm91Z2ggY2FwYWJpbGl0eSAqLworCQkJJiYgKGVu
ZHBvaW50X2ZlY19jYXBzICYgRFBfRkVDX0NBUEFCTEUpCisJCQkmJiAoZW5kcG9pbnRfZHNjX2Nh
cHMgJiBEUF9EU0NfREVDT01QUkVTU0lPTl9JU19TVVBQT1JURUQpKQorCQlyZXR1cm4gJnBvcnQt
PmF1eDsKKworCS8qIFZpcnR1YWwgRFBDRCBkZWNvbXByZXNzaW9uIHdpdGggRFAtdG8tRFAgcGVl
ciBkZXZpY2UgKi8KKwlpZiAoZHJtX2RwX21zdF9pc192aXJ0dWFsX2RwY2QoaW1tZWRpYXRlX3Vw
c3RyZWFtX3BvcnQpKQorCQlyZXR1cm4gJmltbWVkaWF0ZV91cHN0cmVhbV9wb3J0LT5hdXg7CisK
KwkvKiBWaXJ0dWFsIERQQ0QgZGVjb21wcmVzc2lvbiB3aXRoIERQLXRvLUhETUkgb3IgVmlydHVh
bCBEUCBTaW5rICovCisJaWYgKGRybV9kcF9tc3RfaXNfdmlydHVhbF9kcGNkKHBvcnQpKQorCQly
ZXR1cm4gJnBvcnQtPmF1eDsKKworCS8qIFN5bmFwdGl4IHdvcmthcm91bmQgKi8KKwlpZiAoZHJt
X2RwX21zdF9kc2Nfc3luYXB0aXhfd29ya2Fyb3VuZChwb3J0KSkKKwkJcmV0dXJuIHBvcnQtPm1n
ci0+YXV4OworCisJcmV0dXJuIE5VTEw7Cit9CisKKy8qKgorICogZHJtX2RwX21zdF9kc2NfYXV4
X2Zvcl9wb3J0KCkgLSBSZXRyaWV2ZSB0aGUgRFNDIGNhcGFiaWxpdHkgcmVnaXN0ZXJzCisgKiBA
cG9ydDogVGhlIHBvcnQgdG8gY2hlY2suIEEgbGVhZiBvZiB0aGUgTVNUIHRyZWUgd2l0aCBhbiBh
dHRhY2hlZCBkaXNwbGF5LgorICogQGNhcHM6IE91dHB1dC4gIEEgcG9pbnRlciB0byBhbiBhcnJh
eSBhdCBsZWFzdCAxNiBieXRlcyBsb25nCisgKgorICogUmVhZHMgdGhlIERTQyBjYXBhYmlsaXR5
IHJlZ2lzdGVycyAoRFNDX1NVUFBPUlQgdGhyb3VnaAorICogQklUU19QRVJfUElYRUxfSU5DUkVN
RU5UKSBhbmQgc3RvcmUgdGhlbSBpbiB0aGUgZ2l2ZW4gcG9pbnRlci4gVXNlCisgKiB0aGUgY29y
cmVjdCBhdXggZm9yIERTQyBvbiB0aGUgZ2l2ZW4gcG9ydC4KKyAqCisgKiBSZXR1cm5zOgorICog
VGhlIG51bWJlciBvZiBieXRlcyByZWFkIG9uIHN1Y2Nlc3MsIG9yIGEgbmVnYXRpdmUgZXJyb3Ig
Y29kZSBvbiBmYWlsdXJlCisgKi8KK2ludCBkcm1fZHBfbXN0X2RzY19jYXBzX2Zvcl9wb3J0KHN0
cnVjdCBkcm1fZHBfbXN0X3BvcnQgKnBvcnQsIHU4ICpjYXBzKQoreworCXN0cnVjdCBkcm1fZHBf
YXV4ICphdXggPSBkcm1fZHBfbXN0X2RzY19hdXhfZm9yX3BvcnQocG9ydCk7CisKKwlpZiAoIWF1
eCkKKwkJcmV0dXJuIC1FSU5WQUw7CisKKwlyZXR1cm4gZHJtX2RwX2RwY2RfcmVhZChhdXgsIERQ
X0RTQ19TVVBQT1JULCBjYXBzLCAxNik7Cit9CitFWFBPUlRfU1lNQk9MKGRybV9kcF9tc3RfZHNj
X2NhcHNfZm9yX3BvcnQpOworCisvKioKKyAqIGRybV9kcF9tc3RfZHNjX2F1eF9mb3JfcG9ydCgp
IC0gRW5hYmxlIERTQyBvbiBhbiBNU1QgZW5kcG9pbnQKKyAqIEBwb3J0OiBUaGUgcG9ydCB0byBj
aGVjay4gQSBsZWFmIG9mIHRoZSBNU1QgdHJlZSB3aXRoIGFuIGF0dGFjaGVkIGRpc3BsYXkuCisg
KiBAZW5hYmxlOiB0cnVlIGZvciB0dXJuIG9uIERTQywgZmFsc2UgZm9yIHR1cm4gb2ZmIERTQwor
ICoKKyAqIFdyaXRlcyBEUF9EU0NfRU5BQkxFIG9uIHRoZSBjb3JyZWN0IGF1eCBmb3IgdGhlIGdp
dmVuIHBvcnQuCisgKgorICogUmV0dXJuczoKKyAqIFRoZSBudW1iZXIgb2YgYnl0ZXMgd3JpdHRl
biBvbiBzdWNjZXNzLCBvciBhIG5lZ2F0aXZlIGVycm9yIGNvZGUgb24gZmFpbHVyZQorICovCitp
bnQgZHJtX2RwX21zdF9kc2NfZW5hYmxlKHN0cnVjdCBkcm1fZHBfbXN0X3BvcnQgKnBvcnQsIGJv
b2wgZW5hYmxlKQoreworCXN0cnVjdCBkcm1fZHBfYXV4ICphdXggPSBkcm1fZHBfbXN0X2RzY19h
dXhfZm9yX3BvcnQocG9ydCk7CisJdTggZW5hYmxlX2RzYyA9IGVuYWJsZSA/IDEgOiAwOworCisJ
aWYgKCFhdXgpCisJCXJldHVybiAtRUlOVkFMOworCisJcmV0dXJuIGRybV9kcF9kcGNkX3dyaXRl
KGF1eCwgRFBfRFNDX0VOQUJMRSwgJmVuYWJsZV9kc2MsIDEpOworfQorRVhQT1JUX1NZTUJPTChk
cm1fZHBfbXN0X2RzY19lbmFibGUpOwpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2RwX21z
dF9oZWxwZXIuaCBiL2luY2x1ZGUvZHJtL2RybV9kcF9tc3RfaGVscGVyLmgKaW5kZXggZmE5NzM3
NzNhNGE3Li4wZjcwZGM4ZGZiZWIgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2RybV9kcF9tc3Rf
aGVscGVyLmgKKysrIGIvaW5jbHVkZS9kcm0vZHJtX2RwX21zdF9oZWxwZXIuaApAQCAtNjc0LDYg
KzY3NCw5IEBAIGludCBfX211c3RfY2hlY2sgZHJtX2RwX21zdF9hdG9taWNfY2hlY2soc3RydWN0
IGRybV9hdG9taWNfc3RhdGUgKnN0YXRlKTsKIHZvaWQgZHJtX2RwX21zdF9nZXRfcG9ydF9tYWxs
b2Moc3RydWN0IGRybV9kcF9tc3RfcG9ydCAqcG9ydCk7CiB2b2lkIGRybV9kcF9tc3RfcHV0X3Bv
cnRfbWFsbG9jKHN0cnVjdCBkcm1fZHBfbXN0X3BvcnQgKnBvcnQpOwogCitpbnQgZHJtX2RwX21z
dF9kc2NfY2Fwc19mb3JfcG9ydChzdHJ1Y3QgZHJtX2RwX21zdF9wb3J0ICpwb3J0LCB1OCAqY2Fw
cyk7CitpbnQgZHJtX2RwX21zdF9kc2NfZW5hYmxlKHN0cnVjdCBkcm1fZHBfbXN0X3BvcnQgKnBv
cnQsIGJvb2wgZW5hYmxlKTsKKwogZXh0ZXJuIGNvbnN0IHN0cnVjdCBkcm1fcHJpdmF0ZV9zdGF0
ZV9mdW5jcyBkcm1fZHBfbXN0X3RvcG9sb2d5X3N0YXRlX2Z1bmNzOwogCiAvKioKLS0gCjIuMTcu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
