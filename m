Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F5DC907F
	for <lists+amd-gfx@lfdr.de>; Wed,  2 Oct 2019 20:16:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8715A6E197;
	Wed,  2 Oct 2019 18:16:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720055.outbound.protection.outlook.com [40.107.72.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 764A66E191
 for <amd-gfx@lists.freedesktop.org>; Wed,  2 Oct 2019 18:16:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lHdpMzZBDBV97lvxKO5q55syAdDfj2zEHoZuN6F90myTzKeeppcVS0n2qPV4HowwoMrY9G3pnX6nOjfEme+n5MDb7dCG5olI8dPTrNhYoiOT0sWlQ1rLr+pPTRNJ5XEeAlqB6ZAuXKbTUiMwJz8HWfe3iZoz1pyZcPYJ36X2ge4kbZaG34LN1zDF53K12A/1fXrohVGrtW+XyZ7daAElRIHNNeZdI4TDeLdrRPsUKY5pJyNUMO4da6ruqhS5iEg+MqqAVQGipEjAaq0xkxQXow2LHnGN5oGcN7I6axyrpbXzBFsvOpjNiAHpE+F8B12Fmo9WfA2u9etHHir1UL4OYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=37dVf/XbKeWLZUCNnznt3jBL7rsc0GjbWk+1h5k5WfA=;
 b=U9qaIZV55afxQXPnP41TD70VshzglS63Nrjinn3pL13x+QPEGSkJEbtbGsF0Mj9SO2+ErCqdCgprfScg7fUHBWO+RBQ5UKw9FmQ+ZOUybRx+Jn6SeGhAOXx+9fz0EB/pK3NpQMTDPm58wJ0QurITD+h4uFc029YtpE72mXpXysN48seHL69H3ldwBE3zcE7oMNKcSI8/XoRkrDkw6kYL3j/1ApdU0SoTp0TEYDXRuBJx7wcPD1N+dgITUny71pylx/r8883Z7nhSjlpCdcuJFy6ePU7EqiUBEb7PNAHO8rsGf/nW2jeVBC2JghgyD/nMez+W0JNxP28fpMgCrL/64w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0125.namprd12.prod.outlook.com (2603:10b6:0:51::21) by
 SN1PR12MB2542.namprd12.prod.outlook.com (2603:10b6:802:2a::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Wed, 2 Oct 2019 18:16:40 +0000
Received: from DM3NAM03FT053.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::203) by DM3PR12CA0125.outlook.office365.com
 (2603:10b6:0:51::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.20 via Frontend
 Transport; Wed, 2 Oct 2019 18:16:40 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT053.mail.protection.outlook.com (10.152.83.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Wed, 2 Oct 2019 18:16:39 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Wed, 2 Oct 2019
 13:16:38 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 09/38] drm/amd/display: add support for VSIP info packet
Date: Wed, 2 Oct 2019 14:16:04 -0400
Message-ID: <20191002181633.22805-10-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191002181633.22805-1-Bhawanpreet.Lakha@amd.com>
References: <20191002181633.22805-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(136003)(39860400002)(396003)(428003)(199004)(189003)(446003)(8676002)(1076003)(11346002)(126002)(81166006)(50466002)(70206006)(70586007)(76176011)(476003)(81156014)(2616005)(8936002)(16586007)(48376002)(356004)(305945005)(486006)(478600001)(6916009)(2906002)(426003)(316002)(186003)(47776003)(26005)(53416004)(36756003)(336012)(86362001)(7696005)(50226002)(4326008)(51416003)(5660300002)(2351001)(6666004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN1PR12MB2542; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a3925cd6-bdd7-4367-2558-08d74764abb6
X-MS-TrafficTypeDiagnostic: SN1PR12MB2542:
X-Microsoft-Antispam-PRVS: <SN1PR12MB254255C0C2C548D84A2B679FF99C0@SN1PR12MB2542.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 0178184651
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JKK9VEPU2iQGdIMuV3aG0Yu/bx6kyjI4E5K14GLu+y63EsKmGopwwF3jiXWp/gtoWO7tpB77Cirh4vmO/g82Eb+r8oNw4DMqO4WGiHdI0x6dTLNgfoptbZ87P9VDPtenOaLdkpIzPwFN/pOtEFFzV9dPaZbPWR/OzVZMe8+JwIgYN7P+H5LJ71P3uiIs39uE88Bxjp700hD5ZcHHfAvzjRDGusN3DAd3oqup6Ed0vARBcT7gN70t1rmo8048foUV9vvKjDoGcIf08WJO0PkRUQlwm3pvD/98CUaxSf8FyE1Tf7HUCCVnuokBQMoDPZ79UKrzIpjvm2Tnb3XVcY5/xukmSXtvXvLWp/HapNNGbWBAJTUH/Y10mSn93c7azJvALpwRp7Uk0/IgOPe69MfD0+WaZo1kN5GYqVlot7g3PZc=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2019 18:16:39.8246 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3925cd6-bdd7-4367-2558-08d74764abb6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2542
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=37dVf/XbKeWLZUCNnznt3jBL7rsc0GjbWk+1h5k5WfA=;
 b=4gzGFm2uDQtkW2nA5FbwyMc/kjeOfSwhq87Qhb3I38iTBJX1qgVP5Ues71IazbrMGLXmmU/QaYer3Ze+cfSxtJBSQnLh9XfEp5OI775lDLQdetMCcbH9GCGtSgKrFLi8HHg/SurH/zP3xMshNuDacndItDAoaQVND/BE38T6PMk=
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
Cc: Wayne Lin <Wayne.Lin@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogV2F5bmUgTGluIDxXYXluZS5MaW5AYW1kLmNvbT4KCltXaHldClRoZSB2ZW5kb3Igc3Bl
Y2lmaWMgaW5mb2ZyYW1lIGlzIG5lZWRlZCBmb3IgSERNSSB3aGlsZSBkaXNwbGF5aW5nCnNwZWNp
ZmljIG1vZGVzLgpEQyBzdXBwb3J0cyBzZW5kaW5nIGl0LCBidXQgd2UgYXJlbid0IGN1cnJlbnRs
eSBidWlsZGluZyBpdAoKW0hvd10KQWRkIG1vZF9idWlsZF9oZl92c2lmX2luZm9wYWNrZXQoKSB0
byBidWlsZCB0aGUgdmVuZG9yIHNwZWNpZmljCmluZm8gcGFja2V0LgoKQ2hhbmdlLUlkOiBJMmVl
Y2RiYjQwMjBjMDY0NTczZWZiM2M2Njc2NGNiMTNlNTZjZTdmNApTaWduZWQtb2ZmLWJ5OiBXYXlu
ZSBMaW4gPFdheW5lLkxpbkBhbWQuY29tPgpSZXZpZXdlZC1ieTogTmljaG9sYXMgS2F6bGF1c2th
cyA8TmljaG9sYXMuS2F6bGF1c2thc0BhbWQuY29tPgpBY2tlZC1ieTogQmhhd2FucHJlZXQgTGFr
aGEgPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5jb20+Ci0tLQogLi4uL2FtZC9kaXNwbGF5L21vZHVs
ZXMvaW5jL21vZF9pbmZvX3BhY2tldC5oIHwgIDMgKwogLi4uL2Rpc3BsYXkvbW9kdWxlcy9pbmZv
X3BhY2tldC9pbmZvX3BhY2tldC5jIHwgOTggKysrKysrKysrKysrKysrKysrKwogMiBmaWxlcyBj
aGFuZ2VkLCAxMDEgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9tb2R1bGVzL2luYy9tb2RfaW5mb19wYWNrZXQuaCBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9tb2R1bGVzL2luYy9tb2RfaW5mb19wYWNrZXQuaAppbmRleCBkOTMwYmRl
Y2IxMTcuLmNhOGNlM2M1NTMzNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L21vZHVsZXMvaW5jL21vZF9pbmZvX3BhY2tldC5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9tb2R1bGVzL2luYy9tb2RfaW5mb19wYWNrZXQuaApAQCAtMzUsNCArMzUsNyBA
QCBzdHJ1Y3QgbW9kX3Zycl9wYXJhbXM7CiB2b2lkIG1vZF9idWlsZF92c2NfaW5mb3BhY2tldChj
b25zdCBzdHJ1Y3QgZGNfc3RyZWFtX3N0YXRlICpzdHJlYW0sCiAJCXN0cnVjdCBkY19pbmZvX3Bh
Y2tldCAqaW5mb19wYWNrZXQpOwogCit2b2lkIG1vZF9idWlsZF9oZl92c2lmX2luZm9wYWNrZXQo
Y29uc3Qgc3RydWN0IGRjX3N0cmVhbV9zdGF0ZSAqc3RyZWFtLAorCQlzdHJ1Y3QgZGNfaW5mb19w
YWNrZXQgKmluZm9fcGFja2V0LCBpbnQgQUxMTUVuYWJsZWQsIGludCBBTExNVmFsdWUpOworCiAj
ZW5kaWYKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2lu
Zm9fcGFja2V0L2luZm9fcGFja2V0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9k
dWxlcy9pbmZvX3BhY2tldC9pbmZvX3BhY2tldC5jCmluZGV4IGQ4ODVkNjQyZWQ3Zi4uZGI2YjA4
ZjZkMDkzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9p
bmZvX3BhY2tldC9pbmZvX3BhY2tldC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9tb2R1bGVzL2luZm9fcGFja2V0L2luZm9fcGFja2V0LmMKQEAgLTMxLDYgKzMxLDcgQEAKICNp
bmNsdWRlICJkYy5oIgogCiAjZGVmaW5lIEhETUlfSU5GT0ZSQU1FX1RZUEVfVkVORE9SIDB4ODEK
KyNkZWZpbmUgSEZfVlNJRl9WRVJTSU9OIDEKIAogLy8gVlRFTSBCeXRlIE9mZnNldAogI2RlZmlu
ZSBWVEVNX1BCMAkJMApAQCAtMzk1LDMgKzM5NiwxMDAgQEAgdm9pZCBtb2RfYnVpbGRfdnNjX2lu
Zm9wYWNrZXQoY29uc3Qgc3RydWN0IGRjX3N0cmVhbV9zdGF0ZSAqc3RyZWFtLAogCiB9CiAKKy8q
KgorICoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqCisgKiAgRnVuY3Rpb246IG1vZF9idWlsZF9oZl92c2lm
X2luZm9wYWNrZXQKKyAqCisgKiAgQGJyaWVmCisgKiAgICAgUHJlcGFyZSBIRE1JIFZlbmRvciBT
cGVjaWZpYyBpbmZvIGZyYW1lLgorICogICAgIEZvbGxvd3MgSERNSSBTcGVjIHRvIGJ1aWxkIHVw
IFZlbmRvciBTcGVjaWZpYyBpbmZvIGZyYW1lCisgKgorICogIEBwYXJhbSBbaW5dIHN0cmVhbTog
Y29udGFpbnMgZGF0YSB3ZSBtYXkgbmVlZCB0byBjb25zdHJ1Y3QgVlNJRiAoaS5lLiB0aW1pbmdf
M2RfZm9ybWF0LCBldGMuKQorICogIEBwYXJhbSBbb3V0XSBpbmZvX3BhY2tldDogICBvdXRwdXQg
c3RydWN0dXJlIHdoZXJlIHRvIHN0b3JlIFZTSUYKKyAqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKgorICov
Cit2b2lkIG1vZF9idWlsZF9oZl92c2lmX2luZm9wYWNrZXQoY29uc3Qgc3RydWN0IGRjX3N0cmVh
bV9zdGF0ZSAqc3RyZWFtLAorCQlzdHJ1Y3QgZGNfaW5mb19wYWNrZXQgKmluZm9fcGFja2V0LCBp
bnQgQUxMTUVuYWJsZWQsIGludCBBTExNVmFsdWUpCit7CisJCXVuc2lnbmVkIGludCBsZW5ndGgg
PSA1OworCQlib29sIGhkbWlfdmljX21vZGUgPSBmYWxzZTsKKwkJdWludDhfdCBjaGVja3N1bSA9
IDA7CisJCXVpbnQzMl90IGkgPSAwOworCQllbnVtIGRjX3RpbWluZ18zZF9mb3JtYXQgZm9ybWF0
OworCQlib29sIGJBTExNID0gKGJvb2wpQUxMTUVuYWJsZWQ7CisJCWJvb2wgYkFMTE1WYWwgPSAo
Ym9vbClBTExNVmFsdWU7CisKKwkJaW5mb19wYWNrZXQtPnZhbGlkID0gZmFsc2U7CisJCWZvcm1h
dCA9IHN0cmVhbS0+dGltaW5nLnRpbWluZ18zZF9mb3JtYXQ7CisJCWlmIChzdHJlYW0tPnZpZXdf
Zm9ybWF0ID09IFZJRVdfM0RfRk9STUFUX05PTkUpCisJCQlmb3JtYXQgPSBUSU1JTkdfM0RfRk9S
TUFUX05PTkU7CisKKwkJaWYgKHN0cmVhbS0+dGltaW5nLmhkbWlfdmljICE9IDAKKwkJCQkmJiBz
dHJlYW0tPnRpbWluZy5oX3RvdGFsID49IDM4NDAKKwkJCQkmJiBzdHJlYW0tPnRpbWluZy52X3Rv
dGFsID49IDIxNjAKKwkJCQkmJiBmb3JtYXQgPT0gVElNSU5HXzNEX0ZPUk1BVF9OT05FKQorCQkJ
aGRtaV92aWNfbW9kZSA9IHRydWU7CisKKwkJaWYgKChmb3JtYXQgPT0gVElNSU5HXzNEX0ZPUk1B
VF9OT05FKSAmJiAhaGRtaV92aWNfbW9kZSAmJiAhYkFMTE0pCisJCQlyZXR1cm47CisKKwkJaW5m
b19wYWNrZXQtPnNiWzFdID0gMHgwMzsKKwkJaW5mb19wYWNrZXQtPnNiWzJdID0gMHgwQzsKKwkJ
aW5mb19wYWNrZXQtPnNiWzNdID0gMHgwMDsKKworCQlpZiAoYkFMTE0pIHsKKwkJCWluZm9fcGFj
a2V0LT5zYlsxXSA9IDB4RDg7CisJCQlpbmZvX3BhY2tldC0+c2JbMl0gPSAweDVEOworCQkJaW5m
b19wYWNrZXQtPnNiWzNdID0gMHhDNDsKKwkJCWluZm9fcGFja2V0LT5zYls0XSA9IEhGX1ZTSUZf
VkVSU0lPTjsKKwkJfQorCisJCWlmIChmb3JtYXQgIT0gVElNSU5HXzNEX0ZPUk1BVF9OT05FKQor
CQkJaW5mb19wYWNrZXQtPnNiWzRdID0gKDIgPDwgNSk7CisKKwkJZWxzZSBpZiAoaGRtaV92aWNf
bW9kZSkKKwkJCWluZm9fcGFja2V0LT5zYls0XSA9ICgxIDw8IDUpOworCisJCXN3aXRjaCAoZm9y
bWF0KSB7CisJCWNhc2UgVElNSU5HXzNEX0ZPUk1BVF9IV19GUkFNRV9QQUNLSU5HOgorCQljYXNl
IFRJTUlOR18zRF9GT1JNQVRfU1dfRlJBTUVfUEFDS0lORzoKKwkJCWluZm9fcGFja2V0LT5zYls1
XSA9ICgweDAgPDwgNCk7CisJCQlicmVhazsKKworCQljYXNlIFRJTUlOR18zRF9GT1JNQVRfU0lE
RV9CWV9TSURFOgorCQljYXNlIFRJTUlOR18zRF9GT1JNQVRfU0JTX1NXX1BBQ0tFRDoKKwkJCWlu
Zm9fcGFja2V0LT5zYls1XSA9ICgweDggPDwgNCk7CisJCQlsZW5ndGggPSA2OworCQkJYnJlYWs7
CisKKwkJY2FzZSBUSU1JTkdfM0RfRk9STUFUX1RPUF9BTkRfQk9UVE9NOgorCQljYXNlIFRJTUlO
R18zRF9GT1JNQVRfVEJfU1dfUEFDS0VEOgorCQkJaW5mb19wYWNrZXQtPnNiWzVdID0gKDB4NiA8
PCA0KTsKKwkJCWJyZWFrOworCisJCWRlZmF1bHQ6CisJCQlicmVhazsKKwkJfQorCisJCWlmICho
ZG1pX3ZpY19tb2RlKQorCQkJaW5mb19wYWNrZXQtPnNiWzVdID0gc3RyZWFtLT50aW1pbmcuaGRt
aV92aWM7CisKKwkJaW5mb19wYWNrZXQtPmhiMCA9IEhETUlfSU5GT0ZSQU1FX1RZUEVfVkVORE9S
OworCQlpbmZvX3BhY2tldC0+aGIxID0gMHgwMTsKKwkJaW5mb19wYWNrZXQtPmhiMiA9ICh1aW50
OF90KSAobGVuZ3RoKTsKKworCQlpZiAoYkFMTE0pCisJCQlpbmZvX3BhY2tldC0+c2JbNV0gPSAo
aW5mb19wYWNrZXQtPnNiWzVdICYgfjB4MDIpIHwgKGJBTExNVmFsIDw8IDEpOworCisJCWNoZWNr
c3VtICs9IGluZm9fcGFja2V0LT5oYjA7CisJCWNoZWNrc3VtICs9IGluZm9fcGFja2V0LT5oYjE7
CisJCWNoZWNrc3VtICs9IGluZm9fcGFja2V0LT5oYjI7CisKKwkJZm9yIChpID0gMTsgaSA8PSBs
ZW5ndGg7IGkrKykKKwkJCWNoZWNrc3VtICs9IGluZm9fcGFja2V0LT5zYltpXTsKKworCQlpbmZv
X3BhY2tldC0+c2JbMF0gPSAodWludDhfdCkgKDB4MTAwIC0gY2hlY2tzdW0pOworCisJCWluZm9f
cGFja2V0LT52YWxpZCA9IHRydWU7Cit9CisKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4
