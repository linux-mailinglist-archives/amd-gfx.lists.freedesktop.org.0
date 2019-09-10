Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C34EAAEC6C
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Sep 2019 15:55:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 287C48958E;
	Tue, 10 Sep 2019 13:55:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680049.outbound.protection.outlook.com [40.107.68.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A37889310
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2019 13:55:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SMrMBpkpwjnGAjIHG059rY8PgRCQREMl3Z84DiNRJcNoyBUf3cudbKH3vkaXR7bCndkCA5TwuiLo9cIX1q3ecFWNb6cPMb4tGAeMn8XJP/OjlMf3WQOaf6c6lPfDa2tJtIVGP/nI5jhZmzxuB2O795Qf/HEG5rf08e0S4FbOhUju6+8xgk2ggp8MuPd0YfxOW9STa2N5LtjX81elT3BF7Tb44xYhhY76kifrKadHUJR8rrYuTi2vQxT+q/ksdgZpXS6qg3RVNOcdXDymkEipR9ySHFQrNe4UZloJJ6hbB+m+huBo0I4U9+DVrmnze37DmsT/T1leTOZ8OJMHcTyGow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XDxQsxJiPeLm1XKLfysCWq0K8p83jh0lA0LoRo6J+Tc=;
 b=G82aeTGKRAyOPzOl2PFTH5C878JLJIT2DwaFnTGhRseHDP/Fw9fc1ZVnQIISeJ8B/iqz7vVMfzPNj/kXCpqA88tQcsHVNjru8NP+KjSca7xQyYhmHFamjPWWExmWzfP3oktgF+Cfadmnfma/b0lys6xv/bbgJqGX9G66imAuqVIRIoxEhQmt9+Xdxt5eBvZSAHr8X61NXXIQV/67q5QupUOV0NlQ5Ui3PGM9xYs7tkgZwNdPFzE1MYWxDIkjqSqenvCiwq/Kfkavp7Y/neu+clGb4aZmtwHXZ+UyOVS5ixn22JgJSTd8SC0Wd0DenxV1oy3m3Dpw4FWlrI4lx5Gc+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CH2PR12CA0023.namprd12.prod.outlook.com (2603:10b6:610:57::33)
 by MN2PR12MB3935.namprd12.prod.outlook.com (2603:10b6:208:16a::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.15; Tue, 10 Sep
 2019 13:55:02 +0000
Received: from CO1NAM03FT025.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::208) by CH2PR12CA0023.outlook.office365.com
 (2603:10b6:610:57::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.15 via Frontend
 Transport; Tue, 10 Sep 2019 13:55:02 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT025.mail.protection.outlook.com (10.152.80.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2241.14 via Frontend Transport; Tue, 10 Sep 2019 13:55:02 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Tue, 10 Sep 2019 08:54:56 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 10/25] drm/amd/display: Handle virtual signal type in
 disable_link()
Date: Tue, 10 Sep 2019 09:54:30 -0400
Message-ID: <20190910135445.18300-11-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190910135445.18300-1-sunpeng.li@amd.com>
References: <20190910135445.18300-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(376002)(346002)(396003)(2980300002)(428003)(189003)(199004)(2351001)(50466002)(81166006)(81156014)(51416003)(476003)(126002)(2870700001)(2616005)(11346002)(446003)(478600001)(48376002)(2906002)(426003)(36756003)(316002)(336012)(2876002)(26005)(54906003)(50226002)(86362001)(4326008)(8676002)(5660300002)(6916009)(1076003)(53936002)(70206006)(186003)(47776003)(356004)(6666004)(49486002)(76176011)(486006)(14444005)(70586007)(8936002)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3935; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6cb2ffcc-72fa-4d94-377f-08d735f67a40
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:MN2PR12MB3935; 
X-MS-TrafficTypeDiagnostic: MN2PR12MB3935:
X-Microsoft-Antispam-PRVS: <MN2PR12MB393530FA062E5D32051D747A82B60@MN2PR12MB3935.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-Forefront-PRVS: 01565FED4C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: AlNg0EP8GAUyIXhpV9oJ4ccCeYOMROowVUmD5qi/nFO7Pof8Nu/RGxwGn7VomWQujkWpBjNZz5p1o+3eAnUVNHcVZ8Jnwtdt70/pSA7Mo1p0MlU6ytUcRXd9UiVQE1nu8k/ySWv25i0kTaX9X9EQ2vWrvd3PcLbdaT8r23HuEcTL1bdY6xXqYHzNS1k3NU7NCOmTUJAuDHJv7mMYwq67AhG4WizttXDN0aP/qc3nDbYGlOsTO8maQzLTofRLz1yvkFWJWQyWVZpjcGDXA8BYOf17GVBeoKg/xDkVvn3SutlkzJp5shTPEnmAJJBT/6+HfDckaMqZTLVJ7RgCX7+E/7Lju1OMqxNxKl4fPaDQl/bNEsC/ApU4y3Jw0S8iNrsn4FMrFXdXa0oRJlmdUADYJLDOwsOLiy1MHbuUUFC9xR4=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2019 13:55:02.3568 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cb2ffcc-72fa-4d94-377f-08d735f67a40
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3935
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XDxQsxJiPeLm1XKLfysCWq0K8p83jh0lA0LoRo6J+Tc=;
 b=UUPYGX2U9Zx6whU24SnTf0Z/LfuJnpnZgcERD7mDZZRLX5ud+P42c8kFrIFHGO8OObjCNdKJtWN68UuEXSmtYw2hCvl5S1iricSM9uyQ5bWkZZEynRKkBYwsq5hJogct+Ss+3wZdjganwISz+rk2kapVOhcYBpGZELw9ZRBP7YU=
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
Cc: Leo Li <sunpeng.li@amd.com>, Charlene Liu <Charlene.Liu@amd.com>,
 Martin Tsai <martin.tsai@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTWFydGluIFRzYWkgPG1hcnRpbi50c2FpQGFtZC5jb20+CgpbV2h5XQpUaGUgbmV3IGlt
cGxlbWVudGF0aW9uIGNoYW5nZWQgdGhlIGJlaGF2aW9yIHRvIGFsbG93IHByb2Nlc3Mgc2V0TW9k
ZQp0byBEQUwgd2hlbiBEQUwgcmV0dXJucyBlbXB0eSBtb2RlIHF1ZXJ5IGZvciB1bnBsdWdnZWQg
ZGlzcGxheS4KVGhpcyB3aWxsIHRyaWdnZXIgYWRkaXRpb25hbCBkaXNhYmxlX2xpbmsoKS4KV2hl
biB1bnBsdWcgSERNSSBmcm9tIE1TVCBkb2NrLCBkcml2ZXIgd2lsbCB1cGRhdGUgc3RyZWFtLT5z
aWduYWwgdG8KIlZpcnR1YWwiLiBkaXNhYmxlX2xpbmsoKSB3aWxsIGNhbGwgZGlzYWJsZV9vdXRw
dXQoKSBpZiB0aGUgc2lnbmFsIHR5cGUKaXMgbm90IERQIGFuZCBpbmR1Y2Ugb3RoZXIgZGlzcGxh
eXMgb24gTVNUIGRvY2sgc2hvdyBibGFjayBzY3JlZW4uCgpbSG93XQpEb24ndCBuZWVkIHRvIHBy
b2Nlc3MgZGlzYWJsZV9vdXRwdXQoKSBpZiB0aGUgc2lnbmFsIHR5cGUgaXMgdmlydHVhbC4KClNp
Z25lZC1vZmYtYnk6IE1hcnRpbiBUc2FpIDxtYXJ0aW4udHNhaUBhbWQuY29tPgpSZXZpZXdlZC1i
eTogQ2hhcmxlbmUgTGl1IDxDaGFybGVuZS5MaXVAYW1kLmNvbT4KQWNrZWQtYnk6IExlbyBMaSA8
c3VucGVuZy5saUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9j
b3JlL2RjX2xpbmsuYyB8IDYgKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9jb3JlL2RjX2xpbmsuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3Jl
L2RjX2xpbmsuYwppbmRleCAxMzA3YjUzM2EzZjguLmRlMDc1NzcwODVjZSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGluay5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmsuYwpAQCAtMjE2Niw4ICsyMTY2
LDEwIEBAIHN0YXRpYyB2b2lkIGRpc2FibGVfbGluayhzdHJ1Y3QgZGNfbGluayAqbGluaywgZW51
bSBzaWduYWxfdHlwZSBzaWduYWwpCiAJCQlkcF9zZXRfZmVjX3JlYWR5KGxpbmssIGZhbHNlKTsK
IAkJfQogI2VuZGlmCi0JfSBlbHNlCi0JCWxpbmstPmxpbmtfZW5jLT5mdW5jcy0+ZGlzYWJsZV9v
dXRwdXQobGluay0+bGlua19lbmMsIHNpZ25hbCk7CisJfSBlbHNlIHsKKwkJaWYgKHNpZ25hbCAh
PSBTSUdOQUxfVFlQRV9WSVJUVUFMKQorCQkJbGluay0+bGlua19lbmMtPmZ1bmNzLT5kaXNhYmxl
X291dHB1dChsaW5rLT5saW5rX2VuYywgc2lnbmFsKTsKKwl9CiAKIAlpZiAoc2lnbmFsID09IFNJ
R05BTF9UWVBFX0RJU1BMQVlfUE9SVF9NU1QpIHsKIAkJLyogTVNUIGRpc2FibGUgbGluayBvbmx5
IHdoZW4gbm8gc3RyZWFtIHVzZSB0aGUgbGluayAqLwotLSAKMi4yMi4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
