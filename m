Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A3481030
	for <lists+amd-gfx@lfdr.de>; Mon,  5 Aug 2019 04:07:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 083D489BB3;
	Mon,  5 Aug 2019 02:07:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700070.outbound.protection.outlook.com [40.107.70.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13E6489BB3
 for <amd-gfx@lists.freedesktop.org>; Mon,  5 Aug 2019 02:07:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DG4kjgb5zxOYoQuQCRxIdnGQCZi6IDidzZPmdabCE2Iz0sfh+34g4hhYwCOPfwJbacQq9wBSlxkutAN/f04HHJ6Qh51szvKTGxIteUIwf9lQBUH8N9n93yXNWPiicCg2AFZscuFi/LwpW2QBOrM+0Y2blxzf38PZlbflA3ZAZdGTsLxt2M6iDL6JXI60nTG6DYzIL6xImFspeRUJUcNSEfrVeJqYUhXdgznajSBCWXpdsE4T6NQbGfcKuQqBnNyEwMnXT7e9AFsIpoafTikcaoc0Uu5ZcR3IS23tjS9rQP/oe68AckVBRorAmar398i9+A4aOJEnD2VBMsubMOj21Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zUmhe6ETOM+2Y4cNkGB7EAAJpSJSthzqX1j9gNZw+/A=;
 b=brb1XPcSyzFCfxC4fQaMe5rhouz575In9HTNdlVIKj719fvJ3pRMtcq6WGTdhZrbHdLalNGOt2fu7tFwXUkbmrl9sbWP6WZEPDufdwnETdqTftdnu1TAhW8PN5rLp3I1HQYOT4F9vAQ5Vsmir3mNQ1ecXqIjf1P5huPS7XbKhZQc+zZpGKV3OR8mB52Rjl8XptjFbux0gnKvLksL6q9qH+GTSrwuuv06LWQa/7hCEuVd7n5HXTptvsOc6+t88BA0YKe6gF5D6EOxCBplo+bZUlH6mvd31VR/lPyHyzPODo1A+cljwWVTCuaR6h98n5tcywH/BElLbrJsG7n/vJ0cxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=yahoo.co.uk
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from CY4PR1201CA0014.namprd12.prod.outlook.com
 (2603:10b6:910:16::24) by BN6PR12MB1363.namprd12.prod.outlook.com
 (2603:10b6:404:1f::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.20; Mon, 5 Aug
 2019 02:07:15 +0000
Received: from DM3NAM03FT032.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::203) by CY4PR1201CA0014.outlook.office365.com
 (2603:10b6:910:16::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.13 via Frontend
 Transport; Mon, 5 Aug 2019 02:07:14 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT032.mail.protection.outlook.com (10.152.82.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2136.14 via Frontend Transport; Mon, 5 Aug 2019 02:07:14 +0000
Received: from lnx-glk.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Sun, 4 Aug 2019
 21:07:14 -0500
From: Gao Likun <likun.gao@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: pin the csb buffer on hw init for gfx v8
Date: Mon, 5 Aug 2019 10:06:49 +0800
Message-ID: <1564970809-31487-1-git-send-email-likun.gao@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(136003)(39860400002)(376002)(2980300002)(428003)(199004)(189003)(8676002)(47776003)(6916009)(81156014)(81166006)(186003)(26005)(68736007)(336012)(70586007)(6666004)(356004)(2351001)(486006)(53936002)(70206006)(426003)(2616005)(476003)(8936002)(7696005)(51416003)(126002)(53416004)(36756003)(5660300002)(316002)(50466002)(50226002)(4326008)(478600001)(2906002)(48376002)(86362001)(305945005)(54906003)(16586007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1363; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a0ed4cdf-5b1e-4253-e6dc-08d71949a2aa
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN6PR12MB1363; 
X-MS-TrafficTypeDiagnostic: BN6PR12MB1363:
X-Microsoft-Antispam-PRVS: <BN6PR12MB136364E62F1D7056F26758F8EFDA0@BN6PR12MB1363.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1417;
X-Forefront-PRVS: 01208B1E18
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: ClvR7/Aoh4/Nf64qwXK61Iih31Mo9AbzD5R3kbkmrtbmdNL4EKlU8IDygr9doC+c0/ju7lnkJ1B46bbs1S2lBEvXfuJmRAOKYtve6EnzDY87FTrFSlv7Hb6X74kdEksz6nxfpqxipA0MjBfRGUWV82wwkSXjYojEVgAx8PkLSIVO36NVjQDky2Zt+kX6Efo09wR4Gi4z9nCTBVivOcjP4eOTXLAm97yf/MmdAzgosCqMT21C0K4Jlj/Z57tOuznlZ4w2iHBd5zFFFAAUlXgEVlHhIHxthNBDJ804wIGVTJFG6Vp4UJAtcp53BW/Yl0V7EUWXq2TBpeozUkDBBHVCsH2X6iXIPZdaad9M6sDOP8jB+glxWgXBNSSP4xxA3AlOU34K04pF4iT6y2OfA2aKaDTaAmcQUzLtUtm5g3Hoo18=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2019 02:07:14.7409 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0ed4cdf-5b1e-4253-e6dc-08d71949a2aa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1363
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zUmhe6ETOM+2Y4cNkGB7EAAJpSJSthzqX1j9gNZw+/A=;
 b=ge/3FCuzIzhfGS4QvTCqFSpf8uARcFatb2hkVl4j0RsbEDdWvzAepk6dXhO0Z+R9sgZZIb7DA2apKCvz4NEn4eokemszEbzSCE1QhklSPz9f62v9V0JzS/HMMgkfLOFWvyxQYLF+8LSQVjLxIq1rLOyNbGW3UR7ydEwfAAp91sM=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; yahoo.co.uk; dkim=none (message not signed)
 header.d=none;yahoo.co.uk; dmarc=permerror action=none header.from=amd.com;
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Likun Gao <Likun.Gao@amd.com>,
 Paul Gover <pmw.gover@yahoo.co.uk>, Yuan Xiaojie <Xiaojie.Yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGlrdW4gR2FvIDxMaWt1bi5HYW9AYW1kLmNvbT4KCldpdGhvdXQgdGhpcyBwaW4sIHRo
ZSBjc2IgYnVmZmVyIHdpbGwgYmUgZmlsbGVkIHdpdGggaW5jb25zaXN0ZW50CmRhdGEgYWZ0ZXIg
UzMgcmVzdW1lLiBBbmQgdGhhdCB3aWxsIGNhdXNlcyBnZnggaGFuZyBvbiBnZnhvZmYKZXhpdCBz
aW5jZSB0aGlzIGNzYiB3aWxsIGJlIGV4ZWN1dGVkIHRoZW4uCgpTaWduZWQtb2ZmLWJ5OiBMaWt1
biBHYW8gPExpa3VuLkdhb0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2dmeF92OF8wLmMgfCA0MCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMSBm
aWxlIGNoYW5nZWQsIDQwIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9nZnhfdjhfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4
X3Y4XzAuYwppbmRleCBkMjkwNzE4Li45OGU1YWE4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9nZnhfdjhfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2dmeF92OF8wLmMKQEAgLTEzMTcsNiArMTMxNywzOSBAQCBzdGF0aWMgaW50IGdmeF92OF8wX3Js
Y19pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCXJldHVybiAwOwogfQogCitzdGF0
aWMgaW50IGdmeF92OF8wX2NzYl92cmFtX3BpbihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikK
K3sKKwlpbnQgcjsKKworCXIgPSBhbWRncHVfYm9fcmVzZXJ2ZShhZGV2LT5nZngucmxjLmNsZWFy
X3N0YXRlX29iaiwgZmFsc2UpOworCWlmICh1bmxpa2VseShyICE9IDApKQorCQlyZXR1cm4gcjsK
KworCXIgPSBhbWRncHVfYm9fcGluKGFkZXYtPmdmeC5ybGMuY2xlYXJfc3RhdGVfb2JqLAorCQkJ
QU1ER1BVX0dFTV9ET01BSU5fVlJBTSk7CisJaWYgKCFyKQorCQlhZGV2LT5nZngucmxjLmNsZWFy
X3N0YXRlX2dwdV9hZGRyID0KKwkJCWFtZGdwdV9ib19ncHVfb2Zmc2V0KGFkZXYtPmdmeC5ybGMu
Y2xlYXJfc3RhdGVfb2JqKTsKKworCWFtZGdwdV9ib191bnJlc2VydmUoYWRldi0+Z2Z4LnJsYy5j
bGVhcl9zdGF0ZV9vYmopOworCisJcmV0dXJuIHI7Cit9CisKK3N0YXRpYyB2b2lkIGdmeF92OF8w
X2NzYl92cmFtX3VucGluKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQoreworCWludCByOwor
CisJaWYgKCFhZGV2LT5nZngucmxjLmNsZWFyX3N0YXRlX29iaikKKwkJcmV0dXJuOworCisJciA9
IGFtZGdwdV9ib19yZXNlcnZlKGFkZXYtPmdmeC5ybGMuY2xlYXJfc3RhdGVfb2JqLCB0cnVlKTsK
KwlpZiAobGlrZWx5KHIgPT0gMCkpIHsKKwkJYW1kZ3B1X2JvX3VucGluKGFkZXYtPmdmeC5ybGMu
Y2xlYXJfc3RhdGVfb2JqKTsKKwkJYW1kZ3B1X2JvX3VucmVzZXJ2ZShhZGV2LT5nZngucmxjLmNs
ZWFyX3N0YXRlX29iaik7CisJfQorfQorCiBzdGF0aWMgdm9pZCBnZnhfdjhfMF9tZWNfZmluaShz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIHsKIAlhbWRncHVfYm9fZnJlZV9rZXJuZWwoJmFk
ZXYtPmdmeC5tZWMuaHBkX2VvcF9vYmosIE5VTEwsIE5VTEwpOwpAQCAtNDc5MSw2ICs0ODI0LDEw
IEBAIHN0YXRpYyBpbnQgZ2Z4X3Y4XzBfaHdfaW5pdCh2b2lkICpoYW5kbGUpCiAJZ2Z4X3Y4XzBf
aW5pdF9nb2xkZW5fcmVnaXN0ZXJzKGFkZXYpOwogCWdmeF92OF8wX2NvbnN0YW50c19pbml0KGFk
ZXYpOwogCisJciA9IGdmeF92OF8wX2NzYl92cmFtX3BpbihhZGV2KTsKKwlpZiAocikKKwkJcmV0
dXJuIHI7CisKIAlyID0gYWRldi0+Z2Z4LnJsYy5mdW5jcy0+cmVzdW1lKGFkZXYpOwogCWlmIChy
KQogCQlyZXR1cm4gcjsKQEAgLTQ5MDcsNiArNDk0NCw5IEBAIHN0YXRpYyBpbnQgZ2Z4X3Y4XzBf
aHdfZmluaSh2b2lkICpoYW5kbGUpCiAJZWxzZQogCQlwcl9lcnIoInJsYyBpcyBidXN5LCBza2lw
IGhhbHQgcmxjXG4iKTsKIAlhbWRncHVfZ2Z4X3JsY19leGl0X3NhZmVfbW9kZShhZGV2KTsKKwor
CWdmeF92OF8wX2NzYl92cmFtX3VucGluKGFkZXYpOworCiAJcmV0dXJuIDA7CiB9CiAKLS0gCjIu
Ny40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQt
Z2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
