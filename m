Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 574FB2BAED
	for <lists+amd-gfx@lfdr.de>; Mon, 27 May 2019 21:52:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD09F89AEE;
	Mon, 27 May 2019 19:52:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820057.outbound.protection.outlook.com [40.107.82.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7444789AC6
 for <amd-gfx@lists.freedesktop.org>; Mon, 27 May 2019 19:52:21 +0000 (UTC)
Received: from DM5PR12CA0003.namprd12.prod.outlook.com (2603:10b6:4:1::13) by
 DM5PR1201MB0058.namprd12.prod.outlook.com (2603:10b6:4:50::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.18; Mon, 27 May 2019 19:52:20 +0000
Received: from CO1NAM03FT022.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::200) by DM5PR12CA0003.outlook.office365.com
 (2603:10b6:4:1::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1922.16 via Frontend
 Transport; Mon, 27 May 2019 19:52:20 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT022.mail.protection.outlook.com (10.152.80.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1922.16 via Frontend Transport; Mon, 27 May 2019 19:52:19 +0000
Received: from leodev.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Mon, 27 May 2019
 14:52:01 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 22/26] drm/amd/display: fix issues with bad AUX reply on some
 displays
Date: Mon, 27 May 2019 15:51:01 -0400
Message-ID: <1558986665-12964-23-git-send-email-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558986665-12964-1-git-send-email-sunpeng.li@amd.com>
References: <1558986665-12964-1-git-send-email-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(979002)(136003)(346002)(376002)(396003)(39860400002)(2980300002)(428003)(199004)(189003)(53936002)(51416003)(16586007)(47776003)(36756003)(478600001)(316002)(7696005)(76176011)(81166006)(81156014)(446003)(11346002)(2616005)(486006)(2351001)(8936002)(126002)(476003)(5660300002)(8676002)(426003)(356004)(336012)(77096007)(26005)(2876002)(53416004)(305945005)(50226002)(72206003)(2906002)(186003)(50466002)(48376002)(4326008)(68736007)(70206006)(86362001)(6916009)(70586007)(86152003)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1201MB0058; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 16d6fad4-bf1a-42b4-75ec-08d6e2dcd421
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM5PR1201MB0058; 
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0058:
X-Microsoft-Antispam-PRVS: <DM5PR1201MB00582867B67069FD07F15AA0821D0@DM5PR1201MB0058.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-Forefront-PRVS: 0050CEFE70
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: kzrmFiK5kKcTLNw8Du1J+Sxu1etkgu2K7sK97b2yk6HS9ZfGSpXf0puKVor0sBuWt00b4/715d3xRN44MgLjty0HWTg27C3sviBnbs2QtxlOPY6QgxcOR3GIJHc8DAhDQjuCdjwhM660QcLyLE9YLYsky/XoRzYtvkuipyOi1PSG3vLobquwo7YEjwbHLSPk8/AJ2DOjGeKqi6zty1ghAnHKLep96nFeSuVhSTDRPvXReT4/esFApdyASh1pteSBussiCN7rPXNgPveclBgG+y2iE9e7mVw9+tZcN8eLTJyn8TH9GxFI1H+jDVC16bu+KNE6Ql77gtlKZim9KQ1Ck12kHAZPPvCV7wSPCWxpu52q+eiKuiY5sJjWNEc88ac316me7sCJrfCdlZTlyYNPQ9Uy4YAg/+v+rW6KtjKhq/Y=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2019 19:52:19.7167 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16d6fad4-bf1a-42b4-75ec-08d6e2dcd421
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0058
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v74w5qZbAyfe05ozrML2YllEKFwIVVQIL7YaywGbbDs=;
 b=qchX47eUMtrRttJ6dgg/BJLqkCLULaOz5r67heRrECW19GbnsXPK2l2MSJvHb3J+Jdm66b7ABys6JXTytiXHYfg2s/SaMkUldj173wn9I7Eob9xTkXBV9ugxjWHUb9I8Lqy7DnH0eO0zg8UiTBJF/7euWxihrsm5nRFy7NJhewc=
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
Cc: Anthony Koo <anthony.koo@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQW50aG9ueSBLb28gPGFudGhvbnkua29vQGFtZC5jb20+CgpbV2h5XQpTb21lIGRpc3Bs
YXlzIHRha2Ugc29tZSB0aW1lIHRvIHBvd2VyIHVwIEFVWCBDSCBvbmNlIHRoZXkgYXJlCnB1dCBp
bnRvIEQzIHN0YXRlIHZpYSB3cml0ZSB0byBEUENEIDYwMGg9Mi4KCkludGVyZXN0aW5nbHkgZW5v
dWdoLCBzb21lIGRpc3BsYXkgbWF5IHNpbXBseSBOQUNLLCBidXQgc29tZSBtaWdodAphbHNvIEFD
SyB3aXRoIGEgYnVuY2ggb2YgMHMsIHdoaWNoIGNhbiBjYXVzZSBpc3N1ZXMgd2l0aCByZWNlaXZl
cgpjYXAgcmV0cmlldmFsLiBOb3RlIHRoYXQgbm90IGFsbCBEUENEIGFkZHJlc3MgcmV0dXJuIDBz
LCBidXQgaW4KcGFydGljdWxhciBpdCBoYXMgYmVlbiBvYnNlcnZlZCBvbiBzb21lIGhpZ2hlciBE
UENEIGFkZHJlc3Mgc3VjaAphcyBEUENEIDIyMDBoLCBldGMuCgpbSG93XQpCYXNlZCBvbiBzcGVj
LCByZWNlaXZlciB3aWxsIG1vbml0b3IgZGlmZmVyZW50aWFsIHNpZ25hbCB3aGlsZSBpbiBEMyBh
bmQKQVVYIENIIGlzIGluIGxvdyBwb3dlciBtb2RlLiBXaGVuIGRldGVjdGVkLCBpdCBtYXkgYWxs
b3cgdXAgdG8KMSBtcyB0byBwb3dlciB1cCBBVVggQ0ggYW5kIHJlcGx5LgoKSWYgd2UgcmVhZCBT
aW5rIHBvd2VyIHN0YXRlIEQzLCB3ZSBzaG91bGQgYWRkIDEgbXMgZGVsYXkgdG8gc2F0aXNmeQp0
aGlzIHNwZWMgcmVxdWlyZW1lbnQuCgpTaWduZWQtb2ZmLWJ5OiBBbnRob255IEtvbyA8YW50aG9u
eS5rb29AYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IFdlbmppbmcgTGl1IDxXZW5qaW5nLkxpdUBhbWQu
Y29tPgpBY2tlZC1ieTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGlua19kcC5jIHwgMTIgKysrKysrKysrKysr
CiAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmtfZHAuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmtfZHAuYwppbmRleCAxZWU1NDRhLi42NWQ2Y2Fl
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5r
X2RwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGlua19k
cC5jCkBAIC0yMzYxLDYgKzIzNjEsNyBAQCBzdGF0aWMgYm9vbCByZXRyaWV2ZV9saW5rX2NhcChz
dHJ1Y3QgZGNfbGluayAqbGluaykKIAkvKk9ubHkgbmVlZCB0byByZWFkIDEgYnl0ZSBzdGFydGlu
ZyBmcm9tIERQX0RQUlhfRkVBVFVSRV9FTlVNRVJBVElPTl9MSVNULgogCSAqLwogCXVpbnQ4X3Qg
ZHBjZF9kcHJ4X2RhdGEgPSAnXDAnOworCXVpbnQ4X3QgZHBjZF9wb3dlcl9zdGF0ZSA9ICdcMCc7
CiAKIAlzdHJ1Y3QgZHBfZGV2aWNlX3ZlbmRvcl9pZCBzaW5rX2lkOwogCXVuaW9uIGRvd25fc3Ry
ZWFtX3BvcnRfY291bnQgZG93bl9zdHJtX3BvcnRfY291bnQ7CkBAIC0yMzc3LDYgKzIzNzgsMTcg
QEAgc3RhdGljIGJvb2wgcmV0cmlldmVfbGlua19jYXAoc3RydWN0IGRjX2xpbmsgKmxpbmspCiAJ
bWVtc2V0KCZlZHBfY29uZmlnX2NhcCwgJ1wwJywKIAkJc2l6ZW9mKHVuaW9uIGVkcF9jb25maWd1
cmF0aW9uX2NhcCkpOwogCisJc3RhdHVzID0gY29yZV9saW5rX3JlYWRfZHBjZChsaW5rLCBEUF9T
RVRfUE9XRVIsCisJCQkJJmRwY2RfcG93ZXJfc3RhdGUsIHNpemVvZihkcGNkX3Bvd2VyX3N0YXRl
KSk7CisKKwkvKiBEZWxheSAxIG1zIGlmIEFVWCBDSCBpcyBpbiBwb3dlciBkb3duIHN0YXRlLiBC
YXNlZCBvbiBzcGVjCisJICogc2VjdGlvbiAyLjMuMS4yLCBpZiBBVVggQ0ggbWF5IGJlIHBvd2Vy
ZWQgZG93biBkdWUgdG8KKwkgKiB3cml0ZSB0byBEUENEIDYwMGggPSAyLiBTaW5rIEFVWCBDSCBp
cyBtb25pdG9yaW5nIGRpZmZlcmVudGlhbAorCSAqIHNpZ25hbCBhbmQgbWF5IG5lZWQgdXAgdG8g
MSBtcyBiZWZvcmUgYmVpbmcgYWJsZSB0byByZXBseS4KKwkgKi8KKwlpZiAoc3RhdHVzICE9IERD
X09LIHx8IGRwY2RfcG93ZXJfc3RhdGUgPT0gRFBfU0VUX1BPV0VSX0QzKQorCQl1ZGVsYXkoMTAw
MCk7CisKIAlmb3IgKGkgPSAwOyBpIDwgcmVhZF9kcGNkX3JldHJ5X2NudDsgaSsrKSB7CiAJCXN0
YXR1cyA9IGNvcmVfbGlua19yZWFkX2RwY2QoCiAJCQkJbGluaywKLS0gCjIuNy40CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
