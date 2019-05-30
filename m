Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D088F302FD
	for <lists+amd-gfx@lfdr.de>; Thu, 30 May 2019 21:51:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69DF16E13F;
	Thu, 30 May 2019 19:51:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780045.outbound.protection.outlook.com [40.107.78.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C3846E13F
 for <amd-gfx@lists.freedesktop.org>; Thu, 30 May 2019 19:51:23 +0000 (UTC)
Received: from MWHPR12CA0028.namprd12.prod.outlook.com (2603:10b6:301:2::14)
 by CY4PR1201MB0055.namprd12.prod.outlook.com (2603:10b6:910:1b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1922.20; Thu, 30 May
 2019 19:51:21 +0000
Received: from DM3NAM03FT024.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::204) by MWHPR12CA0028.outlook.office365.com
 (2603:10b6:301:2::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1943.17 via Frontend
 Transport; Thu, 30 May 2019 19:51:21 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT024.mail.protection.outlook.com (10.152.82.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1922.16 via Frontend Transport; Thu, 30 May 2019 19:51:20 +0000
Received: from kazbox.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 30 May 2019
 14:51:20 -0500
From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/display: Don't set mode_changed=false if the stream
 was removed
Date: Thu, 30 May 2019 15:51:14 -0400
Message-ID: <20190530195114.2555-1-nicholas.kazlauskas@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(396003)(376002)(136003)(346002)(39860400002)(2980300002)(428003)(199004)(189003)(53936002)(8936002)(50226002)(5660300002)(36756003)(2351001)(4326008)(8676002)(6666004)(68736007)(2906002)(6916009)(186003)(48376002)(126002)(2616005)(426003)(54906003)(86362001)(77096007)(336012)(476003)(51416003)(7696005)(26005)(50466002)(16586007)(14444005)(478600001)(486006)(81166006)(81156014)(47776003)(305945005)(356004)(316002)(53416004)(70586007)(70206006)(1076003)(44832011)(72206003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0055; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e8bc4f42-d68b-49f4-1729-08d6e5383052
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:CY4PR1201MB0055; 
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0055:
X-Microsoft-Antispam-PRVS: <CY4PR1201MB00552E8188D4FB975D0319E3EC180@CY4PR1201MB0055.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1284;
X-Forefront-PRVS: 00531FAC2C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: g79ZV78N0QEPUgtB6voB4/HelzoyK5z4bhdUua7/eQ0QNloVl2JFjpRZDwi9AOzbjJNwMLNAVRWLdx35+9qZWe/Z1ddXfCrioDieLV8nFGfKIu8gjUqwuZB6MKEnKPftwibPWmc+v9Ez4rG4I9MwzHrSz9ibA+vOMRici0Ca6hp9cToNFYI5xgZ9KIkfphJxIO//ZwsAEkNSESzVMUK4i/gbXQgoonu2zxqiumvFgNgTc1xsRZNfexI4Q+Tsvnc1njNKZjL95dSONOuYelGr0z/NtUZ6rLSY3xixA+kzNEjT5chpJ+GOEPk7GMVCuxsXGXU+hCutkVaBcEgRhXMVfmEZTlgCRwxh1geEattACYOUQAX/vF6P8PpCbobR5JD39cVWdsFc/oZLBzScqvKu+hjM5+APzliQOIW6IluWqs8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2019 19:51:20.9818 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8bc4f42-d68b-49f4-1729-08d6e5383052
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0055
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nCt8PPqC05xnGqIv0RERSD8vzpNrU8nyQbVZjdII3UI=;
 b=mDMisDXVrdu0ZNKMRCBVe9MVzyv62/rkEZ6a/eMccseGaLtnmv86jCqPbnC1BG7wK0bnjPH+/+Vr+KxgGiBL4rgqMv8vZ1Hu7wgUVKTF7TPz1iylDEalUwwnaVjEOoB+CZ3LpYTxEOog51MNphRB7q2X9E63+NtAYzugW9i3gBE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
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
Cc: Leo Li <sunpeng.li@amd.com>, Harry Wentland <Harry.Wentland@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>, Roman Li <Roman.Li@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W1doeV0KV2hlbiBzd2l0Y2hpbmcgZnJvbSB2dCB0byBkZXNrdG9wIHdpdGggRURJRCBlbXVsYXRp
b24gd2UgY2FuIHJlY2VpdmUKYW4gYXRvbWljIGNvbW1pdCBzdWNoIHRoYXQgd2UgaGF2ZSBhIGNy
dGMgd2hlcmUgbW9kZV9jaGFuZ2VkID0gdHJ1ZS4KCkR1cmluZyB0aGUgZG1fdXBkYXRlX2NydGNf
c3RhdGUgZGlzYWJsZSBwYXNzIHdlIHJlbW92ZSB0aGUgc3RyZWFtIGZyb20KdGhlIGNvbnRleHQg
YW5kIGZyZWUgaXQgb24gdGhlIGRtX25ld19jcnRjX3N0YXRlLgoKRHVyaW5nIHRoZSBlbmFibGUg
cGFzcyB3ZSBjb21wYXJlIHRoZSBuZXcgcHJvdmlzaW9uYWwgc3RyZWFtIHRvIHRoZQpkbV9vbGRf
Y3J0Y19zdGF0ZS0+c3RyZWFtIGFuZCBkZXRlcm1pbmUgdGhhdCB0aGUgc3RyZWFtIGlzIHVuY2hh
bmdlZAphbmQgbm8gc2NhbGluZyBoYXMgYmVlbiBjaGFuZ2VkLgoKRm9sbG93aW5nIHRoaXMsIG5l
d19jcnRjX3N0YXRlLT5tb2RlX2NoYW5nZWQgaXMgdGhlbiBzZXQgdG8gZmFsc2UuClRoZSBjb25u
ZWN0b3JzIGhhdmVuJ3QgY2hhbmdlZCBhbmQgdGhlIENSVEMgYWN0aXZlIHN0YXRlIGhhc24ndCBj
aGFuZ2VkCnNvIGRybV9hdG9taWNfY3J0Y19uZWVkc19tb2Rlc2V0IHJldHVybnMgZmFsc2UsIHNv
IHdlIGp1bXAgdG8Kc2tpcF9tb2Rlc2V0IGFuZCB3ZSBoaXQ6CgpCVUdfT04oZG1fbmV3X2NydGNf
c3RhdGUtPnN0cmVhbSA9PSBOVUxMKTsKCi4uLnNpbmNlIHRoZSBvbGQgc3RyZWFtIGlzIGdvbmUg
ZnJvbSB0aGUgY29udGV4dCBhbmQgdGhlIG5ldyBzdHJlYW0gaXMKYWxzbyBzdGlsbCBOVUxMLgoK
W0hvd10KRW5zdXJlIHRoYXQgd2Ugc3RpbGwgYSBzdHJlYW0gdG8gcmV1c2UgYmVmb3JlIGNoZWNr
aW5nIGlmIHdlIGNhbiByZXVzZQp0aGUgb2xkIHN0cmVhbSB3aXRob3V0IGEgZnVsbCBtb2Rlc2V0
LgoKQ2M6IFJvbWFuIExpIDxSb21hbi5MaUBhbWQuY29tPgpDYzogTGVvIExpIDxzdW5wZW5nLmxp
QGFtZC5jb20+CkNjOiBIYXJyeSBXZW50bGFuZCA8SGFycnkuV2VudGxhbmRAYW1kLmNvbT4KU2ln
bmVkLW9mZi1ieTogTmljaG9sYXMgS2F6bGF1c2thcyA8bmljaG9sYXMua2F6bGF1c2thc0BhbWQu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2Rt
LmMgfCAxMiArKysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Ft
ZGdwdV9kbS9hbWRncHVfZG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVf
ZG0vYW1kZ3B1X2RtLmMKaW5kZXggNTczNTkwMzdlZDdjLi43OTZmODNjYTdhNGMgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwpAQCAt
NjI0OCw3ICs2MjQ4LDE3IEBAIHN0YXRpYyBpbnQgZG1fdXBkYXRlX2NydGNfc3RhdGUoc3RydWN0
IGFtZGdwdV9kaXNwbGF5X21hbmFnZXIgKmRtLAogCiAJCWRtX25ld19jcnRjX3N0YXRlLT5hYm1f
bGV2ZWwgPSBkbV9uZXdfY29ubl9zdGF0ZS0+YWJtX2xldmVsOwogCi0JCWlmIChkY19pc19zdHJl
YW1fdW5jaGFuZ2VkKG5ld19zdHJlYW0sIGRtX29sZF9jcnRjX3N0YXRlLT5zdHJlYW0pICYmCisJ
CS8qCisJCSAqIElmIHdlIGFscmVhZHkgcmVtb3ZlZCB0aGUgb2xkIHN0cmVhbSBmcm9tIHRoZSBj
b250ZXh0CisJCSAqIChhbmQgc2V0IHRoZSBuZXcgc3RyZWFtIHRvIE5VTEwpIHRoZW4gd2UgY2Fu
J3QgcmV1c2UKKwkJICogdGhlIG9sZCBzdHJlYW0gZXZlbiBpZiB0aGUgc3RyZWFtIGFuZCBzY2Fs
aW5nIGFyZSB1bmNoYW5nZWQuCisJCSAqIFdlJ2xsIGhpdCB0aGUgQlVHX09OIGFuZCBibGFjayBz
Y3JlZW4uCisJCSAqCisJCSAqIFRPRE86IFJlZmFjdG9yIHRoaXMgZnVuY3Rpb24gdG8gYWxsb3cg
dGhpcyBjaGVjayB0byB3b3JrCisJCSAqIGluIGFsbCBjb25kaXRpb25zLgorCQkgKi8KKwkJaWYg
KGRtX25ld19jcnRjX3N0YXRlLT5zdHJlYW0gJiYKKwkJICAgIGRjX2lzX3N0cmVhbV91bmNoYW5n
ZWQobmV3X3N0cmVhbSwgZG1fb2xkX2NydGNfc3RhdGUtPnN0cmVhbSkgJiYKIAkJICAgIGRjX2lz
X3N0cmVhbV9zY2FsaW5nX3VuY2hhbmdlZChuZXdfc3RyZWFtLCBkbV9vbGRfY3J0Y19zdGF0ZS0+
c3RyZWFtKSkgewogCQkJbmV3X2NydGNfc3RhdGUtPm1vZGVfY2hhbmdlZCA9IGZhbHNlOwogCQkJ
RFJNX0RFQlVHX0RSSVZFUigiTW9kZSBjaGFuZ2Ugbm90IHJlcXVpcmVkLCBzZXR0aW5nIG1vZGVf
Y2hhbmdlZCB0byAlZCIsCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeA==
