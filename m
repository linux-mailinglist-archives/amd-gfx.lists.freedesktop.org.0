Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D17E6884FB
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 23:38:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 508CD6EEB0;
	Fri,  9 Aug 2019 21:38:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820080.outbound.protection.outlook.com [40.107.82.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6CB76EEBB
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 21:38:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E28FrmNRb+dj/ibniPIl2CLqcX9kRWoqV+ordJEumTBFywXbnRgo84ARweD1UV2O4g0WFqNS5jczglEj82Rf/kCpxZm0FuGVncbRt57AyY1Gn8fl2fJp6ebLE/mtMo6VpxLSTLUTzef4zxETT8oyZRJZ8FzC5toPHSRTzVBClse+sSyh2cL+hkxB4Vvcl9E50VgCDBM+3RqTO8lB8pM7+PVjeRnMHgzy/WnPeJfjPasWDA+1kzVw+WMgOS/Gr7+Xx14rCPjMMlKLjXBeSS6z8UWBg6YZ24ZlRLYt2KKjZ3tXQVCnoVYamBtbbyAdwHBkn4hYH1mwTmTlaYXPGkrzcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6I3OaXV7FRGzPg+xNnqx6FnYhQH0jkj7O2TPiJkSX0k=;
 b=BjEj5qduWZt3wn4m7O9K9Cc6qIBZ1WBVNxYzIZP+eHHa938UsKRPkwKNS9eHQaRSXKPKYfOIz1mnaPKzj/5xhaFfl2eWxZPsfEiYCu0eLjoqXxDQAppouq9/W2zfZO7/RYaewZrUN4WRwwsmU8dMe8m3MHAxnysXx/9yETnfxs8F5Lm91a1PSwuQ8Tm9Q/wZR9f6q1DkCVjLQIyRs82/sBT+W3ZfLD8Tl//8sC5gWr2rGRaNvP9IHTIN2hRPykOQKdBrJ+Iu4sA3bDGb2gBs8pVIuawD062DHaZclS8qyRoMk1uV8XvyQSAFDnCyU4yVGg0ob2rcBwEwoUrhQLAYqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CY4PR1201CA0008.namprd12.prod.outlook.com
 (2603:10b6:910:16::18) by DM6PR12MB2716.namprd12.prod.outlook.com
 (2603:10b6:5:49::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.13; Fri, 9 Aug
 2019 21:38:35 +0000
Received: from DM3NAM03FT040.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::209) by CY4PR1201CA0008.outlook.office365.com
 (2603:10b6:910:16::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.15 via Frontend
 Transport; Fri, 9 Aug 2019 21:38:35 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT040.mail.protection.outlook.com (10.152.83.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2157.15 via Frontend Transport; Fri, 9 Aug 2019 21:38:35 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Fri, 9 Aug 2019 16:38:29 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 21/49] drm/amd/display: Change DSC policy from slices per
 column to minimum slice height
Date: Fri, 9 Aug 2019 17:37:14 -0400
Message-ID: <20190809213742.30301-22-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190809213742.30301-1-sunpeng.li@amd.com>
References: <20190809213742.30301-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(39860400002)(376002)(136003)(2980300002)(428003)(189003)(199004)(51416003)(49486002)(2876002)(76176011)(36756003)(50466002)(4326008)(2906002)(48376002)(305945005)(336012)(6666004)(356004)(53936002)(426003)(2351001)(50226002)(316002)(2870700001)(54906003)(86362001)(8676002)(6916009)(5660300002)(81166006)(186003)(26005)(70586007)(11346002)(70206006)(446003)(47776003)(8936002)(486006)(81156014)(478600001)(126002)(476003)(2616005)(1076003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2716; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 14bee6cf-2848-4dc2-a8e8-08d71d11eeff
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM6PR12MB2716; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB2716:
X-Microsoft-Antispam-PRVS: <DM6PR12MB27161B7C2BA7E5F5B5B15B8882D60@DM6PR12MB2716.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-Forefront-PRVS: 01244308DF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: f+bttKgMLap9GN9N3aUulzmx/SSsVXApojhKYMx8dZn0RVK4OYKEZW8BkpEaia1AmZwpbVX4R0TGvqJ2zHO6TlGPUhUzPoxTSLjjMkjCfo+MTX/0DKxImJ7wYpBY7jIUUyWKQsn2kN9FL5G6Cdxft6KBe4HgmgucW9zQqnVTUDRrBbb8ur74hPUuJUzSkhDorhDAnQHWrK9g6A0gpAYJkdfZ5GHGJHKfJ+icvYPL28ri7xiz5kN9ntMCSLvb/TD5HG7IZX9T8bQytSqK8PsbQlRKkZXz80qXNA6DR+ZLwg0Ytwzn9d0DvsxTdB1xAzMZurS3NrWQD/OJrHrt6MWa2HiHE+MX+a3XWXvNRBlE3IO7jr3/zEN9dE1deXlg0qklQERGKFMKi8jyEnQiyrKd63siAYEeVtcaFdDo+gzC1fA=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2019 21:38:35.6565 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14bee6cf-2848-4dc2-a8e8-08d71d11eeff
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6I3OaXV7FRGzPg+xNnqx6FnYhQH0jkj7O2TPiJkSX0k=;
 b=hqlfdOCyNEr+7FK/qU64Ifs4L6mFBn4lt02PhtrLB4DUjBzsNTUroefT2zM4ayW+qwXahacM3yJrNChGZ3fDPuw/TPZCV483YRbLOvOL3XP/gr3MLbTl4hPnYJLxZnojkHshxMRa/1pXOiDTOnnQ5ZitjT8fl/lFpev8WMynbZg=
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
Cc: Leo Li <sunpeng.li@amd.com>, Jun Lei <Jun.Lei@amd.com>,
 Nikola Cornij <nikola.cornij@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTmlrb2xhIENvcm5paiA8bmlrb2xhLmNvcm5pakBhbWQuY29tPgoKW3doeV0gTWluaW11
bSBzbGljZSBoZWlnaHQgaXMgcmVjb21tZW5kZWQgYnkgVkVTQSBEU0MgU3ByZWFkc2hlZXQgdXNl
ciBndWlkZQoKU2lnbmVkLW9mZi1ieTogTmlrb2xhIENvcm5paiA8bmlrb2xhLmNvcm5pakBhbWQu
Y29tPgpSZXZpZXdlZC1ieTogSnVuIExlaSA8SnVuLkxlaUBhbWQuY29tPgpBY2tlZC1ieTogTGVv
IExpIDxzdW5wZW5nLmxpQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2RzYy9kY19kc2MuYyB8IDcxICsrKysrKysrKystLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDMyIGluc2VydGlvbnMoKyksIDM5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kc2MvZGNfZHNjLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvZHNjL2RjX2RzYy5jCmluZGV4IGVmNWY4NGExNDRjMy4uNTk5NWJjZGZl
ZDU0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZHNjL2RjX2Rz
Yy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kc2MvZGNfZHNjLmMKQEAg
LTI4LDYgKzI4LDIzIEBACiAjaW5jbHVkZSAiZHNjLmgiCiAjaW5jbHVkZSA8ZHJtL2RybV9kcF9o
ZWxwZXIuaD4KIAorc3RydWN0IGRjX2RzY19wb2xpY3kgeworCWJvb2wgdXNlX21pbl9zbGljZXNf
aDsKKwlpbnQgbWF4X3NsaWNlc19oOyAvLyBNYXhpbXVtIGF2YWlsYWJsZSBpZiAwCisJaW50IG1p
bl9zaWNlX2hlaWdodDsgLy8gTXVzdCBub3QgYmUgbGVzcyB0aGFuIDgKKwlpbnQgbWF4X3Rhcmdl
dF9icHA7CisJaW50IG1pbl90YXJnZXRfYnBwOyAvLyBNaW5pbXVtIHRhcmdldCBiaXRzIHBlciBw
aXhlbAorfTsKKworY29uc3Qgc3RydWN0IGRjX2RzY19wb2xpY3kgZHNjX3BvbGljeSA9IHsKKwku
dXNlX21pbl9zbGljZXNfaCA9IHRydWUsIC8vIERTQyBQb2xpY3k6IFVzZSBtaW5pbXVtIG51bWJl
ciBvZiBzbGljZXMgdGhhdCBmaXRzIHRoZSBwaXhlbCBjbG9jaworCS5tYXhfc2xpY2VzX2ggPSAw
LCAvLyBEU0MgUG9saWN5OiBVc2UgbWF4IGF2YWlsYWJsZSBzbGljZXMgKGluIG91ciBjYXNlIDQg
Zm9yIG9yIDgsIGRlcGVuZGluZyBvbiB0aGUgbW9kZSkKKwkubWluX3NpY2VfaGVpZ2h0ID0gMTA4
LCAvLyBEU0MgUG9saWN5OiBVc2Ugc2xpY2UgaGVpZ2h0IHJlY29tbWVuZGVkIGJ5IFZFU0EgRFND
IFNwcmVhZHNoZWV0IHVzZXIgZ3VpZGUKKwkubWF4X3RhcmdldF9icHAgPSAxNiwKKwkubWluX3Rh
cmdldF9icHAgPSA4LAorfTsKKworCiAvKiBUaGlzIG1vZHVsZSdzIGludGVybmFsIGZ1bmN0aW9u
cyAqLwogCiBzdGF0aWMgYm9vbCBkc2NfYnVmZl9ibG9ja19zaXplX2Zyb21fZHBjZChpbnQgZHBj
ZF9idWZmX2Jsb2NrX3NpemUsIGludCAqYnVmZl9ibG9ja19zaXplKQpAQCAtMjQxLDE0ICsyNTgs
NiBAQCBzdGF0aWMgYm9vbCBpbnRlcnNlY3RfZHNjX2NhcHMoCiAJcmV0dXJuIHRydWU7CiB9CiAK
LXN0cnVjdCBkY19kc2NfcG9saWN5IHsKLQlib29sIHVzZV9taW5fc2xpY2VzX2g7Ci0JaW50IG1h
eF9zbGljZXNfaDsgLy8gTWF4aW11bSBhdmFpbGFibGUgaWYgMAotCWludCBudW1fc2xpY2VzX3Y7
Ci0JaW50IG1heF90YXJnZXRfYnBwOwotCWludCBtaW5fdGFyZ2V0X2JwcDsgLy8gTWluaW11bSB0
YXJnZXQgYml0cyBwZXIgcGl4ZWwKLX07Ci0KIHN0YXRpYyBpbmxpbmUgdWludDMyX3QgZHNjX2Rp
dl9ieV8xMF9yb3VuZF91cCh1aW50MzJfdCB2YWx1ZSkKIHsKIAlyZXR1cm4gKHZhbHVlICsgOSkg
LyAxMDsKQEAgLTI3MCwxOSArMjc5LDYgQEAgc3RhdGljIGlubGluZSB1aW50MzJfdCBjYWxjX2Rz
Y19icHBfeDE2KHVpbnQzMl90IHN0cmVhbV9iYW5kd2lkdGhfa2JwcywgdWludDMyX3QKIAlyZXR1
cm4gZHNjX3RhcmdldF9icHBfeDE2OwogfQogCi1jb25zdCBzdHJ1Y3QgZGNfZHNjX3BvbGljeSBk
c2NfcG9saWN5ID0gewotCS51c2VfbWluX3NsaWNlc19oID0gdHJ1ZSwgLy8gRFNDIFBvbGljeTog
VXNlIG1pbmltdW0gbnVtYmVyIG9mIHNsaWNlcyB0aGF0IGZpdHMgdGhlIHBpeGVsIGNsb2NrCi0J
Lm1heF9zbGljZXNfaCA9IDAsIC8vIERTQyBQb2xpY3k6IFVzZSBtYXggYXZhaWxhYmxlIHNsaWNl
cyAoaW4gb3VyIGNhc2UgNCBmb3Igb3IgOCwgZGVwZW5kaW5nIG9uIHRoZSBtb2RlKQotCS8qIERT
QyBQb2xpY3k6IE51bWJlciBvZiB2ZXJ0aWNhbCBzbGljZXMgc2V0IHRvIDIgZm9yIG5vIHBhcnRp
Y3VsYXIgcmVhc29uLgotCSAqIFNlZW1zIHNtYWxsIGVub3VnaCB0byBub3QgYWZmZWN0IHRoZSBx
dWFsaXR5IHRvbyBtdWNoLCB3aGlsZSBzdGlsbCBwcm92aWRpbmcgc29tZSBlcnJvcgotCSAqIHBy
b3BhZ2F0aW9uIGNvbnRyb2wgKHdoaWNoIG1heSBhbHNvIGhlbHAgZGVidWdnaW5nKS4KLQkgKi8K
LQkubnVtX3NsaWNlc192ID0gMTYsCi0JLm1heF90YXJnZXRfYnBwID0gMTYsCi0JLm1pbl90YXJn
ZXRfYnBwID0gOCwKLX07Ci0KLQogLyogR2V0IERTQyBiYW5kd2lkdGggcmFuZ2UgYmFzZWQgb24g
W21pbl9icHAsIG1heF9icHBdIHRhcmdldCBiaXRyYXRlIHJhbmdlLCBhbmQgdGltaW5nJ3MgcGl4
ZWwgY2xvY2sKICAqIGFuZCB1bmNvbXByZXNzZWQgYmFuZHdpZHRoLgogICovCkBAIC01MjgsOCAr
NTI0LDggQEAgc3RhdGljIGJvb2wgc2V0dXBfZHNjX2NvbmZpZygKIAlpbnQgc2lua19wZXJfc2xp
Y2VfdGhyb3VnaHB1dF9tcHM7CiAJaW50IGJyYW5jaF9tYXhfdGhyb3VnaHB1dF9tcHMgPSAwOwog
CWJvb2wgaXNfZHNjX3Bvc3NpYmxlID0gZmFsc2U7Ci0JaW50IG51bV9zbGljZXNfdjsKIAlpbnQg
cGljX2hlaWdodDsKKwlpbnQgc2xpY2VfaGVpZ2h0OwogCiAJbWVtc2V0KGRzY19jZmcsIDAsIHNp
emVvZihzdHJ1Y3QgZGNfZHNjX2NvbmZpZykpOwogCkBAIC02MTUsNyArNjExLDcgQEAgc3RhdGlj
IGJvb2wgc2V0dXBfZHNjX2NvbmZpZygKIAlpZiAoIWlzX2RzY19wb3NzaWJsZSkKIAkJZ290byBk
b25lOwogCi0JLy8gRFNDIHNsaWNpbmcKKwkvLyBTbGljZSB3aWR0aCAoaS5lLiBudW1iZXIgb2Yg
c2xpY2VzIHBlciBsaW5lKQogCW1heF9zbGljZXNfaCA9IGdldF9tYXhfZHNjX3NsaWNlcyhkc2Nf
Y29tbW9uX2NhcHMuc2xpY2VfY2Fwcyk7CiAKIAl3aGlsZSAobWF4X3NsaWNlc19oID4gMCkgewpA
QCAtNjc4LDI5ICs2NzQsMjYgQEAgc3RhdGljIGJvb2wgc2V0dXBfZHNjX2NvbmZpZygKIAlkc2Nf
Y2ZnLT5udW1fc2xpY2VzX2ggPSBudW1fc2xpY2VzX2g7CiAJc2xpY2Vfd2lkdGggPSBwaWNfd2lk
dGggLyBudW1fc2xpY2VzX2g7CiAKLQkvLyBWZXJ0aWNhbCBudW1iZXIgb2Ygc2xpY2VzOiBzdGFy
dCBmcm9tIHBvbGljeSBhbmQgcGljayB0aGUgZmlyc3Qgb25lIHRoYXQgaGVpZ2h0IGlzIGRpdmlz
aWJsZSBieS4KKwlpc19kc2NfcG9zc2libGUgPSBzbGljZV93aWR0aCA8PSBkc2NfY29tbW9uX2Nh
cHMubWF4X3NsaWNlX3dpZHRoOworCWlmICghaXNfZHNjX3Bvc3NpYmxlKQorCQlnb3RvIGRvbmU7
CisKKwkvLyBTbGljZSBoZWlnaHQgKGkuZS4gbnVtYmVyIG9mIHNsaWNlcyBwZXIgY29sdW1uKTog
c3RhcnQgd2l0aCBwb2xpY3kgYW5kIHBpY2sgdGhlIGZpcnN0IG9uZSB0aGF0IGhlaWdodCBpcyBk
aXZpc2libGUgYnkuCiAJLy8gRm9yIDQ6MjowIG1ha2Ugc3VyZSB0aGUgc2xpY2UgaGVpZ2h0IGlz
IGRpdmlzaWJsZSBieSAyIGFzIHdlbGwuCi0JbnVtX3NsaWNlc192ID0gZHNjX3BvbGljeS5udW1f
c2xpY2VzX3Y7Ci0JaWYgKG51bV9zbGljZXNfdiA8IDEpCi0JCW51bV9zbGljZXNfdiA9IDE7Ci0K
LQl3aGlsZSAobnVtX3NsaWNlc192ID49IDEpIHsKLQkJaWYgKHRpbWluZy0+cGl4ZWxfZW5jb2Rp
bmcgPT0gUElYRUxfRU5DT0RJTkdfWUNCQ1I0MjApIHsKLQkJCWludCBzbGljZV9oZWlnaHQgPSBw
aWNfaGVpZ2h0IC8gbnVtX3NsaWNlc192OwotCQkJaWYgKHBpY19oZWlnaHQgJSBudW1fc2xpY2Vz
X3YgPT0gMCAmJiBzbGljZV9oZWlnaHQgJSAyID09IDApCi0JCQkJYnJlYWs7Ci0JCX0gZWxzZSBp
ZiAocGljX2hlaWdodCAlIG51bV9zbGljZXNfdiA9PSAwKQotCQkJYnJlYWs7CisJc2xpY2VfaGVp
Z2h0ID0gbWluKGRzY19wb2xpY3kubWluX3NpY2VfaGVpZ2h0LCBwaWNfaGVpZ2h0KTsKIAotCQlu
dW1fc2xpY2VzX3YtLTsKLQl9CisJd2hpbGUgKHNsaWNlX2hlaWdodCA8IHBpY19oZWlnaHQgJiYg
KHBpY19oZWlnaHQgJSBzbGljZV9oZWlnaHQgIT0gMCB8fAorCQkodGltaW5nLT5waXhlbF9lbmNv
ZGluZyA9PSBQSVhFTF9FTkNPRElOR19ZQ0JDUjQyMCAmJiBzbGljZV9oZWlnaHQgJSAyICE9IDAp
KSkKKwkJc2xpY2VfaGVpZ2h0Kys7CiAKLQlkc2NfY2ZnLT5udW1fc2xpY2VzX3YgPSBudW1fc2xp
Y2VzX3Y7CisJaWYgKHRpbWluZy0+cGl4ZWxfZW5jb2RpbmcgPT0gUElYRUxfRU5DT0RJTkdfWUNC
Q1I0MjApIC8vIEZvciB0aGUgY2FzZSB3aGVuIHBpY19oZWlnaHQgPCBkc2NfcG9saWN5Lm1pbl9z
aWNlX2hlaWdodAorCQlpc19kc2NfcG9zc2libGUgPSAoc2xpY2VfaGVpZ2h0ICUgMiA9PSAwKTsK
IAotCWlzX2RzY19wb3NzaWJsZSA9IHNsaWNlX3dpZHRoIDw9IGRzY19jb21tb25fY2Fwcy5tYXhf
c2xpY2Vfd2lkdGg7CiAJaWYgKCFpc19kc2NfcG9zc2libGUpCiAJCWdvdG8gZG9uZTsKIAorCWRz
Y19jZmctPm51bV9zbGljZXNfdiA9IHBpY19oZWlnaHQvc2xpY2VfaGVpZ2h0OworCiAJLy8gRmlu
YWwgZGVjaXNzaW9uOiBjYW4gd2UgZG8gRFNDIG9yIG5vdD8KIAlpZiAoaXNfZHNjX3Bvc3NpYmxl
KSB7CiAJCS8vIEZpbGwgb3V0IHRoZSByZXN0IG9mIERTQyBzZXR0aW5ncwotLSAKMi4yMi4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
