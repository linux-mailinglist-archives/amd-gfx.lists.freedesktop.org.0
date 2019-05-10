Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 980841A22C
	for <lists+amd-gfx@lfdr.de>; Fri, 10 May 2019 19:20:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EC5F89F31;
	Fri, 10 May 2019 17:20:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690040.outbound.protection.outlook.com [40.107.69.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1951889F31
 for <amd-gfx@lists.freedesktop.org>; Fri, 10 May 2019 17:20:14 +0000 (UTC)
Received: from DM3PR12CA0053.namprd12.prod.outlook.com (2603:10b6:0:56::21) by
 MWHPR1201MB0062.namprd12.prod.outlook.com (2603:10b6:301:54::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1878.21; Fri, 10 May
 2019 17:20:12 +0000
Received: from CO1NAM03FT005.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::204) by DM3PR12CA0053.outlook.office365.com
 (2603:10b6:0:56::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1878.21 via Frontend
 Transport; Fri, 10 May 2019 17:20:12 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT005.mail.protection.outlook.com (10.152.80.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Fri, 10 May 2019 17:20:10 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Fri, 10 May 2019
 12:20:09 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 00/16] DC Patches 10 May 2019
Date: Fri, 10 May 2019 13:19:19 -0400
Message-ID: <20190510171935.19792-1-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(39860400002)(136003)(346002)(376002)(396003)(2980300002)(428003)(199004)(189003)(53936002)(70586007)(478600001)(72206003)(4326008)(50466002)(48376002)(14444005)(81166006)(6916009)(316002)(81156014)(8676002)(50226002)(47776003)(36756003)(8936002)(16586007)(2351001)(126002)(476003)(356004)(336012)(2906002)(6666004)(305945005)(26005)(70206006)(426003)(1076003)(77096007)(186003)(53416004)(486006)(86362001)(2616005)(5660300002)(51416003)(7696005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR1201MB0062; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:ErrorRetry; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b1ce74d1-d727-4a72-2bcb-08d6d56bc1a5
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:MWHPR1201MB0062; 
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0062:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB006215D376844BBD0B322925F90C0@MWHPR1201MB0062.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:843;
X-Forefront-PRVS: 0033AAD26D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: sOOpVUuUlg5Jzt5Yt7pjrz9CyNfuF28THMugCb7oxoFcRIN5vvekwkR9FaobsXubdDHwEgO4/Oh0dSwHZGyfgikJOCiJhRQpXA4YNrBnh1Up/XU+bVKeG6e/frA0eBAhrE75eUUzg+eqZdEk8pjKxmwBHqXrb3HFRY8W+RFc1j2QMVTHoKRskUojJQnliVru/rPWzFAN8X0wDaO3dTqcKMvA0UUfPQ+F8cRfQRsTjKYDMSQp3YtT5ZQhmnaVt1QHotVcc6e3XIprSN1hZcuh4qdsdSw0zHqF1LlsHPIZy1p1PrLTfZXbTUqK2uXrXchc8P9SR+QadVGHrymccuslU/0EYJ0Ybs8IaxWde+zTnkyKNbKbHTX0JBM/RnMDCCRMfVwEmDYPfuQuXa31JlO+U/tybVOu6SNa86CZNd5cg64=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2019 17:20:10.4736 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1ce74d1-d727-4a72-2bcb-08d6d56bc1a5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0062
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QI25uSPi6sVVxMtJfm8nhWAJ4rXNPX8ch+Jr9gDbE/0=;
 b=dC8G8oCl2BuQDKjh+5Ostygzo6dbYHx0IRz7ddQtu8GWqpqstSV4VioAPcOHqN7qWmnT7GwCYuC+MdrQNi9BUjGge4ja1eTkEMTeZ4bntp9sWTBgVXefvKZMIeGqdtrQySiRPqg3M3ACC3ZmLgEv/FBHMHlZhxqt0dthqc+ScUY=
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
Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U3VtbWFyeSBPZiBDaGFuZ2VzCiogQ1JDIGNhcHR1cmUgZm9yIGRjZTExMgoqIEVESUQgcmVhZCBy
ZWZhY3RvcgoqIEV4cGxpY2l0IHVwZGF0ZSB0eXBlIGZvciBwbGFuZXMKCkFyaWMgQ3lyICgzKToK
ICBkcm0vYW1kL2Rpc3BsYXk6IDMuMi4zMAogIGRybS9hbWQvZGlzcGxheTogVXNlIFZDUCBmb3Ig
ZXh0ZW5kZWQgY29sb3JpbWV0cnkKICBkcm0vYW1kL2Rpc3BsYXk6IDMuMi4zMQoKQ2hhcmxlbmUg
TGl1ICgyKToKICBkcm0vYW1kL2Rpc3BsYXk6IGRlZmluZSB2X3RvdGFsX21pbiBhbmQgbWF4IHBh
cmFtZXRlcnMKICBkcm0vYW1kL2Rpc3BsYXk6IGVuYWJsaW5nIHN0cmVhbSBhZnRlciBIUEQgbG93
IHRvIGhpZ2ggaGFwcGVuZWQKCkRteXRybyBMYWt0eXVzaGtpbiAoMSk6CiAgZHJtL2FtZC9kaXNw
bGF5OiBhZGQgbnVsbCBjaGVja3MgYW5kIHNldCB1cGRhdGUgZmxhZ3MKCkpvc2h1YSBBYmVyYmFj
ayAoMik6CiAgZHJtL2FtZC9kaXNwbGF5OiBQcm9ncmFtIFZURyBwYXJhbXMgYWZ0ZXIgcHJvZ3Jh
bW1pbmcgR2xvYmFsIFN5bmMKICBkcm0vYW1kL2Rpc3BsYXk6IFJlbmFtZSBFRElEX0JMT0NLX1NJ
WkUgdG8gRENfRURJRF9CTE9DS19TSVpFCgpKdW4gTGVpICgxKToKICBkcm0vYW1kL2Rpc3BsYXk6
IGRvbnQgc2V0ICBvdGcgb2Zmc2V0CgpOaWNob2xhcyBLYXpsYXVza2FzICgyKToKICBkcm0vYW1k
L2Rpc3BsYXk6IEhvb2sgdXAgQ1JDIGNhcHR1cmUgc3VwcG9ydCBmb3IgZGNlMTIwCiAgZHJtL2Ft
ZC9kaXNwbGF5OiBFeHBsaWNpdGx5IHNwZWNpZnkgdXBkYXRlIHR5cGUgcGVyIHBsYW5lIGluZm8g
Y2hhbmdlCgpQYXVsIEhzaWVoICgxKToKICBkcm0vYW1kL2Rpc3BsYXk6IERpc2FibGUgQUJNIGJl
Zm9yZSBkZXN0cm95IEFCTSBzdHJ1Y3QKClNpdmFwaXJpeWFuS3VtYXJhc2FteSAoMSk6CiAgZHJt
L2FtZC9kaXNwbGF5OiBSZW1vdmUgRFBNUyBzdGF0ZSBkZXBlbmRlbmN5IGZvciBmYXN0IGJvb3QK
ClZpdGFseSBQcm9zeWFrICgxKToKICBkcm0vYW1kL2Rpc3BsYXk6IFJldXNlIE1QQyBPR1JBTSBm
b3IgMUQgYmxlbmRlcgoKV2VzbGV5IENoYWxtZXJzICgyKToKICBkcm0vYW1kL2Rpc3BsYXk6IEVu
Z2luZS1zcGVjaWZpYyBlbmNvZGVyIGFsbG9jYXRpb24KICBkcm0vYW1kL2Rpc3BsYXk6IFVzZSBE
Q04gZnVuY3Rpb25zIGluc3RlYWQgb2YgRENFCgogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2NvcmUvZGMuYyAgICAgIHwgIDcwICsrKysrKystLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvY29yZS9kY19saW5rLmMgfCAgIDkgKy0KIC4uLi9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2NvcmUvZGNfcmVzb3VyY2UuYyB8ICA0NyArLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvZGMuaCAgICAgICAgICAgfCAgIDQgKy0KIGRyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9kY19saW5rLmggICAgICB8ICAgMSArCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvZGNfdHlwZXMuaCAgICAgfCAgIDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9kY2UvZGNlX2FibS5jICB8ICAgMiArCiAuLi4vYW1kL2Rpc3BsYXkvZGMvZGNl
MTAwL2RjZTEwMF9yZXNvdXJjZS5jICAgfCAgNDQgKysrKysrLQogLi4uL2FtZC9kaXNwbGF5L2Rj
L2RjZTEwMC9kY2UxMDBfcmVzb3VyY2UuaCAgIHwgICA1ICsKIC4uLi9kaXNwbGF5L2RjL2RjZTEx
MC9kY2UxMTBfaHdfc2VxdWVuY2VyLmMgICB8ICA4OSArKysrKystLS0tLS0tLQogLi4uL2FtZC9k
aXNwbGF5L2RjL2RjZTExMC9kY2UxMTBfcmVzb3VyY2UuYyAgIHwgIDM1ICsrKysrLQogLi4uL2Ft
ZC9kaXNwbGF5L2RjL2RjZTExMC9kY2UxMTBfcmVzb3VyY2UuaCAgIHwgICA1ICsKIC4uLi9hbWQv
ZGlzcGxheS9kYy9kY2UxMTIvZGNlMTEyX3Jlc291cmNlLmMgICB8ICAgMyArLQogLi4uL2FtZC9k
aXNwbGF5L2RjL2RjZTEyMC9kY2UxMjBfcmVzb3VyY2UuYyAgIHwgICAzICstCiAuLi4vZGMvZGNl
MTIwL2RjZTEyMF90aW1pbmdfZ2VuZXJhdG9yLmMgICAgICAgfCAgODkgKysrKysrKysrKysrKysK
IC4uLi9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlODAvZGNlODBfcmVzb3VyY2UuYyB8ICAgMyArLQog
Li4uL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2h3X3NlcXVlbmNlci5jIHwgIDE2ICstLQog
Li4uL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2h3X3NlcXVlbmNlci5oIHwgICAyICsKIC4u
Li9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX29wdGMuYyB8IDExNSArKysrKysr
KysrLS0tLS0tLS0KIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX29wdGMu
aCB8ICAgMyArCiAuLi4vZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX3Jlc291cmNlLmMg
fCAgMzUgKysrKystCiAuLi4vZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX3Jlc291cmNl
LmggfCAgIDUgKwogLi4uL2FtZC9kaXNwbGF5L2RjL2RtbC9kaXNwbGF5X21vZGVfc3RydWN0cy5o
IHwgICA1ICsKIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2luYy9jb3JlX3R5cGVzLmggICB8
ICAyNSArKysrCiAuLi4vYW1kL2Rpc3BsYXkvZGMvaW5jL2h3L3RpbWluZ19nZW5lcmF0b3IuaCAg
fCAgIDIgKwogLi4uL2FtZC9kaXNwbGF5L21vZHVsZXMvY29sb3IvY29sb3JfZ2FtbWEuYyAgIHwg
IDU2ICsrKysrKy0tLQogLi4uL2FtZC9kaXNwbGF5L21vZHVsZXMvY29sb3IvY29sb3JfZ2FtbWEu
aCAgIHwgICAxICsKIC4uLi9kaXNwbGF5L21vZHVsZXMvaW5mb19wYWNrZXQvaW5mb19wYWNrZXQu
YyB8ICAgNCArLQogMjggZmlsZXMgY2hhbmdlZCwgNDc2IGluc2VydGlvbnMoKyksIDIwNCBkZWxl
dGlvbnMoLSkKCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeA==
