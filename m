Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAC5A20BD
	for <lists+amd-gfx@lfdr.de>; Thu, 29 Aug 2019 18:23:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43CBB6E0C1;
	Thu, 29 Aug 2019 16:23:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700062.outbound.protection.outlook.com [40.107.70.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3FAC6E0C1
 for <amd-gfx@lists.freedesktop.org>; Thu, 29 Aug 2019 16:23:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d0eg2G1izeDDVcb2DqCIqg7qa3NtIcqXZCFYHYZjfrZPpqXWEhVwX6CQW0qu9LrQ/HxB+mKcVOie0EodaT5EeOB/s8OLq3ovUglyI9aS/ARVmyBoLUHWGb40YLXM2U1OSfEc5JinEK2uaR++IQOp1KkzOFHxDkxsjPa4T+q/ZvpF39hTzdqwUTQN73sO5K0PyNhabWuubQGvoBLNIWoY01V5RYULzhm7mRA4GhjXEl5ofTEJH1k0WRV/iOkR/8Zqq4kfxTmS7fiRsLli2v5rF0CKy6XgF7oJQRQ/LrrhbfSS7HWYS9C0bVtXiQXXmheD4BNUYjwVD4LFIZcFJUq2Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v/jW/e6HgpGlBx4kUI96l8MdGdhj50m/Ebh88gjvaD0=;
 b=RZc2+rrrBgAl3MdZnZU8MTdXiNcf9VRy9r4uU4TDGw97Sf8xMJFOPDU8ix6dpt97pHRzbDaFqw+6NJrF8Uq+NNqrY5wkQ033ldc/3grVoDGebfNo5PBw/Tl5PwkUX3S7F4iLPBOZfOfFuFEKxbg22lCpTkKtZeADLPNl7YgJJHkiWfV9lmr06a3Px5d9Md9n20I2F8ZiRzvU8kGUdAVwp4seQ29PZyRO1t/IzNVrEiHeLWj7yUFIpw45E8tqgUo2eOSCSGngxNHFRgkt8Xps+8WjTkVRLRBd9WtsUZwIg7EwNBTCJANjvycPzf9WYN+/R3Q0HMw3WCVn6uJwhakOfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN4PR12CA0017.namprd12.prod.outlook.com (2603:10b6:403:2::27)
 by DM6PR12MB2715.namprd12.prod.outlook.com (2603:10b6:5:4a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.21; Thu, 29 Aug
 2019 16:23:49 +0000
Received: from BY2NAM03FT007.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::207) by BN4PR12CA0017.outlook.office365.com
 (2603:10b6:403:2::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.15 via Frontend
 Transport; Thu, 29 Aug 2019 16:23:48 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT007.mail.protection.outlook.com (10.152.84.70) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2220.16 via Frontend Transport; Thu, 29 Aug 2019 16:23:48 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 29 Aug 2019
 11:23:41 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 01/20] drm: move content protection property to mode_config
Date: Thu, 29 Aug 2019 12:22:34 -0400
Message-ID: <20190829162253.10195-2-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190829162253.10195-1-Bhawanpreet.Lakha@amd.com>
References: <20190829162253.10195-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(376002)(39860400002)(136003)(2980300002)(428003)(189003)(199004)(426003)(446003)(2351001)(305945005)(8936002)(5024004)(316002)(2906002)(4326008)(8676002)(76176011)(48376002)(16586007)(50466002)(53936002)(7696005)(51416003)(50226002)(53416004)(6306002)(54906003)(86362001)(478600001)(356004)(11346002)(2616005)(186003)(1076003)(5660300002)(6666004)(966005)(70206006)(6916009)(486006)(47776003)(70586007)(336012)(26005)(126002)(81156014)(476003)(81166006)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2715; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d0415ac-925c-4aac-1479-08d72c9d45af
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:DM6PR12MB2715; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB2715:
X-MS-Exchange-PUrlCount: 1
X-Microsoft-Antispam-PRVS: <DM6PR12MB2715F95624FCE489E440D617F9A20@DM6PR12MB2715.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-Forefront-PRVS: 0144B30E41
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: CMw62rfLepErhhECe76Ixu4Ss/kUHsPkaMTtO9X+WwYjcOx10iqgbwCBJnEf3RYC9RCH31/UDYAZkwsWsw2B9NJV79q4polsBk5QNYEThNBAt0VsJcxXDBKYqyRtqy/dDFCHjcAl7khPsQJe/QFm2b530iV1waOnJkYVL2kYgMeX2MMlxK+4ZCD6lBXoudIEAwBlLvvqG/iwEE5seC08dSM5BAiHRjpFeaLjEPkfP1vBGB81rTYYFYxgxSyGo/0kRtufbn9QJt8ZL7j2HkAf/HW7AYK5rhYGqmHlt5/+Ll6DxCum+kOHrDShGqYJkkoXTfBGkTcgH5JoMX98cweQfQyNc3L61FUm3dvosaVKDkhuCBYYO+x7AFNVVmsudh/Xb0SHgWZX+btS7qeZtGfE30kunMsY3lMwcc440rSVyQE=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2019 16:23:48.5112 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d0415ac-925c-4aac-1479-08d72c9d45af
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2715
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v/jW/e6HgpGlBx4kUI96l8MdGdhj50m/Ebh88gjvaD0=;
 b=MGP45t7+SF3Ofd8Q5cwPtsEscwdeRhHwT81T+cbVVrHFKJinlN2AmXzHRiLp23VvBO93EUWXAv75bwv+HdYz1C4UuWpRcDLcPpoamKtf5P7B4pXueKleWbk6FodC04RNYK/k8vd39trqEaM+IhIF0ZHlERVFNBhFB7CtreTb0Aw=
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
