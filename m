Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF10B7AA51
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Jul 2019 15:58:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D6016E527;
	Tue, 30 Jul 2019 13:58:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760050.outbound.protection.outlook.com [40.107.76.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24D196E527
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Jul 2019 13:57:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PybLbe6XTiA1EQbxqnwFS9bD4Ld5crl/BARlWz37vrOo1HKa8nm1jxJXf/rJGoQ+GcT3B4KfcnC7dIsrzFIrULNzd8eCm90AeXYQXByXPO82ldcgp196NrRByFrliAZ3IChebVFddW/YenLlRPb5FltiL1rI7gXe9wHrCLIcFux/PI7waw73dVErXDjK+jOXq2PUxtQf+Z1ma2LeqV9hFrq0+qSl2sjjEQvUuJF+ntDUkbFizPRR0fBH25lYBPX8xUsuEZ181hemTQZQ2rWAl9Ou40ncMGtSrthswo/zpY8dHMaeDsTtT9gEIkITS98DiF+wnJPbQDYZQcOf0Hz34g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EV/rbMuNeCSFkECCYnoRowdFbsJdYc0PmRCR8GF3tM8=;
 b=PGZP4NE6QLNH1sTg/wts1pPZBpjBLJuVEq7+ub+/Dwsw1f38chD/JG1DrDaYCD456DIW1roLwK7GZJ2Th0/CzTB+skzrT3ilztgmL+qRpJJGmh9tZs3iThyy/ybKrV7HUw+VVQBtkDGwfysYGzt33K2l5pWYxz9PDSq4b9SIDSIsBgfx29+R01hGLzCPOtCO0ZKVtC0S0Novo1DUSkr34yvdX25EMXTmYWmVGUAUo3NGMimvbVNpwuQ06jJsMM6/sIG/ExKuCI7nd5Q2QcYePlEgEPCAf8W6ftlsvWm5NR5ZXvSPNneRJcGw5bPnTp3gI7TVhhQb1fCucKF3SN9j4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from MN2PR12CA0017.namprd12.prod.outlook.com (2603:10b6:208:a8::30)
 by DM6PR12MB3516.namprd12.prod.outlook.com (2603:10b6:5:18a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2115.13; Tue, 30 Jul
 2019 13:57:57 +0000
Received: from CO1NAM03FT016.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::207) by MN2PR12CA0017.outlook.office365.com
 (2603:10b6:208:a8::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2115.15 via Frontend
 Transport; Tue, 30 Jul 2019 13:57:57 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT016.mail.protection.outlook.com (10.152.80.170) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2115.10 via Frontend Transport; Tue, 30 Jul 2019 13:57:56 +0000
Received: from kazbox.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Tue, 30 Jul 2019
 08:57:55 -0500
From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amd/display: Support uclk switching for DCN2
Date: Tue, 30 Jul 2019 09:57:33 -0400
Message-ID: <20190730135733.14563-2-nicholas.kazlauskas@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190730135733.14563-1-nicholas.kazlauskas@amd.com>
References: <20190730135733.14563-1-nicholas.kazlauskas@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(346002)(39860400002)(396003)(2980300002)(428003)(189003)(199004)(14444005)(50226002)(2351001)(26005)(4326008)(81166006)(8676002)(81156014)(53936002)(8936002)(53416004)(48376002)(50466002)(47776003)(336012)(6666004)(446003)(76176011)(356004)(44832011)(7696005)(486006)(86362001)(51416003)(5660300002)(36756003)(2906002)(6916009)(316002)(16586007)(426003)(476003)(126002)(11346002)(2616005)(1076003)(478600001)(305945005)(70206006)(70586007)(54906003)(68736007)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3516; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 85f8e16c-5cd2-4c85-4d25-08d714f5eccc
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM6PR12MB3516; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB3516:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3516E5193ECD9B55D139C0E6ECDC0@DM6PR12MB3516.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 0114FF88F6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: vUUEk8EpTj7DR5nU+xZkWailiT80Bfr2ya/UDHCDk47Nu/Wn+IxLhhqm1M43Gm1IIBPSl7IlmOBkDTiG+pVy4mjWBwZ6owBqrVxrBGwz068dG15bDR64H+zk0EVA4449sRI24eIqozwY55KwyeXYEjNhCzddtQE1dSojCUvtqJ991XjPcvimAEWmevvrdMstaTFa4BbPORBbiMn1o45TUCPp4SXoiFPoZddeNSDp9hObO2dkI4BysS+LiXtGiEklPhqiGe7k2ynVPCvt3J3SOsnDYvcFBQQLSwnABPe7ZWmUC4I8xFp7gGXq0+CguhUE1U4huTl49gz1CW9JZCGzuie7+c2n74Eo/z+fai0+TQVaAv2QTFXohDmtExWt2p+i75zWJQDut5ys9oSr1Hl7H3ownBsV8rP8t4t/EuDlawM=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2019 13:57:56.6638 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85f8e16c-5cd2-4c85-4d25-08d714f5eccc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3516
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EV/rbMuNeCSFkECCYnoRowdFbsJdYc0PmRCR8GF3tM8=;
 b=LNUg0TEtyJ+zcWezql8fTbWIq6BNvQkpM3iBBWZuLJzPC2mmworEnooc95BlFOjp3E1IflLJudbqnBrjUVXPntu+gDe237sNOcLorWrP281VRdDKLCe38os0q76GHtPFBS+qYl9yFe9111Wj/N+1ccMxvb3V1cmDQQVGKxd9c5s=
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
Cc: Leo Li <sunpeng.li@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W1doeV0KV2Ugd2VyZSBwcmV2aW91c2x5IGZvcmNpbmcgdGhlIHVjbGsgZm9yIGV2ZXJ5IHN0YXRl
IHRvIG1heCBhbmQgcmVkdWNpbmcKdGhlIHN3aXRjaCB0aW1lIHRvIHByZXZlbnQgdWNsayBzd2l0
Y2hpbmcgZnJvbSBvY2N1cmluZy4gVGhpcyB3b3JrYXJvdW5kCndhcyBwcmV2aW91c2x5IG5lZWRl
ZCBpbiBvcmRlciB0byBhdm9pZCBoYW5ncyArIHVuZGVyZmxvdyB1bmRlciBjZXJ0YWluCmRpc3Bs
YXkgY29uZmlndXJhdGlvbnMuCgpOb3cgdGhhdCBEQyBoYXMgdGhlIHByb3BlciBmaXggY29tcGxl
dGUgd2UgY2FuIGRyb3AgdGhlIGhhY2tzIGFuZAppbXByb3ZlIHBvd2VyIGZvciBtb3N0IGRpc3Bs
YXkgY29uZmlndXJhdGlvbnMuCgpbSG93XQpXZSBzdGlsbCBuZWVkIHRoZSBmdW5jdGlvbiBwb2lu
dGVycyBob29rZWQgdXAgdG8gZ3JhYiB0aGUgcmVhbCB1Y2xrCnN0YXRlcyBmcm9tIHBwbGliLiBU
aGUgcmVzdCBvZiB0aGUgcHJpb3IgaGFjayBjYW4gYmUgcmV2ZXJ0ZWQuCgpUaGUga2V5IHJlcXVp
cmVtZW50cyBoZXJlIGFyZSByZWFsbHkganVzdCBEQyBzdXBwb3J0LCB1cGRhdGVkIGZpcm13YXJl
LAphbmQgc3VwcG9ydCBmb3IgZGlzYWJsaW5nIHAtc3RhdGUgc3VwcG9ydCB3aGVuIG5lZWRlZCBp
biBwcGxpYi9zbXUuCgpXaGVuIHRoZXNlIHJlcXVpcmVtZW50cyBhcmUgbWV0IHVjbGsgc3dpdGNo
aW5nIHdvcmtzIHdpdGhvdXQgdW5kZXJmbG93Cm9yIGhhbmdzLgoKRml4ZXM6IDAyMzE2ZTk2M2E1
YSAoImRybS9hbWQvZGlzcGxheTogRm9yY2UgdWNsayB0byBtYXggZm9yIGV2ZXJ5IHN0YXRlIikK
CkNjOiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJy
eS53ZW50bGFuZEBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBOaWNob2xhcyBLYXpsYXVza2FzIDxu
aWNob2xhcy5rYXpsYXVza2FzQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmMgfCAxMCAtLS0tLS0tLS0tCiAxIGZpbGUgY2hh
bmdlZCwgMTAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYwppbmRleCBmZjMwZjVjYzQ5ODEuLjQyZDM2
NjZmMjAzNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIw
L2RjbjIwX3Jlc291cmNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Rj
bjIwL2RjbjIwX3Jlc291cmNlLmMKQEAgLTI4MTcsOSArMjgxNyw2IEBAIHN0YXRpYyB2b2lkIGNh
cF9zb2NfY2xvY2tzKAogCQkJCQkJJiYgbWF4X2Nsb2Nrcy51Q2xvY2tJbktoeiAhPSAwKQogCQkJ
YmItPmNsb2NrX2xpbWl0c1tpXS5kcmFtX3NwZWVkX210cyA9IChtYXhfY2xvY2tzLnVDbG9ja0lu
S2h6IC8gMTAwMCkgKiAxNjsKIAotCQkvLyBIQUNLOiBGb3JjZSBldmVyeSB1Y2xrIHRvIG1heCBm
b3Igbm93IHRvICJkaXNhYmxlIiB1Y2xrIHN3aXRjaGluZy4KLQkJYmItPmNsb2NrX2xpbWl0c1tp
XS5kcmFtX3NwZWVkX210cyA9IChtYXhfY2xvY2tzLnVDbG9ja0luS2h6IC8gMTAwMCkgKiAxNjsK
LQogCQlpZiAoKGJiLT5jbG9ja19saW1pdHNbaV0uZmFicmljY2xrX21oeiA+IChtYXhfY2xvY2tz
LmZhYnJpY0Nsb2NrSW5LaHogLyAxMDAwKSkKIAkJCQkJCSYmIG1heF9jbG9ja3MuZmFicmljQ2xv
Y2tJbktoeiAhPSAwKQogCQkJYmItPmNsb2NrX2xpbWl0c1tpXS5mYWJyaWNjbGtfbWh6ID0gKG1h
eF9jbG9ja3MuZmFicmljQ2xvY2tJbktoeiAvIDEwMDApOwpAQCAtMzAzNSw4ICszMDMyLDYgQEAg
c3RhdGljIGJvb2wgaW5pdF9zb2NfYm91bmRpbmdfYm94KHN0cnVjdCBkYyAqZGMsCiAJCQkJbGUz
Ml90b19jcHUoYmItPnZtbV9wYWdlX3NpemVfYnl0ZXMpOwogCQlkY24yXzBfc29jLmRyYW1fY2xv
Y2tfY2hhbmdlX2xhdGVuY3lfdXMgPQogCQkJCWZpeGVkMTZfdG9fZG91YmxlX3RvX2NwdShiYi0+
ZHJhbV9jbG9ja19jaGFuZ2VfbGF0ZW5jeV91cyk7Ci0JCS8vIEhBQ0shISBMb3dlciB1Y2xvY2sg
bGF0ZW5jeSBzd2l0Y2ggdGltZSBzbyB3ZSBkb24ndCBzd2l0Y2gKLQkJZGNuMl8wX3NvYy5kcmFt
X2Nsb2NrX2NoYW5nZV9sYXRlbmN5X3VzID0gMTA7CiAJCWRjbjJfMF9zb2Mud3JpdGViYWNrX2Ry
YW1fY2xvY2tfY2hhbmdlX2xhdGVuY3lfdXMgPQogCQkJCWZpeGVkMTZfdG9fZG91YmxlX3RvX2Nw
dShiYi0+d3JpdGViYWNrX2RyYW1fY2xvY2tfY2hhbmdlX2xhdGVuY3lfdXMpOwogCQlkY24yXzBf
c29jLnJldHVybl9idXNfd2lkdGhfYnl0ZXMgPQpAQCAtMzA3OCw3ICszMDczLDYgQEAgc3RhdGlj
IGJvb2wgaW5pdF9zb2NfYm91bmRpbmdfYm94KHN0cnVjdCBkYyAqZGMsCiAJCXN0cnVjdCBwcF9z
bXVfbnZfY2xvY2tfdGFibGUgbWF4X2Nsb2NrcyA9IHswfTsKIAkJdW5zaWduZWQgaW50IHVjbGtf
c3RhdGVzWzhdID0gezB9OwogCQl1bnNpZ25lZCBpbnQgbnVtX3N0YXRlcyA9IDA7Ci0JCWludCBp
OwogCQllbnVtIHBwX3NtdV9zdGF0dXMgc3RhdHVzOwogCQlib29sIGNsb2NrX2xpbWl0c19hdmFp
bGFibGUgPSBmYWxzZTsKIAkJYm9vbCB1Y2xrX3N0YXRlc19hdmFpbGFibGUgPSBmYWxzZTsKQEAg
LTMxMDAsMTAgKzMwOTQsNiBAQCBzdGF0aWMgYm9vbCBpbml0X3NvY19ib3VuZGluZ19ib3goc3Ry
dWN0IGRjICpkYywKIAkJCWNsb2NrX2xpbWl0c19hdmFpbGFibGUgPSAoc3RhdHVzID09IFBQX1NN
VV9SRVNVTFRfT0spOwogCQl9CiAKLQkJLy8gSEFDSzogVXNlIHRoZSBtYXggdWNsa19zdGF0ZXMg
dmFsdWUgZm9yIGFsbCBlbGVtZW50cy4KLQkJZm9yIChpID0gMDsgaSA8IG51bV9zdGF0ZXM7IGkr
KykKLQkJCXVjbGtfc3RhdGVzW2ldID0gdWNsa19zdGF0ZXNbbnVtX3N0YXRlcyAtIDFdOwotCiAJ
CWlmIChjbG9ja19saW1pdHNfYXZhaWxhYmxlICYmIHVjbGtfc3RhdGVzX2F2YWlsYWJsZSAmJiBu
dW1fc3RhdGVzKQogCQkJdXBkYXRlX2JvdW5kaW5nX2JveChkYywgJmRjbjJfMF9zb2MsICZtYXhf
Y2xvY2tzLCB1Y2xrX3N0YXRlcywgbnVtX3N0YXRlcyk7CiAJCWVsc2UgaWYgKGNsb2NrX2xpbWl0
c19hdmFpbGFibGUpCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeA==
