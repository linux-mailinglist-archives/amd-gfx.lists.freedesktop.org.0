Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA1B69DC1
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:21:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3948789C94;
	Mon, 15 Jul 2019 21:21:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820043.outbound.protection.outlook.com [40.107.82.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D12B89C61
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:21:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l3PjTvvWP4lPpDRwC9naGlk6r8FUBIb3wfm/A+7SLuKIvTFNTBXDhmErTjIS7RviPlm2Or0Tw7Qt2mDgLN6PpvGoPxw7iisWIs7f1V5NVzc5tNSKFJo1v5NbDjSqdWdSBU02tWqXutUEpOq8pJiywaE1ZL4In+w4cN+4ClCo1B5ZNMQSEGvDQwyTlygTWYoC3fVHX5htUdg/qQcdApOWPxgYM9k7cXkoB1gZDn6GnyfZUuP5f/HOoPrlLt2g9ylsQF6UAAHejQ54wkZa0SykNfLqay9hUj1hls7kSwZYNNSEIrfTDfMPUG1ICjrkfbjURloMDfuUth4Npp4tAcTa8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b0hiIcA/R5x2fdGfh0eE9uFFlMg4knEoe0QMdLDjcyI=;
 b=mFV1NRu0WFUbjZ+i1BPhWNUwVIP3I/k4J+ayOJbCxBS6wV9EgCFDmnP12DDX7FC9cdQL1Dl2Mfbxcmc6jplSEYEyx4+xvDTBxa8O1VEAqaRj5jGAaNtGQrg+d9k8r2090nVdoTW21YUaew0sVB0eDteFTAyOJa1K+mrDJRqTbpCFJE+kHvUYmYjQ6b51xAjNJvd6pLtQf8wfgUFiWdRdQc6HjhPyDvKswMrDbfUVBvc3kxfUBUr7wloQmCi4+VAm9XPd4Q/BRky6zXvSnPoaIb40tazWxpO/+5cKyPPSl/wofn8ZkhG1VyxA1LPxP8zDeuspJo/IzfXTSVwIhst3Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=amdcloud.onmicrosoft.com
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from MN2PR12CA0007.namprd12.prod.outlook.com (2603:10b6:208:a8::20)
 by BN8PR12MB3331.namprd12.prod.outlook.com (2603:10b6:408:43::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.14; Mon, 15 Jul
 2019 21:21:38 +0000
Received: from CO1NAM03FT049.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::206) by MN2PR12CA0007.outlook.office365.com
 (2603:10b6:208:a8::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.14 via Frontend
 Transport; Mon, 15 Jul 2019 21:21:38 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT049.mail.protection.outlook.com (10.152.81.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 15 Jul 2019 21:21:37 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 15 Jul 2019 16:21:23 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 38/87] drm/amd/display: Disable Audio on reinitialize hardware
Date: Mon, 15 Jul 2019 17:20:00 -0400
Message-ID: <20190715212049.4584-39-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715212049.4584-1-sunpeng.li@amd.com>
References: <20190715212049.4584-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(376002)(136003)(39860400002)(2980300002)(428003)(199004)(189003)(2351001)(26005)(186003)(2870700001)(76176011)(305945005)(2906002)(2616005)(51416003)(49486002)(426003)(446003)(2876002)(11346002)(126002)(336012)(486006)(6916009)(476003)(70586007)(8936002)(68736007)(70206006)(5660300002)(48376002)(478600001)(36756003)(50466002)(4326008)(50226002)(53936002)(47776003)(81156014)(1076003)(81166006)(54906003)(316002)(86362001)(8676002)(6666004)(356004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3331; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f0ac6b6-4c91-4b8b-99ab-08d7096a6bef
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN8PR12MB3331; 
X-MS-TrafficTypeDiagnostic: BN8PR12MB3331:
X-Microsoft-Antispam-PRVS: <BN8PR12MB33312181D0A0B83D5B72D1DC82CF0@BN8PR12MB3331.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-Forefront-PRVS: 00997889E7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: FxcgKgps1JE8AtBPfXuRq+r5RnBCnQRV3K8DPp29tkjfz0RbHvRuDhdMNx8uLZA55hxsLEg8OM/SlgOUSekzkC4n656mO0aUeQgdvJsgEa+wTEY9V8U6oBG/Yqv3pZts4noPWMGc/hmGQLy9O+r0KjOf5yDsQmWjmP4H5GAdSyp3qScoYZmS4QHiZvdHIKQpwCGpQTbBudr4cIhum8x5WCobF+N8R3yi3opI+4d8z/R2mtF91OHGUsMDpdUFrBKQHSbJx24u/CNu8yUp9pLU6uK1xfuQAlvJHMrxSDVxPD9ul98Sp86jxJZ9/Ln2LOIdo3kP4/ICa+CorDTRDozeUcO3TYyzKphlqw5T+zeyNw0pEsnKor5Ywa/OuTFazocxF/6iQQCznX1MEdGiWLiIxvrwCltuiuyAjHM8J5OYqWA=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2019 21:21:37.6250 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f0ac6b6-4c91-4b8b-99ab-08d7096a6bef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3331
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b0hiIcA/R5x2fdGfh0eE9uFFlMg4knEoe0QMdLDjcyI=;
 b=AXwzArHA1qaXRdMXDhQOC5uK6nMbbD6ZqlHCPU33REWMqVMWYnU4LQaB7YUHcggTz8pMXfp+rqr0SETSt7lWrYVSwlF8lklsEW+G9JRJwEbzsukJRS8KNZ0YxS6lULTYLaKEIX50n62CdPAPeo5LCbQ2k1K9JBRxWKV/ve54HSw=
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
Cc: Leo Li <sunpeng.li@amd.com>, Jun Lei <Jun.Lei@amd.com>,
 Alvin Lee <alvin.lee2@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQWx2aW4gTGVlIDxhbHZpbi5sZWUyQGFtZC5jb20+CgpbV2h5XQpXaGVuIHdlIHJlY292
ZXIgZnJvbSBoYW5nLCB3ZSBkbyBub3Qgd2FudCB0byBza2lwIHRoZSBhdWRpbyBlbmFibGUgY2Fs
bC4KCltIb3ddCkRpc2FibGUgYXVkaW8gaW4gZGNfcmVpbml0aWFsaXplX2hhcmR3YXJlCgpTaWdu
ZWQtb2ZmLWJ5OiBBbHZpbiBMZWUgPGFsdmluLmxlZTJAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEp1
biBMZWkgPEp1bi5MZWlAYW1kLmNvbT4KQWNrZWQtYnk6IExlbyBMaSA8c3VucGVuZy5saUBhbWQu
Y29tPgotLS0KIC4uLi9kaXNwbGF5L2RjL2Nsa19tZ3IvZGNuMjAvZGNuMjBfY2xrX21nci5jICB8
ICAxICsKIC4uLi9kaXNwbGF5L2RjL2RjZTExMC9kY2UxMTBfaHdfc2VxdWVuY2VyLmMgICB8IDIw
ICsrKysrKysrKysrKysrKy0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwg
NCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvY2xrX21nci9kY24yMC9kY24yMF9jbGtfbWdyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvY2xrX21nci9kY24yMC9kY24yMF9jbGtfbWdyLmMKaW5kZXggNjE0YTk0MWViOWYy
Li5lOWE3YTdhZjExZGYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9jbGtfbWdyL2RjbjIwL2RjbjIwX2Nsa19tZ3IuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvY2xrX21nci9kY24yMC9kY24yMF9jbGtfbWdyLmMKQEAgLTMzMSw2ICszMzEs
NyBAQCB2b2lkIGRjbjIwX2Nsa19tZ3JfY29uc3RydWN0KAogCQlzdHJ1Y3QgZGNjZyAqZGNjZykK
IHsKIAljbGtfbWdyLT5iYXNlLmN0eCA9IGN0eDsKKwljbGtfbWdyLT5wcF9zbXUgPSBwcF9zbXU7
CiAJY2xrX21nci0+YmFzZS5mdW5jcyA9ICZkY24yX2Z1bmNzOwogCWNsa19tZ3ItPnJlZ3MgPSAm
Y2xrX21ncl9yZWdzOwogCWNsa19tZ3ItPmNsa19tZ3Jfc2hpZnQgPSAmY2xrX21ncl9zaGlmdDsK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UxMTAvZGNlMTEw
X2h3X3NlcXVlbmNlci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTExMC9k
Y2UxMTBfaHdfc2VxdWVuY2VyLmMKaW5kZXggNmZhMWY2YjUzNzViLi5mZWRiYzZkMGM0MGQgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UxMTAvZGNlMTEwX2h3
X3NlcXVlbmNlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UxMTAv
ZGNlMTEwX2h3X3NlcXVlbmNlci5jCkBAIC05NjIsMTEgKzk2MiwxNyBAQCB2b2lkIGh3c3NfZWRw
X2JhY2tsaWdodF9jb250cm9sKAogdm9pZCBkY2UxMTBfZW5hYmxlX2F1ZGlvX3N0cmVhbShzdHJ1
Y3QgcGlwZV9jdHggKnBpcGVfY3R4KQogewogCS8qIG5vdGlmeSBhdWRpbyBkcml2ZXIgZm9yIGF1
ZGlvIG1vZGVzIG9mIG1vbml0b3IgKi8KLQlzdHJ1Y3QgZGMgKmNvcmVfZGMgPSBwaXBlX2N0eC0+
c3RyZWFtLT5jdHgtPmRjOworCXN0cnVjdCBkYyAqY29yZV9kYzsKIAlzdHJ1Y3QgcHBfc211X2Z1
bmNzICpwcF9zbXUgPSBOVUxMOwotCXN0cnVjdCBjbGtfbWdyICpjbGtfbWdyID0gY29yZV9kYy0+
Y2xrX21ncjsKKwlzdHJ1Y3QgY2xrX21nciAqY2xrX21ncjsKIAl1bnNpZ25lZCBpbnQgaSwgbnVt
X2F1ZGlvID0gMTsKIAorCWlmICghcGlwZV9jdHgtPnN0cmVhbSkKKwkJcmV0dXJuOworCisJY29y
ZV9kYyA9IHBpcGVfY3R4LT5zdHJlYW0tPmN0eC0+ZGM7CisJY2xrX21nciA9IGNvcmVfZGMtPmNs
a19tZ3I7CisKIAlpZiAocGlwZV9jdHgtPnN0cmVhbV9yZXMuYXVkaW8gJiYgcGlwZV9jdHgtPnN0
cmVhbV9yZXMuYXVkaW8tPmVuYWJsZWQgPT0gdHJ1ZSkKIAkJcmV0dXJuOwogCkBAIC05OTYsOSAr
MTAwMiwxNSBAQCB2b2lkIGRjZTExMF9lbmFibGVfYXVkaW9fc3RyZWFtKHN0cnVjdCBwaXBlX2N0
eCAqcGlwZV9jdHgpCiAKIHZvaWQgZGNlMTEwX2Rpc2FibGVfYXVkaW9fc3RyZWFtKHN0cnVjdCBw
aXBlX2N0eCAqcGlwZV9jdHgsIGludCBvcHRpb24pCiB7Ci0Jc3RydWN0IGRjICpkYyA9IHBpcGVf
Y3R4LT5zdHJlYW0tPmN0eC0+ZGM7CisJc3RydWN0IGRjICpkYzsKIAlzdHJ1Y3QgcHBfc211X2Z1
bmNzICpwcF9zbXUgPSBOVUxMOwotCXN0cnVjdCBjbGtfbWdyICpjbGtfbWdyID0gZGMtPmNsa19t
Z3I7CisJc3RydWN0IGNsa19tZ3IgKmNsa19tZ3I7CisKKwlpZiAoIXBpcGVfY3R4IHx8ICFwaXBl
X2N0eC0+c3RyZWFtKQorCQlyZXR1cm47CisKKwlkYyA9IHBpcGVfY3R4LT5zdHJlYW0tPmN0eC0+
ZGM7CisJY2xrX21nciA9IGRjLT5jbGtfbWdyOwogCiAJaWYgKHBpcGVfY3R4LT5zdHJlYW1fcmVz
LmF1ZGlvICYmIHBpcGVfY3R4LT5zdHJlYW1fcmVzLmF1ZGlvLT5lbmFibGVkID09IGZhbHNlKQog
CQlyZXR1cm47Ci0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeA==
