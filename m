Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BE288510
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 23:38:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC85B6EECA;
	Fri,  9 Aug 2019 21:38:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780040.outbound.protection.outlook.com [40.107.78.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F37CE6EEC6
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 21:38:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cYB47I8j1nMNowyU2EBL3lnZKvIrk9BfElW1/UfMnilAbbHuhgFot78figAPiyhmvY+EqkYvE0CUqiagLyvrEuvhdK4rW2NyRxlIHwxevj6vEcbXe5i8QCHcgkeD+RtS7mkVCPFUsD2YMd3H/rdJfikZjl1K3TRTxh81eylCnvnrd1GARcrYNvwNroG8/qk+yU4yL0jwsT3HkXbnebHatc60UFCzWgnhgdkssjxb/7zj4aAFtNbMbSla/TOeyBJEsFJKjvWCZ+W1wfZGV5rm8+ZBMopA+O1354obm9ran1BhAaBbejiWuJMSBD0ikp30AHohuLBNqBsIZ8Sq7QYFAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z01moTJHNT9U2VEYsN34kQasDJqhN1E6VqRmFVnhrxE=;
 b=BlM+jtdeLfNPtcmLIX0ZtMtfERD0o+Le5gt8ELW5MoaLQwJEmAAOCCpTW0AHtiuwWecblyp+sJz1FFgXxYCgX3Y/88BsW09xHv38XMv/UOriHgOADXOMWsQH5s6rLEidJjtib8I8+9AyUAaSkdClWtIlXj/SfpJP2F9YUBWGTw1m3RYsw0neJHC1e1lM6uZRe44ODAPBdM3MMNCkqkcHGcnyuQa8PUppmIaAIz83efd95FK/1TPGXdIlEdrsgDTQx6N4bCF/tAiSD8FbeUnU30t7fSLk5gjUUl2vu4v/X7TxKffYbN0VhtpE4PklQNAf/4pnBa5tq6XJ40zNaMXbPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN6PR12CA0039.namprd12.prod.outlook.com (2603:10b6:405:70::25)
 by BYAPR12MB2712.namprd12.prod.outlook.com (2603:10b6:a03:68::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.18; Fri, 9 Aug
 2019 21:38:53 +0000
Received: from DM3NAM03FT062.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::209) by BN6PR12CA0039.outlook.office365.com
 (2603:10b6:405:70::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.15 via Frontend
 Transport; Fri, 9 Aug 2019 21:38:52 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT062.mail.protection.outlook.com (10.152.83.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2157.15 via Frontend Transport; Fri, 9 Aug 2019 21:38:52 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Fri, 9 Aug 2019 16:38:42 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 39/49] drm/amd/display: Remove redundant definition of
 dwb_source enums
Date: Fri, 9 Aug 2019 17:37:32 -0400
Message-ID: <20190809213742.30301-40-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190809213742.30301-1-sunpeng.li@amd.com>
References: <20190809213742.30301-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(136003)(39860400002)(376002)(2980300002)(428003)(189003)(199004)(1076003)(6666004)(336012)(36756003)(2876002)(426003)(86362001)(305945005)(476003)(5660300002)(446003)(47776003)(11346002)(49486002)(2906002)(2870700001)(186003)(2616005)(126002)(356004)(486006)(53936002)(8676002)(81156014)(6916009)(26005)(81166006)(51416003)(54906003)(478600001)(8936002)(316002)(2351001)(48376002)(70586007)(50466002)(70206006)(50226002)(4326008)(76176011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2712; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ca0f65a-3462-4e08-89a1-08d71d11f90c
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BYAPR12MB2712; 
X-MS-TrafficTypeDiagnostic: BYAPR12MB2712:
X-Microsoft-Antispam-PRVS: <BYAPR12MB2712C12015CA470450BA51DC82D60@BYAPR12MB2712.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1443;
X-Forefront-PRVS: 01244308DF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: ry7/RVzr1OY182xamwLxLpbHTtDs8kFnBn1y5Ox0ksxO5CvUIT+uxYv1M0v2euGwyDTekGJUhXaJwhdkV6bSnSAaRuBr2PAEFv7tPBPGgzQzyCQ6WQ43IEtNdoSiBhdrKnweq3zqeKF+9On6Wi4E2ESl5G9KArxO75gFN2G0zM8aVvezJOTCsdNFTPnD+OnQJuqFg9743Jpyx6YjjG0FgHyVofbqLIJvTd74GjF4h0TeQrLITTPq4bh7NyEQFxCEkdScqFfjk4gmDBDqEmVIp2QpEMb2ayeSbepBHufzyp3fTua7g3FxjaDNLwgFe61ldU+mgC8X14FnOJMCix/ROpNWS0A00FACi+LM4o/LeK/KxzMxCCoRo6SGzK9i6t4PSrOXIDT202Q+GJsJqABvfy+ffqKbnFK71MGwyfHOUOI=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2019 21:38:52.4821 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ca0f65a-3462-4e08-89a1-08d71d11f90c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2712
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z01moTJHNT9U2VEYsN34kQasDJqhN1E6VqRmFVnhrxE=;
 b=usCs/b7AFi5pRl9I1hzhdq7Yr7yr6GSquuPf2B1exYaKtn5OXAtfqvHFQOshIQG/kL0Lgf6MKnWXfb9zM+dtk8WmezRbc2LTFGvexIonn9dzJbmGHnYPuArR1+tA08sPQAB5/VS1icyaA8nODS4qITa/cWbIt3gAfXFBQOCaPf8=
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
 Julian Parkin <julian.parkin@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSnVsaWFuIFBhcmtpbiA8anVsaWFuLnBhcmtpbkBhbWQuY29tPgoKVGhlcmUgYXJlIHJl
cGVhdGVkIChidXQgZ3VhcmRlZCkgZGVmaW5pdGlvbnMgb2YgZHdiX3NyYyBlbnVtcy4gVGhlcmUg
YXJlCmFsc28gdW51c2VkIGVudGlyZXMuIENsZWFuIHRoZW0gdXAuCgpTaWduZWQtb2ZmLWJ5OiBK
dWxpYW4gUGFya2luIDxqdWxpYW4ucGFya2luQGFtZC5jb20+ClJldmlld2VkLWJ5OiBDaGFybGVu
ZSBMaXUgPENoYXJsZW5lLkxpdUBhbWQuY29tPgpBY2tlZC1ieTogTGVvIExpIDxzdW5wZW5nLmxp
QGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2luYy9ody9kd2Iu
aCB8IDEyIC0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEyIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9pbmMvaHcvZHdiLmggYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvaW5jL2h3L2R3Yi5oCmluZGV4IGEzNDA5Mjk0
YWUwYy4uZmYxYTA3YjM1Yzg1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvaW5jL2h3L2R3Yi5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9p
bmMvaHcvZHdiLmgKQEAgLTQ1LDIyICs0NSwxMCBAQCBlbnVtIGR3Yl9zb3VyY2UgewogCWR3Yl9z
cmNfc2NsID0gMCwJLyogZm9yIERDRTd4Lzl4LCBEQ04gd29uJ3Qgc3VwcG9ydC4gKi8KIAlkd2Jf
c3JjX2JsbmQsCQkvKiBmb3IgRENFN3gvOXggKi8KIAlkd2Jfc3JjX2ZtdCwJCS8qIGZvciBEQ0U3
eC85eCAqLwotI2lmIGRlZmluZWQoQ09ORklHX0RSTV9BTURfRENfRENOMl8wKQogCWR3Yl9zcmNf
b3RnMCA9IDB4MTAwLAkvKiBmb3IgRENOMS54L0RDTjIueCwgcmVnaXN0ZXI6IG1tRFdCX1NPVVJD
RV9TRUxFQ1QgKi8KIAlkd2Jfc3JjX290ZzEsCQkvKiBmb3IgRENOMS54L0RDTjIueCAqLwogCWR3
Yl9zcmNfb3RnMiwJCS8qIGZvciBEQ04xLngvRENOMi54ICovCiAJZHdiX3NyY19vdGczLAkJLyog
Zm9yIERDTjEueC9EQ04yLnggKi8KLSNlbHNlCi0JZHdiX3NyY19vdGcwID0gMHgxMDAsCS8qIGZv
ciBEQ04xLngsIHJlZ2lzdGVyOiBtbURXQl9TT1VSQ0VfU0VMRUNUICovCi0JZHdiX3NyY19vdGcx
LAkJLyogZm9yIERDTjEueCAqLwotCWR3Yl9zcmNfb3RnMiwJCS8qIGZvciBEQ04xLnggKi8KLQlk
d2Jfc3JjX290ZzMsCQkvKiBmb3IgRENOMS54ICovCi0jZW5kaWYKLQlkd2Jfc3JjX21wYzAgPSAw
eDIwMCwJLyogZm9yIERDTjIsIHJlZ2lzdGVyOiBtbU1QQ19EV0IwX01VWCwgbW1NUENfRFdCMV9N
VVgsIG1tTVBDX0RXQjJfTVVYICovCi0JZHdiX3NyY19tcGMxLAkJLyogZm9yIERDTjIgKi8KLQlk
d2Jfc3JjX21wYzIsCQkvKiBmb3IgRENOMiAqLwotCWR3Yl9zcmNfbXBjMywJCS8qIGZvciBEQ04y
ICovCi0JZHdiX3NyY19tcGM0LAkJLyogZm9yIERDTjIgKi8KIH07CiAKICNpZiBkZWZpbmVkKENP
TkZJR19EUk1fQU1EX0RDX0RDTjJfMCkKLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4
