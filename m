Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E4D9270B
	for <lists+amd-gfx@lfdr.de>; Mon, 19 Aug 2019 16:36:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D03C16E171;
	Mon, 19 Aug 2019 14:36:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam03on0603.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe48::603])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DDCB6E176
 for <amd-gfx@lists.freedesktop.org>; Mon, 19 Aug 2019 14:36:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bo2gl/P4pRoD3MT4tZKNNklxMakhnH7UKh3A9K+F1B1wAExQeDO7aY6w6Qdv7R7lzsXakwSlTkBhV2q/BEKAi5GuKmM5r467072z5a6IGxtSG6WDrcSOKtnirvcPMI5KetBmkPuyMvqpJjzb1j301Lwlqiv5OrouEZ+pauWPSkm7Ij7nAiz2Ity51whC1es2V09q8HB7jf+2yMGipoM/M2fpiznEvybHdN6OcItsJx8DmwfOn+x2sCXnXLBSTnI+3cskt5SRr1shaDOPAdmIt7WwcEYUEfzaiASOcfLkXd+HQFxD8N0nZmuLEc/1GixNytKbnvIlcZqRb+cTj8R3xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bx9pHykJTKosrOvo5K9K7ieODkXpJ58EF9cMTyCu2QA=;
 b=Il5ngLAlsgYJd/wsvnTf/BUTgL9r6jSlrlRMxu/P64OQUsEPOLrDMjnms1k3agKsA3h0yqHuf3w2Gd+TLAZVXNR9SZr0C9BEbPfEYYUWJkWZE12M46t+ao0A6UrFYQOhI1RUQufd8UqnAGImg0bdNf3clduKkUHP3mkOiYthSbJ22nx6Jvte705QZzbP6WhIH2AjGUtPWAZ/Z1ABCGOf/4ZYWEMLILqA3kQv37Ju0/vp1SKhUxso3yisA5oAcksHN4vz/Cd/R8rrbDX1Bmb/6gVC8QH1C6x/k6gbJ+xITvfIPFXW811L4KBKuWo+3U948Tj+7G0eQKpdfHi3/lxYjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN6PR12CA0032.namprd12.prod.outlook.com (2603:10b6:405:70::18)
 by BN6PR12MB1522.namprd12.prod.outlook.com (2603:10b6:405:11::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.16; Mon, 19 Aug
 2019 14:36:08 +0000
Received: from BY2NAM03FT016.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::208) by BN6PR12CA0032.outlook.office365.com
 (2603:10b6:405:70::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Mon, 19 Aug 2019 14:36:08 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT016.mail.protection.outlook.com (10.152.84.215) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Mon, 19 Aug 2019 14:36:07 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Mon, 19 Aug 2019
 09:35:50 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 34/36] drm/amd/display: Properly read LVTMA_PWRSEQ_CNTL
Date: Mon, 19 Aug 2019 10:35:13 -0400
Message-ID: <20190819143515.21653-35-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819143515.21653-1-Bhawanpreet.Lakha@amd.com>
References: <20190819143515.21653-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(376002)(396003)(136003)(2980300002)(428003)(189003)(199004)(11346002)(486006)(48376002)(50466002)(2906002)(186003)(26005)(4326008)(356004)(6666004)(70206006)(70586007)(51416003)(7696005)(14444005)(305945005)(53936002)(336012)(47776003)(16586007)(6916009)(36756003)(81156014)(8936002)(8676002)(81166006)(316002)(86362001)(50226002)(478600001)(1076003)(5660300002)(2351001)(426003)(76176011)(476003)(2616005)(126002)(446003)(53416004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1522; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f503b74-7f48-4a53-5139-08d724b292b9
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN6PR12MB1522; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1522:
X-Microsoft-Antispam-PRVS: <BN6PR12MB15225B8ECA85B81BD1BC07C3F9A80@BN6PR12MB1522.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-Forefront-PRVS: 0134AD334F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: fZIelrPFF0Nas89xFZc01G8Ht7/IdiTFi3GW4/p0F5Gsp2irZkM7Fqbf6knw6NhZURhV6SSFxMTpe+gSx+U2MvfyyRMoTR66VsFN83zKt5M5zkN/qjZgslUB3sxyVMV+DwU9OH74r+VI+DUW0wANeVBvLNBAmDy5hciXLQFuPxDe2kpq2t4W7WzwqTWSNUS4QUcGfQJPdCFSxci5CPpBdKk+0XRPEGhKARAhkphfZW0a80Wdg/wmlVNMz8StuDoW6o5Lg5KGSf5Mp6OxfqvWK8KmhajJrgb/OmkICKYl4lU3GMYvRC/esfyUbfxmxWtkkr5na0oV4aQC1AkkSMNL+rslEr3beAo4j0aSnumSzzRRzuyZJpYHfWxFgPLKkg9sqwu2SK1lkf+misvGQho6w24Kq1Q/B/tqe8kOWz1np2Y=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2019 14:36:07.9000 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f503b74-7f48-4a53-5139-08d724b292b9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1522
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bx9pHykJTKosrOvo5K9K7ieODkXpJ58EF9cMTyCu2QA=;
 b=b6im+zKD48pJn6TOrPkGj8D3B/2vbjaKHFR2PoEU86Rz/JXwVJraHcS6ZjBcBWyJoXzLT3ZlpnVIWbbhofQ8bo77s6XrgMnS6+ZNOxgFWZOhTuxOb7yWjnUoZ6kUkXig4cdVuj6fLFAMpKsGjLDYnM+yjbfmFZgpSqc78T1kSXI=
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
Cc: Joshua Aberback <joshua.aberback@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSm9zaHVhIEFiZXJiYWNrIDxqb3NodWEuYWJlcmJhY2tAYW1kLmNvbT4KCltXaHldClRo
ZSByZWdpc3RlciBMVlRNQV9QV1JTRVFfQ05UTCBpcyB1c2VkIHRvIGRldGVybWluZSB0aGUgcG93
ZXIgc3RhdGUgb2YgdGhlCmVtYmVkZGVkIGRpc3BsYXkuIEN1cnJlbnRseSB3ZSBkbyBub3QgYWN0
dWFsbHkgcmVhZCB0aGlzIHJlZ2lzdGVyJ3MgdmFsdWVzLApzbyBkdXJpbmcgcG93ZXIgZG93biB3
ZSB0aGluayB0aGF0IHRoaXMgZGlzcGxheSBpcyBhbHJlYWR5IG9mZiwgc28gd2Ugc2tpcApjYWxs
aW5nIGludG8gVkJJT1MgdG8gYWN0dWFsbHkgdHVybiBpdCBvZmYuCgpbSG93XQogLSBhZGQgcmVs
ZXZhbnQgZmllbGRzIHRvIHNoaWZ0IC8gbWFzayBpbml0aWFsaXphdGlvbgoKU2lnbmVkLW9mZi1i
eTogSm9zaHVhIEFiZXJiYWNrIDxqb3NodWEuYWJlcmJhY2tAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6
IENoYXJsZW5lIExpdSA8Q2hhcmxlbmUuTGl1QGFtZC5jb20+CkFja2VkLWJ5OiBCaGF3YW5wcmVl
dCBMYWtoYSA8Qmhhd2FucHJlZXQuTGFraGFAYW1kLmNvbT4KLS0tCiAuLi4vZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9kY2UvZGNlX2h3c2VxLmggICAgfCA0MyArKysrKysrKy0tLS0tLS0tLS0tCiAx
IGZpbGUgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgMjYgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfaHdzZXEuaCBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2h3c2VxLmgKaW5kZXggZjYyZWIy
ZTQzZDdmLi43ZDkzYmFiYWEyZmIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9kY2UvZGNlX2h3c2VxLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2RjZS9kY2VfaHdzZXEuaApAQCAtNDE2LDM2ICs0MTYsMzQgQEAgc3RydWN0IGRjZV9od3Nl
cV9yZWdpc3RlcnMgewogCUhXU19TRjEoYmxrLCBQSFlQTExfUElYRUxfUkFURV9DTlRMLCBQSFlQ
TExfUElYRUxfUkFURV9TT1VSQ0UsIG1hc2tfc2gpLFwKIAlIV1NfU0YxKGJsaywgUEhZUExMX1BJ
WEVMX1JBVEVfQ05UTCwgUElYRUxfUkFURV9QTExfU09VUkNFLCBtYXNrX3NoKQogCisjZGVmaW5l
IEhXU0VRX0xWVE1BX01BU0tfU0hfTElTVChtYXNrX3NoKVwKKwlIV1NfU0YoLCBMVlRNQV9QV1JT
RVFfQ05UTCwgTFZUTUFfQkxPTiwgbWFza19zaCksXAorCUhXU19TRigsIExWVE1BX1BXUlNFUV9D
TlRMLCBMVlRNQV9ESUdPTiwgbWFza19zaCksXAorCUhXU19TRigsIExWVE1BX1BXUlNFUV9DTlRM
LCBMVlRNQV9ESUdPTl9PVlJELCBtYXNrX3NoKSxcCisJSFdTX1NGKCwgTFZUTUFfUFdSU0VRX1NU
QVRFLCBMVlRNQV9QV1JTRVFfVEFSR0VUX1NUQVRFX1IsIG1hc2tfc2gpCisKICNkZWZpbmUgSFdT
RVFfRENFOF9NQVNLX1NIX0xJU1QobWFza19zaClcCiAJLkRDRkVfQ0xPQ0tfRU5BQkxFID0gQ1JU
Q19EQ0ZFX0NMT0NLX0NPTlRST0xfX0NSVENfRENGRV9DTE9DS19FTkFCTEUgIyMgbWFza19zaCwg
XAogCUhXU19TRihCTE5EXywgVl9VUERBVEVfTE9DSywgQkxORF9EQ1BfR1JQSF9WX1VQREFURV9M
T0NLLCBtYXNrX3NoKSxcCiAJSFdTX1NGKEJMTkRfLCBWX1VQREFURV9MT0NLLCBCTE5EX1NDTF9W
X1VQREFURV9MT0NLLCBtYXNrX3NoKSxcCiAJSFdTX1NGKEJMTkRfLCBWX1VQREFURV9MT0NLLCBC
TE5EX0RDUF9HUlBIX1NVUkZfVl9VUERBVEVfTE9DSywgbWFza19zaCksXAogCUhXU19TRihCTE5E
XywgQ09OVFJPTCwgQkxORF9NT0RFLCBtYXNrX3NoKSxcCi0JSFdTX1NGKCwgTFZUTUFfUFdSU0VR
X0NOVEwsIExWVE1BX0JMT04sIG1hc2tfc2gpLFwKLQlIV1NfU0YoLCBMVlRNQV9QV1JTRVFfU1RB
VEUsIExWVE1BX1BXUlNFUV9UQVJHRVRfU1RBVEVfUiwgbWFza19zaCksXAotCUhXU0VRX1BJWEVM
X1JBVEVfTUFTS19TSF9MSVNUKG1hc2tfc2gsIENSVEMwXykKKwlIV1NFUV9QSVhFTF9SQVRFX01B
U0tfU0hfTElTVChtYXNrX3NoLCBDUlRDMF8pLFwKKwlIV1NFUV9MVlRNQV9NQVNLX1NIX0xJU1Qo
bWFza19zaCkKIAogI2RlZmluZSBIV1NFUV9EQ0UxMF9NQVNLX1NIX0xJU1QobWFza19zaClcCiAJ
SFdTRVFfRENFRl9NQVNLX1NIX0xJU1QobWFza19zaCwgRENGRV8pLFwKIAlIV1NFUV9CTE5EX01B
U0tfU0hfTElTVChtYXNrX3NoLCBCTE5EXyksXAotCUhXU0VRX1BJWEVMX1JBVEVfTUFTS19TSF9M
SVNUKG1hc2tfc2gsIENSVEMwXyksIFwKLQlIV1NfU0YoLCBMVlRNQV9QV1JTRVFfQ05UTCwgTFZU
TUFfQkxPTiwgbWFza19zaCksIFwKLQlIV1NfU0YoLCBMVlRNQV9QV1JTRVFfU1RBVEUsIExWVE1B
X1BXUlNFUV9UQVJHRVRfU1RBVEVfUiwgbWFza19zaCkKKwlIV1NFUV9QSVhFTF9SQVRFX01BU0tf
U0hfTElTVChtYXNrX3NoLCBDUlRDMF8pLFwKKwlIV1NFUV9MVlRNQV9NQVNLX1NIX0xJU1QobWFz
a19zaCkKIAogI2RlZmluZSBIV1NFUV9EQ0UxMV9NQVNLX1NIX0xJU1QobWFza19zaClcCiAJSFdT
RVFfRENFMTBfTUFTS19TSF9MSVNUKG1hc2tfc2gpLFwKIAlTRihEQ0ZFVl9DTE9DS19DT05UUk9M
LCBEQ0ZFVl9DTE9DS19FTkFCTEUsIG1hc2tfc2gpLFwKLQlIV1NfU0YoLCBMVlRNQV9QV1JTRVFf
Q05UTCwgTFZUTUFfQkxPTiwgbWFza19zaCksXAotCUhXU19TRigsIExWVE1BX1BXUlNFUV9DTlRM
LCBMVlRNQV9ESUdPTiwgbWFza19zaCksXAotCUhXU19TRigsIExWVE1BX1BXUlNFUV9DTlRMLCBM
VlRNQV9ESUdPTl9PVlJELCBtYXNrX3NoKSxcCi0JSFdTX1NGKCwgTFZUTUFfUFdSU0VRX1NUQVRF
LCBMVlRNQV9QV1JTRVFfVEFSR0VUX1NUQVRFX1IsIG1hc2tfc2gpLFwKIAlIV1NFUV9QSVhFTF9S
QVRFX01BU0tfU0hfTElTVChtYXNrX3NoLCBDUlRDMF8pCiAKICNkZWZpbmUgSFdTRVFfRENFMTEy
X01BU0tfU0hfTElTVChtYXNrX3NoKVwKIAlIV1NFUV9EQ0UxMF9NQVNLX1NIX0xJU1QobWFza19z
aCksXAotCUhXU19TRigsIExWVE1BX1BXUlNFUV9DTlRMLCBMVlRNQV9CTE9OLCBtYXNrX3NoKSxc
Ci0JSFdTX1NGKCwgTFZUTUFfUFdSU0VRX1NUQVRFLCBMVlRNQV9QV1JTRVFfVEFSR0VUX1NUQVRF
X1IsIG1hc2tfc2gpLFwKIAlIV1NFUV9QSFlQTExfTUFTS19TSF9MSVNUKG1hc2tfc2gsIENSVEMw
XykKIAogI2RlZmluZSBIV1NFUV9HRlg5X0RDSFVCX01BU0tfU0hfTElTVChtYXNrX3NoKVwKQEAg
LTQ1MywxOCArNDUxLDE1IEBAIHN0cnVjdCBkY2VfaHdzZXFfcmVnaXN0ZXJzIHsKIAlTRihEQ0hV
Ql9GQl9MT0NBVElPTiwgRkJfQkFTRSwgbWFza19zaCksXAogCVNGKERDSFVCX0FHUF9CQVNFLCBB
R1BfQkFTRSwgbWFza19zaCksXAogCVNGKERDSFVCX0FHUF9CT1QsIEFHUF9CT1QsIG1hc2tfc2gp
LFwKLQlTRihEQ0hVQl9BR1BfVE9QLCBBR1BfVE9QLCBtYXNrX3NoKSwgXAotCUhXU19TRigsIExW
VE1BX1BXUlNFUV9DTlRMLCBMVlRNQV9CTE9OLCBtYXNrX3NoKSwgXAotCUhXU19TRigsIExWVE1B
X1BXUlNFUV9TVEFURSwgTFZUTUFfUFdSU0VRX1RBUkdFVF9TVEFURV9SLCBtYXNrX3NoKQorCVNG
KERDSFVCX0FHUF9UT1AsIEFHUF9UT1AsIG1hc2tfc2gpCiAKICNkZWZpbmUgSFdTRVFfRENFMTJf
TUFTS19TSF9MSVNUKG1hc2tfc2gpXAogCUhXU0VRX0RDRUZfTUFTS19TSF9MSVNUKG1hc2tfc2gs
IERDRkUwX0RDRkVfKSxcCiAJSFdTRVFfQkxORF9NQVNLX1NIX0xJU1QobWFza19zaCwgQkxORDBf
QkxORF8pLFwKIAlIV1NFUV9QSVhFTF9SQVRFX01BU0tfU0hfTElTVChtYXNrX3NoLCBDUlRDMF8p
LFwKIAlIV1NFUV9QSFlQTExfTUFTS19TSF9MSVNUKG1hc2tfc2gsIENSVEMwXyksXAotCUhXU0VR
X0dGWDlfRENIVUJfTUFTS19TSF9MSVNUKG1hc2tfc2gpLCBcCi0JSFdTX1NGKCwgTFZUTUFfUFdS
U0VRX0NOVEwsIExWVE1BX0JMT04sIG1hc2tfc2gpLCBcCi0JSFdTX1NGKCwgTFZUTUFfUFdSU0VR
X1NUQVRFLCBMVlRNQV9QV1JTRVFfVEFSR0VUX1NUQVRFX1IsIG1hc2tfc2gpCisJSFdTRVFfR0ZY
OV9EQ0hVQl9NQVNLX1NIX0xJU1QobWFza19zaCksXAorCUhXU0VRX0xWVE1BX01BU0tfU0hfTElT
VChtYXNrX3NoKQogCiAjZGVmaW5lIEhXU0VRX1ZHMjBfTUFTS19TSF9MSVNUKG1hc2tfc2gpXAog
CUhXU0VRX0RDRTEyX01BU0tfU0hfTElTVChtYXNrX3NoKSxcCkBAIC01MjcsMTAgKzUyMiw3IEBA
IHN0cnVjdCBkY2VfaHdzZXFfcmVnaXN0ZXJzIHsKIAlIV1NfU0YoLCBENFZHQV9DT05UUk9MLCBE
NFZHQV9NT0RFX0VOQUJMRSwgbWFza19zaCksXAogCUhXU19TRigsIFZHQV9URVNUX0NPTlRST0ws
IFZHQV9URVNUX0VOQUJMRSwgbWFza19zaCksXAogCUhXU19TRigsIFZHQV9URVNUX0NPTlRST0ws
IFZHQV9URVNUX1JFTkRFUl9TVEFSVCwgbWFza19zaCksXAotCUhXU19TRigsIExWVE1BX1BXUlNF
UV9DTlRMLCBMVlRNQV9CTE9OLCBtYXNrX3NoKSwgXAotCUhXU19TRigsIExWVE1BX1BXUlNFUV9D
TlRMLCBMVlRNQV9ESUdPTiwgbWFza19zaCksIFwKLQlIV1NfU0YoLCBMVlRNQV9QV1JTRVFfQ05U
TCwgTFZUTUFfRElHT05fT1ZSRCwgbWFza19zaCksIFwKLQlIV1NfU0YoLCBMVlRNQV9QV1JTRVFf
U1RBVEUsIExWVE1BX1BXUlNFUV9UQVJHRVRfU1RBVEVfUiwgbWFza19zaCkKKwlIV1NFUV9MVlRN
QV9NQVNLX1NIX0xJU1QobWFza19zaCkKIAogI2lmIGRlZmluZWQoQ09ORklHX0RSTV9BTURfRENf
RENOMl8wKQogI2RlZmluZSBIV1NFUV9EQ04yX01BU0tfU0hfTElTVChtYXNrX3NoKVwKQEAgLTU5
MSw4ICs1ODMsNyBAQCBzdHJ1Y3QgZGNlX2h3c2VxX3JlZ2lzdGVycyB7CiAJSFdTX1NGKCwgRE9N
QUlOMjBfUEdfU1RBVFVTLCBET01BSU4yMF9QR0ZTTV9QV1JfU1RBVFVTLCBtYXNrX3NoKSwgXAog
CUhXU19TRigsIERPTUFJTjIxX1BHX1NUQVRVUywgRE9NQUlOMjFfUEdGU01fUFdSX1NUQVRVUywg
bWFza19zaCksIFwKIAlIV1NfU0YoLCBEQ19JUF9SRVFVRVNUX0NOVEwsIElQX1JFUVVFU1RfRU4s
IG1hc2tfc2gpLCBcCi0JSFdTX1NGKCwgTFZUTUFfUFdSU0VRX0NOVEwsIExWVE1BX0JMT04sIG1h
c2tfc2gpLCBcCi0JSFdTX1NGKCwgTFZUTUFfUFdSU0VRX1NUQVRFLCBMVlRNQV9QV1JTRVFfVEFS
R0VUX1NUQVRFX1IsIG1hc2tfc2gpCisJSFdTRVFfTFZUTUFfTUFTS19TSF9MSVNUKG1hc2tfc2gp
CiAjZW5kaWYKIAogI2RlZmluZSBIV1NFUV9SRUdfRklFTERfTElTVCh0eXBlKSBcCkBAIC02Mjcs
OSArNjE4LDkgQEAgc3RydWN0IGRjZV9od3NlcV9yZWdpc3RlcnMgewogCXR5cGUgRU5BQkxFX0wx
X1RMQjtcCiAJdHlwZSBTWVNURU1fQUNDRVNTX01PREU7XAogCXR5cGUgTFZUTUFfQkxPTjtcCi0J
dHlwZSBMVlRNQV9QV1JTRVFfVEFSR0VUX1NUQVRFX1I7XAogCXR5cGUgTFZUTUFfRElHT047XAot
CXR5cGUgTFZUTUFfRElHT05fT1ZSRDsKKwl0eXBlIExWVE1BX0RJR09OX09WUkQ7XAorCXR5cGUg
TFZUTUFfUFdSU0VRX1RBUkdFVF9TVEFURV9SOwogCiAjZGVmaW5lIEhXU0VRX0RDTl9SRUdfRklF
TERfTElTVCh0eXBlKSBcCiAJdHlwZSBIVUJQX1ZUR19TRUw7IFwKLS0gCjIuMTcuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5n
IGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
