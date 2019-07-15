Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9727969DCC
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:21:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C26F689CB9;
	Mon, 15 Jul 2019 21:21:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750077.outbound.protection.outlook.com [40.107.75.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBC9D89C8F
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:21:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QTpfq4xuzt3CiX9b7zclQdrJMhUVka9UN8fuMfWZIRdiLgZSPArGUkR68w0M0Wah6rr/rIw9LzqQdEARo29fFGbBLSCHg3xovv13Dq4tpNdER44SFtqnuI26AZAtouqPjvWn1j4dkzmPukXD+vs3HAXu9Uge3xs43k1ocK9i31lveY5hc+FiiJqIY8HvdzmsVKfoKQ2XYmNasy7/1r3bYxhp4CJIZv55WOAML1tuC5kfCUDeL3ABwaXGbK5Yoe/otnV03D4lRmxa2ZANNVToaJEHUeoArF/t01KzfhV/iCyScUvtVRz3rlcQo1OjFrvuNv5XN+Ce4gEDwqcbTWXSqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E/6uKdW9+1XmVsSm6BAgesOiGGUJFeVFUskEWGcnhGM=;
 b=DVjVNwFafvkBXI0K51dBAyBzqeAq3toAvtBRQsuDmXm7TfCmHqoq3emEVaIMwzAMTE9b2m43fAE4C+H3TckRnDHA2Z4uIJmLT9rNfmee84+L+a/0j9ni2yR4bnxCvBOgqHO0F7g7HzkV+Wr1CZ5UJ0ETAzIVxLj2PeyHFZ52rtGT6wMsye3cIJapS/2yBwnrT88aWPtNX44SwCkoydrnkTlOVZ4v4YntitEd4FYujjpU6ke0soB2Mrx+k9p/rJ7GGIxuEsu94HThfw6MMX2ZXgZsfsbi6RwDz0zcxjsj4KepCRh0QILZXNqeps2Lwmoy4wjTrg9S4TzAkzoU/3bN0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=amdcloud.onmicrosoft.com
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM5PR12CA0004.namprd12.prod.outlook.com (2603:10b6:4:1::14) by
 BN8PR12MB3332.namprd12.prod.outlook.com (2603:10b6:408:43::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Mon, 15 Jul 2019 21:21:44 +0000
Received: from CO1NAM03FT028.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::206) by DM5PR12CA0004.outlook.office365.com
 (2603:10b6:4:1::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.10 via Frontend
 Transport; Mon, 15 Jul 2019 21:21:43 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT028.mail.protection.outlook.com (10.152.80.189) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 15 Jul 2019 21:21:43 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 15 Jul 2019 16:21:27 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 47/87] drm/amd/display: Wait for flip to complete
Date: Mon, 15 Jul 2019 17:20:09 -0400
Message-ID: <20190715212049.4584-48-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715212049.4584-1-sunpeng.li@amd.com>
References: <20190715212049.4584-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(396003)(136003)(376002)(2980300002)(428003)(199004)(189003)(48376002)(486006)(11346002)(476003)(2616005)(86362001)(126002)(446003)(50466002)(2351001)(36756003)(81166006)(8936002)(2870700001)(68736007)(2906002)(305945005)(5660300002)(53936002)(81156014)(70586007)(14444005)(70206006)(8676002)(50226002)(478600001)(6916009)(47776003)(54906003)(49486002)(6666004)(356004)(186003)(4326008)(26005)(2876002)(316002)(76176011)(426003)(1076003)(336012)(51416003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3332; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 617cd530-0891-455a-1eae-08d7096a6f3b
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN8PR12MB3332; 
X-MS-TrafficTypeDiagnostic: BN8PR12MB3332:
X-Microsoft-Antispam-PRVS: <BN8PR12MB3332A05F8ABB7BD79BF3B7D082CF0@BN8PR12MB3332.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1417;
X-Forefront-PRVS: 00997889E7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: XS5bCpfzZDUb2YKMDSsrUAgmwQQzvwWi8wqT13QI2X+5xyeC9Sti6LeyKmL3mAaDw35NfYIJvqjdpU+WwjDbIvVpl6UUb0DvUh0AOIU01+WYDk2yr2d67hErNoeTiKP1y7AjpJMFUntveVCMEL9dYITGMIYj67mfsiKp4oI6tbziq5dECBJ06HlJQngjrZ9Aw9ylsH6Ttcl2KVtj0NocBTQyKahSDplKiH/S5snI6BC8IzWG5kE9tPVKeGUMOn1kQT9drtW8TSkiIGxhHzuQDKjMteTwHaKjC9UOdk6yM2qtLPdAM4CmK8DyO+paH5BjTmEs0oePpJhIxb5BfC9wYP0hBzmuXhCuR7cGNYq75vsd1IyknkY/kWwA9IMHol1l3xFSEz6oqvj78IyH2AOpuVyzsLrhjaaUHXwY7gIBSuA=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2019 21:21:43.1571 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 617cd530-0891-455a-1eae-08d7096a6f3b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3332
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E/6uKdW9+1XmVsSm6BAgesOiGGUJFeVFUskEWGcnhGM=;
 b=Kcz/XcDuY+b3j/kfWIwMdiIQOK9nSQl90/Tj0cI0Gj/dYn/VgIirk4PjQYeo7a030T0tznPhzt5LfZ3Tz9QDZd6OjxUmb1TcmKTRqVxno4JPajAK+88mvhoolBwbNdgTG7YwJBQdh23gIl7izx+8Zzp8g/jsOe2uYjzhj+iW5Ms=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; amdcloud.onmicrosoft.com; dkim=none (message not
 signed) header.d=none;amdcloud.onmicrosoft.com; dmarc=permerror action=none
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
Cc: Leo Li <sunpeng.li@amd.com>, Jaehyun Chung <Jaehyun.Chung@amd.com>,
 Alvin Lee <alvin.lee2@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQWx2aW4gTGVlIDxhbHZpbi5sZWUyQGFtZC5jb20+Cgpbd2h5XQpJbiBwaXBlIHNwbGl0
IGlzc3VlIG9jY3VycyB3aGVuIHdlIHByb2dyYW0gaW1tZWRpYXRlIGZsaXAgd2hpbGUgdnN5bmMg
ZmxpcCBpcyBwZW5kaW5nCgpbaG93XQpEb24ndCBwcm9ncmFtIGltbWVkaWF0ZSBmbGlwIHVudGls
IGZsaXAgaXMgbm8gbG9uZ2VyIHBlbmRpbmcKClNpZ25lZC1vZmYtYnk6IEFsdmluIExlZSA8YWx2
aW4ubGVlMkBhbWQuY29tPgpSZXZpZXdlZC1ieTogSmFlaHl1biBDaHVuZyA8SmFlaHl1bi5DaHVu
Z0BhbWQuY29tPgpBY2tlZC1ieTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h3c2VxLmMgfCAxMSArKysr
KysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfaHdzZXEuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9od3NlcS5jCmluZGV4IGE5MThm
Mjc3MGMzOC4uOWMwYTc4OGZiYjE4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvZGNuMjAvZGNuMjBfaHdzZXEuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvZGNuMjAvZGNuMjBfaHdzZXEuYwpAQCAtMTI4Myw2ICsxMjgzLDE3IEBAIHZvaWQg
ZGNuMjBfcGlwZV9jb250cm9sX2xvY2soCiAJaWYgKHBpcGUtPnBsYW5lX3N0YXRlICE9IE5VTEwp
CiAJCWZsaXBfaW1tZWRpYXRlID0gcGlwZS0+cGxhbmVfc3RhdGUtPmZsaXBfaW1tZWRpYXRlOwog
CisJaWYgKGZsaXBfaW1tZWRpYXRlICYmIGxvY2spIHsKKwkJd2hpbGUgKHBpcGUtPnBsYW5lX3Jl
cy5odWJwLT5mdW5jcy0+aHVicF9pc19mbGlwX3BlbmRpbmcocGlwZS0+cGxhbmVfcmVzLmh1YnAp
KQl7CisJCQl1ZGVsYXkoMSk7CisJCX0KKworCQlpZiAocGlwZS0+Ym90dG9tX3BpcGUgIT0gTlVM
TCkKKwkJCXdoaWxlIChwaXBlLT5ib3R0b21fcGlwZS0+cGxhbmVfcmVzLmh1YnAtPmZ1bmNzLT5o
dWJwX2lzX2ZsaXBfcGVuZGluZyhwaXBlLT5ib3R0b21fcGlwZS0+cGxhbmVfcmVzLmh1YnApKQl7
CisJCQkJdWRlbGF5KDEpOworCQkJfQorCX0KKwogCS8qIEluIGZsaXAgaW1tZWRpYXRlIGFuZCBw
aXBlIHNwbGl0dGluZyBjYXNlLCB3ZSBuZWVkIHRvIHVzZSBHU0wKIAkgKiBmb3Igc3luY2hyb25p
emF0aW9uLiBPbmx5IGRvIHNldHVwIG9uIGxvY2tpbmcgYW5kIG9uIGZsaXAgdHlwZSBjaGFuZ2Uu
CiAJICovCi0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA==
