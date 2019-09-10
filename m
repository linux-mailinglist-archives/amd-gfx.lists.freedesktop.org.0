Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0DEAEC7A
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Sep 2019 15:55:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 182536E8FE;
	Tue, 10 Sep 2019 13:55:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680060.outbound.protection.outlook.com [40.107.68.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D27A66E8F9
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2019 13:55:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FrKGmOUVaGW4hGYHYuUROs7LW+rbLeF3rB+jn940ScPW2aYk8+Ho9QlPMULNn4zYC37yEonaL341lNdDcEU4hZtXDwxoScgyR1vAqVObXsh7yNiZfkmpz3AcWvlrRl/z+qvHdhrS9x8PpMPpV9CyuT5TdSMYa26SCY830xcieF71DomY+nT1V4vUUwkMXESk2fUWl4vIpr1avttrb1cJYm1urkAHxIF8rRh5q6Mp0uDs8puJHahjlAvwYO01weeVJlgnvxwqaAUI/UN1EpNOPLHi2bCBp5eSTHte7X1WuNPtlB8fczAUX2wp63C23iLkhjkpACP+mB9b5afENxYnDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jUorQVLjccHyJeYM+eh6u77NJUIlr7VIxLDv83ZA2us=;
 b=N0DGPLNoIUhiGJgQL4xQF2B4ceTyXkX1IcMUoAGbGUsv15HsW3dnqoFCC4rAnqfGXE18lypp4jquUUSckMQw/nW7k8sKDddewK32gdoGtRK+UC39AWmtNCmhqkLZsWSHgeSxacRSjdo01NsH7mja3O1dK6046r+GN6k55LRGOQTqz0BjrVtKwwPtl6bhPInaFxwicp/Uy7OhLCi+oBgMN4JbkmGCb6HrukIL7G4ojS8MuH8Hx2z1RDHL5yVJPE4yrPKmudzXAWXB6xPvGVee9p3IOiyLlzdCsieov1jotDiYnCGBYdQ0W1AvxEIJKMbM+Eg4Uv+G0fK5XOhLfxtg+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM6PR12CA0020.namprd12.prod.outlook.com (2603:10b6:5:1c0::33)
 by MN2PR12MB4030.namprd12.prod.outlook.com (2603:10b6:208:16e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.18; Tue, 10 Sep
 2019 13:55:07 +0000
Received: from CO1NAM03FT026.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::200) by DM6PR12CA0020.outlook.office365.com
 (2603:10b6:5:1c0::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2241.18 via Frontend
 Transport; Tue, 10 Sep 2019 13:55:07 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT026.mail.protection.outlook.com (10.152.80.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2241.14 via Frontend Transport; Tue, 10 Sep 2019 13:55:07 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Tue, 10 Sep 2019 08:55:01 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 21/25] drm/amd/display: Add missing HBM support and raise
 Vega20's uclk.
Date: Tue, 10 Sep 2019 09:54:41 -0400
Message-ID: <20190910135445.18300-22-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190910135445.18300-1-sunpeng.li@amd.com>
References: <20190910135445.18300-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(136003)(396003)(39860400002)(2980300002)(428003)(189003)(199004)(336012)(70586007)(446003)(1076003)(2870700001)(486006)(53936002)(6916009)(5660300002)(47776003)(51416003)(48376002)(2906002)(76176011)(54906003)(316002)(6666004)(356004)(126002)(2616005)(49486002)(50466002)(478600001)(186003)(426003)(476003)(26005)(4326008)(2351001)(11346002)(36756003)(81166006)(81156014)(70206006)(86362001)(8676002)(50226002)(8936002)(2876002)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4030; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cf60749d-d072-485d-f89b-08d735f67d49
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:MN2PR12MB4030; 
X-MS-TrafficTypeDiagnostic: MN2PR12MB4030:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4030A76C27B92B41B29FF2E882B60@MN2PR12MB4030.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-Forefront-PRVS: 01565FED4C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 6goi+FRGCufOZQGprOq1U3uj0+tJJ/u2i+f21pSVkbTNj6kc04dQTvuMDS5Vfoflx3m95nCmuS7aJ/XAlIe3nJCt2hvxHLvA6SLxYlZNtatpY3inLXr9uNmieeRVc4dQmtJyJ1nQZDEW25pVhoYVbN+40lxJ/5ebvyzoP4pBzJdgCxCtXBicVHRNHmk5sEkgz5zavBw7FICcL4T+4qL28q4r72+33nVuh/EG2LeOEGx1hsft3FXNV1XZRB6Iffp0r+gNmlOu8P7RzNUOjkUSMiuajlniuc6mb0VrUIcGM5ZzZJGhA9LFX/5pGZZ7mJ6XvWz6LiteBIxQLQOF566oRJXbbde9aijoc6F74g0muyiNig0PoAHj77c6bZOgvC2utkhl9SKp+40iG1tTcGUsP9bKe9OisoUV6i9ysj91XAY=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2019 13:55:07.3638 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf60749d-d072-485d-f89b-08d735f67d49
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4030
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jUorQVLjccHyJeYM+eh6u77NJUIlr7VIxLDv83ZA2us=;
 b=v+oaoOyg0XYLSPfeuT/T6CG8WOkPKmJvp+HrF+U1NOSe1OaTi+8G/FwkZrrznBjQlRoSjOx9UuMnnaGlJeDe/mTc/d6r5jFlK2uzYmJMw/gHpsnBvNHNPeVMscLQFAZgr8icR8vKYI7Vif8PDzc4xJXfOHEhhC0j3Uzu7317e1E=
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
Cc: Leo Li <sunpeng.li@amd.com>, Zhan Liu <zhan.liu@amd.com>,
 Roman Li <Roman.Li@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogWmhhbiBMaXUgPHpoYW4ubGl1QGFtZC5jb20+CgpbV2h5XQpXaGVuIG1vcmUgdGhhbiAy
IGRpc3BsYXlzIGFyZSBjb25uZWN0ZWQgdG8gdGhlIGdyYXBoaWNzIGNhcmQsCm9ubHkgdGhlIG1p
bmltdW0gbWVtb3J5IGNsb2NrIGlzIG5lZWRlZC4gSG93ZXZlciwgd2hlbiBtb3JlCmRpc3BsYXlz
IGFyZSBjb25uZWN0ZWQsIHRoZSBtaW5pbXVtIG1lbW9yeSBjbG9jayBpcyBub3QKc3VmZmljaWVu
dCBlbm91Z2ggdG8gc3VwcG9ydCB0aGUgb3ZlcndoZWxtaW5nIGJhbmR3aWR0aC4KU3lzdGVtIHdp
bGwgaGFuZyB1bmRlciB0aGlzIGNpcmN1bXN0YW5jZS4KCkFsc28sIHRoZSBvbGQgY29kZSBkaWRu
J3QgYWRkcmVzcyBIQk0gY2FyZHMsIHdoaWNoIGhhcyAyCnBzZXVkbyBjaGFubmVscy4gV2UgbmVl
ZCB0byBhZGQgdGhlIEhCTSBwYXJ0IGhlcmUuCgpbSG93XQpXaGVuIGdyYXBoaWNzIGNhcmQgY29u
bmVjdHMgdG8gMiBvciBtb3JlIGRpc3BsYXlzLApzd2l0Y2ggdG8gaGlnaCBtZW1vcnkgY2xvY2su
IEFsc28sIGNob29zZSBtZW1vcnkKbXVsdGlwbGllciBiYXNlZCBvbiB3aGV0aGVyIGl0cyByZWd1
bGFyIERSQU0gb3IgSEJNLgoKU2lnbmVkLW9mZi1ieTogWmhhbiBMaXUgPHpoYW4ubGl1QGFtZC5j
b20+ClJldmlld2VkLWJ5OiBSb21hbiBMaSA8Um9tYW4uTGlAYW1kLmNvbT4KQWNrZWQtYnk6IExl
byBMaSA8c3VucGVuZy5saUBhbWQuY29tPgotLS0KIC4uLi9kaXNwbGF5L2RjL2Nsa19tZ3IvZGNl
MTEwL2RjZTExMF9jbGtfbWdyLmMgfCAxOCArKysrKysrKysrKysrKysrLS0KIDEgZmlsZSBjaGFu
Z2VkLCAxNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jbGtfbWdyL2RjZTExMC9kY2UxMTBfY2xrX21nci5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Nsa19tZ3IvZGNlMTEwL2RjZTExMF9j
bGtfbWdyLmMKaW5kZXggZWUzMmQyYzE5MzA1Li4zNjI3N2JjYTAzMjYgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jbGtfbWdyL2RjZTExMC9kY2UxMTBfY2xrX21n
ci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jbGtfbWdyL2RjZTExMC9k
Y2UxMTBfY2xrX21nci5jCkBAIC0xNzQsNiArMTc0LDEwIEBAIHZvaWQgZGNlMTFfcHBsaWJfYXBw
bHlfZGlzcGxheV9yZXF1aXJlbWVudHMoCiAJc3RydWN0IGRjX3N0YXRlICpjb250ZXh0KQogewog
CXN0cnVjdCBkbV9wcF9kaXNwbGF5X2NvbmZpZ3VyYXRpb24gKnBwX2Rpc3BsYXlfY2ZnID0gJmNv
bnRleHQtPnBwX2Rpc3BsYXlfY2ZnOworCWludCBtZW1vcnlfdHlwZV9tdWx0aXBsaWVyID0gTUVN
T1JZX1RZUEVfTVVMVElQTElFUl9DWjsKKworCWlmIChkYy0+YndfdmJpb3MgJiYgZGMtPmJ3X3Zi
aW9zLT5tZW1vcnlfdHlwZSA9PSBid19kZWZfaGJtKQorCQltZW1vcnlfdHlwZV9tdWx0aXBsaWVy
ID0gTUVNT1JZX1RZUEVfSEJNOwogCiAJcHBfZGlzcGxheV9jZmctPmFsbF9kaXNwbGF5c19pbl9z
eW5jID0KIAkJY29udGV4dC0+YndfY3R4LmJ3LmRjZS5hbGxfZGlzcGxheXNfaW5fc3luYzsKQEAg
LTE4Niw4ICsxOTAsMTggQEAgdm9pZCBkY2UxMV9wcGxpYl9hcHBseV9kaXNwbGF5X3JlcXVpcmVt
ZW50cygKIAlwcF9kaXNwbGF5X2NmZy0+Y3B1X3BzdGF0ZV9zZXBhcmF0aW9uX3RpbWUgPQogCQkJ
Y29udGV4dC0+YndfY3R4LmJ3LmRjZS5ibGFja291dF9yZWNvdmVyeV90aW1lX3VzOwogCi0JcHBf
ZGlzcGxheV9jZmctPm1pbl9tZW1vcnlfY2xvY2tfa2h6ID0gY29udGV4dC0+YndfY3R4LmJ3LmRj
ZS55Y2xrX2toegotCQkvIE1FTU9SWV9UWVBFX01VTFRJUExJRVJfQ1o7CisJLyoKKwkgKiBUT0RP
OiBkZXRlcm1pbmUgd2hldGhlciB0aGUgYmFuZHdpZHRoIGhhcyByZWFjaGVkIG1lbW9yeSdzIGxp
bWl0YXRpb24KKwkgKiAsIHRoZW4gY2hhbmdlIG1pbmltdW0gbWVtb3J5IGNsb2NrIGJhc2VkIG9u
IHJlYWwtdGltZSBiYW5kd2lkdGgKKwkgKiBsaW1pdGF0aW9uLgorCSAqLworCWlmIChBU0lDUkVW
X0lTX1ZFR0EyMF9QKGRjLT5jdHgtPmFzaWNfaWQuaHdfaW50ZXJuYWxfcmV2KSAmJiAoY29udGV4
dC0+c3RyZWFtX2NvdW50ID49IDIpKSB7CisJCXBwX2Rpc3BsYXlfY2ZnLT5taW5fbWVtb3J5X2Ns
b2NrX2toeiA9IG1heChwcF9kaXNwbGF5X2NmZy0+bWluX21lbW9yeV9jbG9ja19raHosCisJCQko
dWludDMyX3QpIChkYy0+YndfdmJpb3MtPmhpZ2hfeWNsay52YWx1ZSAvIG1lbW9yeV90eXBlX211
bHRpcGxpZXIgLyAxMDAwMCkpOworCX0gZWxzZSB7CisJCXBwX2Rpc3BsYXlfY2ZnLT5taW5fbWVt
b3J5X2Nsb2NrX2toeiA9IGNvbnRleHQtPmJ3X2N0eC5idy5kY2UueWNsa19raHoKKwkJCS8gbWVt
b3J5X3R5cGVfbXVsdGlwbGllcjsKKwl9CiAKIAlwcF9kaXNwbGF5X2NmZy0+bWluX2VuZ2luZV9j
bG9ja19raHogPSBkZXRlcm1pbmVfc2Nsa19mcm9tX2JvdW5kaW5nX2JveCgKIAkJCWRjLAotLSAK
Mi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
bWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
