Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF02669DA6
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:21:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB3C489BFE;
	Mon, 15 Jul 2019 21:21:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680053.outbound.protection.outlook.com [40.107.68.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9256489BF3
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:21:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T+XFa+FvlA5MosAgti0Bp8+sOfm/ag2Xc2cnqhLm4Lv9EHIFAeeJ2OekcVZ6WcJO70tCJLYCi6C9A1FUz91T7PB87tps1vensO7n4zsaBh31TF1CGJ7K5ypAGFJ2R6Gfpv0EhP//gPshtqCyIq+6wc5IADfHWY/W5nBOzAIwgZYDSjwEInJQpUvjUsQvTDzRNrSwhUeAtIa1kFGWVsZmSbp1XflcyKh0IN/RyJ7VNenu5p05YnUXSWB18poE+Mgp5dfsz6BNaePmW3hBYWuqhVJ3ex8SBIn9v8fm71Njkcs4NncoBy05oSAteTXqNTC+nrynTEtKIiM+B+/r9n5qYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rRELIHRj4Zms4aysiAR6dcTn5Rj8G39g0lssCR99mOM=;
 b=dFMRXQ6pE17YfgIy6cOUThoed7+LpxGWcL5m2EzEoCMrJUQ0gm3lsOs6oqRo2nbt59THNc9PpmGte13A779Sqbe0MOza/fxuxR4VlR5TK2xZ1sOkPCRXPhP2G/zJsgEy8OxvwCEyldbJeh8ctuVd+u/Cc7mhOO0RS1wB9BBC+iwwgE7J2yXVZlOuV7qMHNgvKKzZXK66ElCbraSg5c74vWgxXirtbaoG02nywpYucrVCI7k9jyrEwmNi6zFWk6Fe4QOtLb9h9GrFT2gEV6avS4HPJfAZD1uDjPt1F1Fn5b84v4QzzlFzhkAKk5Vxb1ctfnB/XW0/LSbjnvmEAwh1hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from MWHPR12CA0041.namprd12.prod.outlook.com (2603:10b6:301:2::27)
 by BN6PR12MB1921.namprd12.prod.outlook.com (2603:10b6:404:fe::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.13; Mon, 15 Jul
 2019 21:21:20 +0000
Received: from CO1NAM03FT009.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::209) by MWHPR12CA0041.outlook.office365.com
 (2603:10b6:301:2::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.14 via Frontend
 Transport; Mon, 15 Jul 2019 21:21:20 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT009.mail.protection.outlook.com (10.152.80.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 15 Jul 2019 21:21:20 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 15 Jul 2019 16:21:08 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 14/87] drm/amd/display: Set one 4:2:0-related PPS field as
 recommended by DSC spec
Date: Mon, 15 Jul 2019 17:19:36 -0400
Message-ID: <20190715212049.4584-15-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715212049.4584-1-sunpeng.li@amd.com>
References: <20190715212049.4584-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(396003)(39860400002)(346002)(2980300002)(428003)(189003)(199004)(53936002)(70586007)(6916009)(2876002)(76176011)(70206006)(51416003)(316002)(86362001)(486006)(54906003)(5660300002)(305945005)(68736007)(478600001)(1076003)(11346002)(446003)(50466002)(47776003)(2870700001)(6666004)(50226002)(356004)(49486002)(81156014)(81166006)(36756003)(186003)(426003)(2906002)(48376002)(8676002)(2616005)(336012)(4326008)(126002)(2351001)(476003)(8936002)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1921; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 941c5ac8-6fa5-4982-0141-08d7096a618b
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN6PR12MB1921; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1921:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1921BDCA6A3180DDFCD0005B82CF0@BN6PR12MB1921.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-Forefront-PRVS: 00997889E7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: zXLGmBJ7YDSSaE88LhtAjD8sww+BTS3sSOh7MSTKaJuKWM3oZqlHMTI9+1pYG2wneq5Gp15j+a7qezTgvrr43eA+viVaDIKaiupElTE/Eu2wbMyn1K6uJqDaGwt3oWZwpjgBE98zzOnsjWa789BGkEendi7otwIfCRNfRcKpnoY524ONBEdbrQbDL93iStJ5FTmQ9cafbcqqmcd0uPhmTdJcl8GhQ7dWidi1fVPTPEqZF8xmIgguVuOwNdOvTX3AAorS5cAmGdHcrkSP6Bn+MK/QDR6s1rO60APYWiGsZCwC/D3EUzosE+h245RVThHZCw49awr0sph93ivXjzA4I5kpxMQeTaf/l4uDtWjobikJRetCHzgJCce1SlK62EO6IoT1SbL35Rth0M9Gk2MfwD91XRP9b+dWPdllnqioxo8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2019 21:21:20.2006 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 941c5ac8-6fa5-4982-0141-08d7096a618b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1921
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rRELIHRj4Zms4aysiAR6dcTn5Rj8G39g0lssCR99mOM=;
 b=rDuNnvlgidfm38mVpI45sUNIyPOY01GJe6lVw1EAs3Fa/oFqbPgF/lkO2lR2tYAMJF5Oi4pWsuDGf04W620DWJG8lMd+faFByhPkuobVq/63+/DNPlacEWIXGvwwS+RqAr4rF2DkwlnvpKKNP3riBaj/ezfQRnJrQ49c1oLgGzI=
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
Cc: Leo Li <sunpeng.li@amd.com>, Eric Bernstein <Eric.Bernstein@amd.com>,
 Nikola Cornij <nikola.cornij@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTmlrb2xhIENvcm5paiA8bmlrb2xhLmNvcm5pakBhbWQuY29tPgoKW3doeV0KJ3NlY29u
ZF9saW5lX29mZnNldF9hZGonIHdhcyBtaXN0YWtlbmx5IGxlZnQgYXQgemVybywgZXZlbiB0aG91
Z2ggRFNDIHNwZWMKdjEuMmEgcmVjb21tZW5kcyBzZXR0aW5nIHRoaXMgZmllbGQgdG8gNTEyIGZv
ciA0OjI6MC4KCltob3ddClNldCAnc2Vjb25kX2xpbmVfb2Zmc2V0X2FkaicgdG8gNTEyIGZvciA0
OjI6MCBhbmQgbGVhdmUgYXQgemVybyBvdGhlcndpc2UKClNpZ25lZC1vZmYtYnk6IE5pa29sYSBD
b3JuaWogPG5pa29sYS5jb3JuaWpAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEVyaWMgQmVybnN0ZWlu
IDxFcmljLkJlcm5zdGVpbkBhbWQuY29tPgpBY2tlZC1ieTogTGVvIExpIDxzdW5wZW5nLmxpQGFt
ZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RzYy9kcm1fZHNjX2Rj
LmMgfCA2ICsrKysrKwogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kc2MvZHJtX2RzY19kYy5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RzYy9kcm1fZHNjX2RjLmMKaW5kZXggMDRjNjI5
NWYyOTZlLi5mZDFmYjE2NTM0NzkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9kc2MvZHJtX2RzY19kYy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9kc2MvZHJtX2RzY19kYy5jCkBAIC00NDIsNiArNDQyLDEyIEBAIGludCBkcm1fZHNjX2Nv
bXB1dGVfcmNfcGFyYW1ldGVycyhzdHJ1Y3QgZHJtX2RzY19jb25maWcgKnZkc2NfY2ZnKQogCXZk
c2NfY2ZnLT5yY19iaXRzID0gKGhyZF9kZWxheSAqIHZkc2NfY2ZnLT5iaXRzX3Blcl9waXhlbCkg
LyAxNjsKIAl2ZHNjX2NmZy0+aW5pdGlhbF9kZWNfZGVsYXkgPSBocmRfZGVsYXkgLSB2ZHNjX2Nm
Zy0+aW5pdGlhbF94bWl0X2RlbGF5OwogCisJLyogQXMgcGVyIERTQyBzcGVjIHYxLjJhIHJlY29t
bWVuZGF0aW9uOiAqLworCWlmICh2ZHNjX2NmZy0+bmF0aXZlXzQyMCkKKwkJdmRzY19jZmctPnNl
Y29uZF9saW5lX29mZnNldF9hZGogPSA1MTI7CisJZWxzZQorCQl2ZHNjX2NmZy0+c2Vjb25kX2xp
bmVfb2Zmc2V0X2FkaiA9IDA7CisKIAlyZXR1cm4gMDsKIH0KIEVYUE9SVF9TWU1CT0woZHJtX2Rz
Y19jb21wdXRlX3JjX3BhcmFtZXRlcnMpOwotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=
