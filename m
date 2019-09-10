Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D99CAF191
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Sep 2019 21:06:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C18046E96B;
	Tue, 10 Sep 2019 19:06:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810082.outbound.protection.outlook.com [40.107.81.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 199056E968
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2019 19:06:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XK7upaL3d4GJTeGwc1+rO6wdRgueQedoukKUpubkqt8uprD+a5XsADv+rhl7i5O7P4JMW0k1YX+UCFNKf/taB3YtU2mV5KpTnSCKIAH92wTrwuVZhLqpwgBcVRrz+df4NwhuvRuWdmhKXZ9xqgujOqLLTgLby21qOvN6XEuR/+yh1ykJuCJvB6B1CN0RY4jEu2ONqsZSh0Pj6vmT29IqM7LyF6IbtFMiGI3PQ6KjpjzddyLJfam7DPI6SpbvIZ9PcEfu3XQ3TNIKRMbpsX++GZ1Z9FxeyZ5O/hjr07SMDnDKwg44bUQwKAwlc1CiU0rcDXZsNPdv/tm20eXe/DWv0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v/jW/e6HgpGlBx4kUI96l8MdGdhj50m/Ebh88gjvaD0=;
 b=OAffBs2kaSJ10vv2rNdkaZAxRnumyu8m2maNJu+HvQRP1xM/KQIj3BUkG6fCfctpazA5qJa+WsqsDQS/LLI9Pts/pYp5KG1JvpYGM/T6SgRfD6WZzsSyTVvMO2D4ySO00ML7kFg5eaNfh3q7tpzsScjzmKDqvCcaHc2BAuX9mqdwhtWXEcmB7u8dMpTCJ2pIMXlPkM8T+GrJaNjYE3fvaSkS04+3J2KFP6JCqJOWjmXsB7ShSRr9C+5QQ3CwX4UnoYqj3sN9Ukwko7xI74jPMH8B4ZSC/J3w5FMQyWUxDfAX0Mrm4NsnTS/3Rvj27gt8c92BVgr5d7IXtJDVR0ZyhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR1201CA0012.namprd12.prod.outlook.com
 (2603:10b6:301:4a::22) by DM6PR12MB2986.namprd12.prod.outlook.com
 (2603:10b6:5:116::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.18; Tue, 10 Sep
 2019 19:06:14 +0000
Received: from DM3NAM03FT020.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::203) by MWHPR1201CA0012.outlook.office365.com
 (2603:10b6:301:4a::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.14 via Frontend
 Transport; Tue, 10 Sep 2019 19:06:14 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT020.mail.protection.outlook.com (10.152.82.193) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2241.14 via Frontend Transport; Tue, 10 Sep 2019 19:06:14 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Tue, 10 Sep 2019
 14:06:13 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 01/20] drm: move content protection property to mode_config
Date: Tue, 10 Sep 2019 15:05:35 -0400
Message-ID: <20190910190554.1539-2-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190910190554.1539-1-Bhawanpreet.Lakha@amd.com>
References: <20190829162253.10195-10-Bhawanpreet.Lakha@amd.com>
 <20190910190554.1539-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(396003)(376002)(346002)(2980300002)(428003)(189003)(199004)(7696005)(5024004)(186003)(8936002)(6666004)(356004)(8676002)(81166006)(81156014)(478600001)(36756003)(966005)(2351001)(1076003)(26005)(48376002)(4326008)(446003)(47776003)(50466002)(86362001)(336012)(426003)(126002)(11346002)(70206006)(2616005)(70586007)(476003)(53936002)(6306002)(486006)(305945005)(53416004)(50226002)(316002)(2906002)(5660300002)(76176011)(54906003)(16586007)(51416003)(6916009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2986; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c169806b-6bea-42cb-fba4-08d73621f375
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:DM6PR12MB2986; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB2986:
X-MS-Exchange-PUrlCount: 1
X-Microsoft-Antispam-PRVS: <DM6PR12MB2986183505984B53A069B0B9F9B60@DM6PR12MB2986.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-Forefront-PRVS: 01565FED4C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: Fs2b9rqBy4IzHaxLhJOyaFDUb4Gl0NPY9r0itdb/+n4WbE37cC5ibwExK5ki40FrAs8M+Xv9KAYfjmnsc5MF6G3LGWvTNFkmhT8+UEOOxDE9hKO9aLyOd736mXNYXO4PydDZoIYunLDrcxGSOcp6sqZM9KiGegYmGwiH+hln/l6DmuKQK5XiVy2Y3/0Ib01vckRMKas8CSauvv+m4yOKavnCtg6tKwjFtPG6TLiyjTjgruFTgJe023pUVedozWCGg3lAMOiZh6tNBiEt8IrOzk+qbLrNoq4qPSQKakbDwh6NIgsYdd08cLu8ni/7BUZy+wTgrq/yH52llbJMvKjiqI3+bcjgm571t5Zg5NtmzF26538k/Z3akbO1nE3kCAHUDWc/GA7uz0N07pI/Gfrx43H7/AZebnr2y+pE/AG7954=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2019 19:06:14.0308 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c169806b-6bea-42cb-fba4-08d73621f375
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2986
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v/jW/e6HgpGlBx4kUI96l8MdGdhj50m/Ebh88gjvaD0=;
 b=wn6UFwMCRvQt0ljrTCN03B0yCpn4QpkrYcGpm1DjZEYlq1bGH/lzilKq2V9D/E4qNfl7Sk31k6zEPnv5WlVRN9tZSWqCs1e1lxLv0IxPjD0HK3uNOA7VFySm0G4ahXqQrE3VjR3s1btaxdW70q02tRboFYsO97EPxK8EkpftpYc=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=permerror action=none header.from=amd.com;
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
Cc: Ramalingam C <ramalingam.c@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogUmFtYWxpbmdhbSBDIDxyYW1hbGluZ2FtLmNAaW50ZWwuY29tPgoKQ29udGVudCBwcm90
ZWN0aW9uIHByb3BlcnR5IGlzIGNyZWF0ZWQgb25jZSBhbmQgc3RvcmVkIGluCmRybV9tb2RlX2Nv
bmZpZy4gQW5kIGF0dGFjaGVkIHRvIGFsbCBIRENQIGNhcGFibGUgY29ubmVjdG9ycy4KClNpZ25l
ZC1vZmYtYnk6IFJhbWFsaW5nYW0gQyA8cmFtYWxpbmdhbS5jQGludGVsLmNvbT4KUmV2aWV3ZWQt
Ynk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+CkFja2VkLWJ5OiBEYXZl
IEFpcmxpZSA8YWlybGllZEBnbWFpbC5jb20+ClNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIg
PGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Ckxpbms6IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNr
dG9wLm9yZy9wYXRjaC9tc2dpZC8yMDE5MDUwNzE2Mjc0NS4yNTYwMC0yLXJhbWFsaW5nYW0uY0Bp
bnRlbC5jb20KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY191YXBpLmMgfCAgNCArKy0t
CiBkcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jICAgfCAxMyArKysrKysrLS0tLS0tCiBp
bmNsdWRlL2RybS9kcm1fY29ubmVjdG9yLmggICAgICAgfCAgNiAtLS0tLS0KIGluY2x1ZGUvZHJt
L2RybV9tb2RlX2NvbmZpZy5oICAgICB8ICA2ICsrKysrKwogNCBmaWxlcyBjaGFuZ2VkLCAxNSBp
bnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vZHJtX2F0b21pY191YXBpLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY191YXBpLmMK
aW5kZXggNDI4ZDgyNjYyZGM0Li40MTMxZTY2OTc4NWEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9kcm1fYXRvbWljX3VhcGkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY191
YXBpLmMKQEAgLTczMiw3ICs3MzIsNyBAQCBzdGF0aWMgaW50IGRybV9hdG9taWNfY29ubmVjdG9y
X3NldF9wcm9wZXJ0eShzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLAogCQlzdGF0ZS0+
Y29udGVudF90eXBlID0gdmFsOwogCX0gZWxzZSBpZiAocHJvcGVydHkgPT0gY29ubmVjdG9yLT5z
Y2FsaW5nX21vZGVfcHJvcGVydHkpIHsKIAkJc3RhdGUtPnNjYWxpbmdfbW9kZSA9IHZhbDsKLQl9
IGVsc2UgaWYgKHByb3BlcnR5ID09IGNvbm5lY3Rvci0+Y29udGVudF9wcm90ZWN0aW9uX3Byb3Bl
cnR5KSB7CisJfSBlbHNlIGlmIChwcm9wZXJ0eSA9PSBjb25maWctPmNvbnRlbnRfcHJvdGVjdGlv
bl9wcm9wZXJ0eSkgewogCQlpZiAodmFsID09IERSTV9NT0RFX0NPTlRFTlRfUFJPVEVDVElPTl9F
TkFCTEVEKSB7CiAJCQlEUk1fREVCVUdfS01TKCJvbmx5IGRyaXZlcnMgY2FuIHNldCBDUCBFbmFi
bGVkXG4iKTsKIAkJCXJldHVybiAtRUlOVkFMOwpAQCAtODE0LDcgKzgxNCw3IEBAIGRybV9hdG9t
aWNfY29ubmVjdG9yX2dldF9wcm9wZXJ0eShzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9y
LAogCQkqdmFsID0gc3RhdGUtPmNvbG9yc3BhY2U7CiAJfSBlbHNlIGlmIChwcm9wZXJ0eSA9PSBj
b25uZWN0b3ItPnNjYWxpbmdfbW9kZV9wcm9wZXJ0eSkgewogCQkqdmFsID0gc3RhdGUtPnNjYWxp
bmdfbW9kZTsKLQl9IGVsc2UgaWYgKHByb3BlcnR5ID09IGNvbm5lY3Rvci0+Y29udGVudF9wcm90
ZWN0aW9uX3Byb3BlcnR5KSB7CisJfSBlbHNlIGlmIChwcm9wZXJ0eSA9PSBjb25maWctPmNvbnRl
bnRfcHJvdGVjdGlvbl9wcm9wZXJ0eSkgewogCQkqdmFsID0gc3RhdGUtPmNvbnRlbnRfcHJvdGVj
dGlvbjsKIAl9IGVsc2UgaWYgKHByb3BlcnR5ID09IGNvbmZpZy0+d3JpdGViYWNrX2ZiX2lkX3By
b3BlcnR5KSB7CiAJCS8qIFdyaXRlYmFjayBmcmFtZWJ1ZmZlciBpcyBvbmUtc2hvdCwgd3JpdGUg
YW5kIGZvcmdldCAqLwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3Iu
YyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fY29ubmVjdG9yLmMKaW5kZXggYjM0YzNkMzhiZjE1Li4w
NDkwYzIwNDEyMmQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fY29ubmVjdG9yLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3IuYwpAQCAtMTUyOCwxOCArMTUyOCwx
OSBAQCBpbnQgZHJtX2Nvbm5lY3Rvcl9hdHRhY2hfY29udGVudF9wcm90ZWN0aW9uX3Byb3BlcnR5
KAogCQlzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQogewogCXN0cnVjdCBkcm1fZGV2
aWNlICpkZXYgPSBjb25uZWN0b3ItPmRldjsKLQlzdHJ1Y3QgZHJtX3Byb3BlcnR5ICpwcm9wOwor
CXN0cnVjdCBkcm1fcHJvcGVydHkgKnByb3AgPQorCQkJZGV2LT5tb2RlX2NvbmZpZy5jb250ZW50
X3Byb3RlY3Rpb25fcHJvcGVydHk7CiAKLQlwcm9wID0gZHJtX3Byb3BlcnR5X2NyZWF0ZV9lbnVt
KGRldiwgMCwgIkNvbnRlbnQgUHJvdGVjdGlvbiIsCi0JCQkJCWRybV9jcF9lbnVtX2xpc3QsCi0J
CQkJCUFSUkFZX1NJWkUoZHJtX2NwX2VudW1fbGlzdCkpOworCWlmICghcHJvcCkKKwkJcHJvcCA9
IGRybV9wcm9wZXJ0eV9jcmVhdGVfZW51bShkZXYsIDAsICJDb250ZW50IFByb3RlY3Rpb24iLAor
CQkJCQkJZHJtX2NwX2VudW1fbGlzdCwKKwkJCQkJCUFSUkFZX1NJWkUoZHJtX2NwX2VudW1fbGlz
dCkpOwogCWlmICghcHJvcCkKIAkJcmV0dXJuIC1FTk9NRU07CiAKIAlkcm1fb2JqZWN0X2F0dGFj
aF9wcm9wZXJ0eSgmY29ubmVjdG9yLT5iYXNlLCBwcm9wLAogCQkJCSAgIERSTV9NT0RFX0NPTlRF
TlRfUFJPVEVDVElPTl9VTkRFU0lSRUQpOwotCi0JY29ubmVjdG9yLT5jb250ZW50X3Byb3RlY3Rp
b25fcHJvcGVydHkgPSBwcm9wOworCWRldi0+bW9kZV9jb25maWcuY29udGVudF9wcm90ZWN0aW9u
X3Byb3BlcnR5ID0gcHJvcDsKIAogCXJldHVybiAwOwogfQpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9k
cm0vZHJtX2Nvbm5lY3Rvci5oIGIvaW5jbHVkZS9kcm0vZHJtX2Nvbm5lY3Rvci5oCmluZGV4IDAy
YTEzMTIwMmFkZC4uNWU0MTk0MmU1Njc5IDEwMDY0NAotLS0gYS9pbmNsdWRlL2RybS9kcm1fY29u
bmVjdG9yLmgKKysrIGIvaW5jbHVkZS9kcm0vZHJtX2Nvbm5lY3Rvci5oCkBAIC0xMDYxLDEyICsx
MDYxLDYgQEAgc3RydWN0IGRybV9jb25uZWN0b3IgewogCSAqLwogCXN0cnVjdCBkcm1fcHJvcGVy
dHkgKnZycl9jYXBhYmxlX3Byb3BlcnR5OwogCi0JLyoqCi0JICogQGNvbnRlbnRfcHJvdGVjdGlv
bl9wcm9wZXJ0eTogRFJNIEVOVU0gcHJvcGVydHkgZm9yIGNvbnRlbnQKLQkgKiBwcm90ZWN0aW9u
LiBTZWUgZHJtX2Nvbm5lY3Rvcl9hdHRhY2hfY29udGVudF9wcm90ZWN0aW9uX3Byb3BlcnR5KCku
Ci0JICovCi0Jc3RydWN0IGRybV9wcm9wZXJ0eSAqY29udGVudF9wcm90ZWN0aW9uX3Byb3BlcnR5
OwotCiAJLyoqCiAJICogQGNvbG9yc3BhY2VfcHJvcGVydHk6IENvbm5lY3RvciBwcm9wZXJ0eSB0
byBzZXQgdGhlIHN1aXRhYmxlCiAJICogY29sb3JzcGFjZSBzdXBwb3J0ZWQgYnkgdGhlIHNpbmsu
CmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fbW9kZV9jb25maWcuaCBiL2luY2x1ZGUvZHJt
L2RybV9tb2RlX2NvbmZpZy5oCmluZGV4IDdmNjBlOGViMjY5YS4uNTc2NGVlM2M3NDUzIDEwMDY0
NAotLS0gYS9pbmNsdWRlL2RybS9kcm1fbW9kZV9jb25maWcuaAorKysgYi9pbmNsdWRlL2RybS9k
cm1fbW9kZV9jb25maWcuaApAQCAtODM2LDYgKzgzNiwxMiBAQCBzdHJ1Y3QgZHJtX21vZGVfY29u
ZmlnIHsKIAkgKi8KIAlzdHJ1Y3QgZHJtX3Byb3BlcnR5ICp3cml0ZWJhY2tfb3V0X2ZlbmNlX3B0
cl9wcm9wZXJ0eTsKIAorCS8qKgorCSAqIEBjb250ZW50X3Byb3RlY3Rpb25fcHJvcGVydHk6IERS
TSBFTlVNIHByb3BlcnR5IGZvciBjb250ZW50CisJICogcHJvdGVjdGlvbi4gU2VlIGRybV9jb25u
ZWN0b3JfYXR0YWNoX2NvbnRlbnRfcHJvdGVjdGlvbl9wcm9wZXJ0eSgpLgorCSAqLworCXN0cnVj
dCBkcm1fcHJvcGVydHkgKmNvbnRlbnRfcHJvdGVjdGlvbl9wcm9wZXJ0eTsKKwogCS8qIGR1bWIg
aW9jdGwgcGFyYW1ldGVycyAqLwogCXVpbnQzMl90IHByZWZlcnJlZF9kZXB0aCwgcHJlZmVyX3No
YWRvdzsKIAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
Zng=
