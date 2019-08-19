Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 144F492708
	for <lists+amd-gfx@lfdr.de>; Mon, 19 Aug 2019 16:36:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03ACD6E177;
	Mon, 19 Aug 2019 14:36:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700051.outbound.protection.outlook.com [40.107.70.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D1B16E176
 for <amd-gfx@lists.freedesktop.org>; Mon, 19 Aug 2019 14:36:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b8xFkabyOMHiDRWrM2q+pQL/HKuilqjdRkeqqag0yGYALHR0wIv41eVO2jFcOYh+dhbP87DC+DT7C9GO7hIxdlCF5Tce1M5AhUF5CBp13lvHuIz5xHjs8ycdu7nYHw26liIsS6ItXDjlyEQWQqz/j+/FrrC4id0+SmCAn75HfILF8xOf6EnlQQ+eRzOhrDyxH5OpT2Qzo8Crab6MaySj0JyjIfWbMQo6t0fZtB4oreQSsSfX6o+5MYmDlB2n9dUYsWtCYYWx5FSj0SEpgrQSLRF3O6cKwOVUr0dhMqyF5y+MBFrYvaAy3jB5Em4WgLZzR8i5wBqqYr8Ht8EdcpjWKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bkPoeRLFC4wDKAP7KqoWz9jLMfp4S/PtPzzaIgLWhdo=;
 b=WuMmVKhini5ELUQzGrFQmO+83mmf/x38t0vgKofzVUTWO3NE9e+2zcViMYyzdZ0fcrFn0NeLdR2XQf4SXPFPGDLmZ35sjsnGQXnpmn9CMTR4i+V28JtgIsDhYuH8IV8ZddZUzuyQgX4ZurHnSfUBmfeltz1KLOHjoBhLwq/kmnOzlLAr9BpZXS7MIsOIxi9gTkroZ54cZiBAcXyRQYi0v0abkT4mhX1dGmvMximww8odXpYXoKGUSUQBht8OxXFDvtzydUnPc2Eq93how5v/I0jVdqB+EsT3JBIIyE7XnbdiNJ7u0Kx2kTNLDy3I3Er5IgAB1sNTemAOfLn6sBKyDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN6PR12CA0032.namprd12.prod.outlook.com (2603:10b6:405:70::18)
 by DM5PR12MB1273.namprd12.prod.outlook.com (2603:10b6:3:76::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.18; Mon, 19 Aug
 2019 14:36:09 +0000
Received: from BY2NAM03FT016.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::208) by BN6PR12CA0032.outlook.office365.com
 (2603:10b6:405:70::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Mon, 19 Aug 2019 14:36:09 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT016.mail.protection.outlook.com (10.152.84.215) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Mon, 19 Aug 2019 14:36:09 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Mon, 19 Aug 2019
 09:35:51 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 35/36] drm/amd/display: flicking observed while installing
 driver on Navi10 CF
Date: Mon, 19 Aug 2019 10:35:14 -0400
Message-ID: <20190819143515.21653-36-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819143515.21653-1-Bhawanpreet.Lakha@amd.com>
References: <20190819143515.21653-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(396003)(136003)(39860400002)(2980300002)(428003)(199004)(189003)(70206006)(47776003)(86362001)(2906002)(305945005)(1076003)(5660300002)(53416004)(2351001)(36756003)(16586007)(186003)(50466002)(48376002)(81156014)(76176011)(8676002)(81166006)(8936002)(478600001)(14444005)(50226002)(53936002)(126002)(2616005)(356004)(6666004)(446003)(476003)(11346002)(486006)(336012)(316002)(426003)(4326008)(6916009)(51416003)(26005)(7696005)(70586007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1273; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f874ce9a-f23a-4ebe-2af4-08d724b29392
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM5PR12MB1273; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1273:
X-Microsoft-Antispam-PRVS: <DM5PR12MB12734B06CF271F41D53F16E5F9A80@DM5PR12MB1273.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-Forefront-PRVS: 0134AD334F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: TL9bJ/FViJAnylGJRLjOUM+fTIuAOT9A58pbQRSXS3iJbQCd8Y0DOqPvN49JLj6ficoDHJfNxO1ASgU++6ASqtRGQTBl14WRfnzEXKcOK+f5kJFEHR5Mi9ImMZxHXikh6OUx5Cr+1awm7u6LxQ89t8uqSdWwJbSNx19N02KP2Va0AfUuPkDaFfd+kFc/H456OoJ+S4Kp31/P6DznXgjFB1d9xg0OpRagkiS+2fkUhoQKxR+QyAPWeBRWLvzDrzTbXiE7nF1XplP+ZFro0Ze6oxWv4e4re1Nsz3mcgarVOj7mcDLSu0HQrXGjS7gmVVJZO8ZjQee0snAaUs+tYJS6Bcy0HFnTV4e/LI74gnYGwHCN4hQ9n82HPXqj7iCQrZqnenWDWROhZ623UyLh7tmkyFjIsM6lWIeUL3hzB1GZeQw=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2019 14:36:09.3341 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f874ce9a-f23a-4ebe-2af4-08d724b29392
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1273
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bkPoeRLFC4wDKAP7KqoWz9jLMfp4S/PtPzzaIgLWhdo=;
 b=H/aB5VxTntQOIajSd30h5DfA7vSuCYi3e5QtLjMAIBDVUpok0rqvDDKKTGyIw9mVVVSg1W3YwFTPXOduXG28d+/fWqTfxbfvgU36DpHufDyUUI6EKJfIhApjYCKO0SbxEIBROLIPY6+XmrYp5JYkMmAvE3UrrVFmE6LJ3tpyTEo=
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
Cc: hersen wu <hersenxs.wu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogaGVyc2VuIHd1IDxoZXJzZW54cy53dUBhbWQuY29tPgoKW1dIWV0gdmFsdWUgb2YgZGNo
dWJfcmVmX2Nsb2NrIGlzIGRlY2lkZWQgYnkgZGNodWJidWIgZ2xvYmFsIHRpbWVyCnNldHRpbmdz
IHdoaWNoIGlzIHByb2dyYW1tZWQgYnkgdmJpb3MgY29tbWFuZCB0YWJsZSBkaXNwX2luaXQuCmZv
ciBtdWx0aS1HUFUgY2FzZSwgdmJpb3MgaXMgcG9zdGVkIG9ubHkgZm9yIHByaW1hcnkgR1BVLiB3
aXRob3V0CnZiaW9zIHBvc3RlZCBmb3IgdGhlIHNlY29uZGFyeSBHUFUsIHZhbHVlIG9mIGRjaHVi
X3JlZl9jbG9jayBpcyBub3QKc2V0IHByb3Blcmx5LiB0aGlzIHZhbHVlIHdpbGwgYWZmZWN0IGRj
biBiYW5kd2lkdGggY2FsY3VhdGlvbiBhbmQKY2F1c2UgdW5kZXJmbG93LiB1c2VyIHdpbGwgc2Vl
IHNjcmVlbiBmbGlja2luZyBkdXJpbmcgZHJpdmVyCmluc3RhbGxhdGlvbiBmb3IgZHVhbCBHUFUg
Y2FzZS4KCltIT1ddIGRjIGluaXRfaHcgYWx3YXlzIGNhbGwgdmJpb3MgY29tbWFuZCB0YWJsZSBk
aXNwX2luaXQgdG8KbWFrZSBzdXJlIGRjaHViYnViIGdsb2JhbCB0aW1lciBpcyBjb25maWd1cmVk
IGFuZCBlbmFibGUuCgpTaWduZWQtb2ZmLWJ5OiBoZXJzZW4gd3UgPGhlcnNlbnhzLnd1QGFtZC5j
b20+ClJldmlld2VkLWJ5OiBKdW4gTGVpIDxKdW4uTGVpQGFtZC5jb20+CkFja2VkLWJ5OiBCaGF3
YW5wcmVldCBMYWtoYSA8Qmhhd2FucHJlZXQuTGFraGFAYW1kLmNvbT4KLS0tCiAuLi4vZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX3Jlc291cmNlLmMgfCAgMSArCiAuLi4vYW1kL2Rpc3Bs
YXkvZGMvZGNuMTAvZGNuMTBfaHdfc2VxdWVuY2VyLmMgfCA1NCArKysrKysrKystLS0tLS0tLS0t
CiAyIGZpbGVzIGNoYW5nZWQsIDI4IGluc2VydGlvbnMoKyksIDI3IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX3Jlc291cmNl
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19yZXNvdXJjZS5jCmlu
ZGV4IDZlODhjYjBmZmZjZS4uYWRiZjJkNGUxNzIzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19yZXNvdXJjZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX3Jlc291cmNlLmMKQEAgLTE2OSw2ICsxNjksNyBAQCBz
dHJ1Y3QgcmVzb3VyY2VfcG9vbCAqZGNfY3JlYXRlX3Jlc291cmNlX3Bvb2woc3RydWN0IGRjICAq
ZGMsCiAJZGVmYXVsdDoKIAkJYnJlYWs7CiAJfQorCiAJaWYgKHJlc19wb29sICE9IE5VTEwpIHsK
IAkJaWYgKGRjLT5jdHgtPmRjX2Jpb3MtPmZ3X2luZm9fdmFsaWQpIHsKIAkJCXJlc19wb29sLT5y
ZWZfY2xvY2tzLnh0YWxpbl9jbG9ja19pbktoeiA9CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfaHdfc2VxdWVuY2VyLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfaHdfc2VxdWVuY2VyLmMKaW5kZXggMzI3
MmRhOTU1YjZkLi41YjlkZDE2OWExNmYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9kY24xMC9kY24xMF9od19zZXF1ZW5jZXIuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfaHdfc2VxdWVuY2VyLmMKQEAgLTEyMDgsMzQg
KzEyMDgsMzQgQEAgc3RhdGljIHZvaWQgZGNuMTBfaW5pdF9odyhzdHJ1Y3QgZGMgKmRjKQogCQly
ZXR1cm47CiAJfQogCi0JaWYgKCFkY2ItPmZ1bmNzLT5pc19hY2NlbGVyYXRlZF9tb2RlKGRjYikp
IHsKLQkJZGMtPmh3c3MuYmlvc19nb2xkZW5faW5pdChkYyk7Ci0JCWlmIChkYy0+Y3R4LT5kY19i
aW9zLT5md19pbmZvX3ZhbGlkKSB7Ci0JCQlyZXNfcG9vbC0+cmVmX2Nsb2Nrcy54dGFsaW5fY2xv
Y2tfaW5LaHogPQotCQkJCQlkYy0+Y3R4LT5kY19iaW9zLT5md19pbmZvLnBsbF9pbmZvLmNyeXN0
YWxfZnJlcXVlbmN5OwotCi0JCQlpZiAoIUlTX0ZQR0FfTUFYSU1VU19EQyhkYy0+Y3R4LT5kY2Vf
ZW52aXJvbm1lbnQpKSB7Ci0JCQkJaWYgKHJlc19wb29sLT5kY2NnICYmIHJlc19wb29sLT5odWJi
dWIpIHsKLQotCQkJCQkocmVzX3Bvb2wtPmRjY2ctPmZ1bmNzLT5nZXRfZGNjZ19yZWZfZnJlcSko
cmVzX3Bvb2wtPmRjY2csCi0JCQkJCQkJZGMtPmN0eC0+ZGNfYmlvcy0+ZndfaW5mby5wbGxfaW5m
by5jcnlzdGFsX2ZyZXF1ZW5jeSwKLQkJCQkJCQkmcmVzX3Bvb2wtPnJlZl9jbG9ja3MuZGNjZ19y
ZWZfY2xvY2tfaW5LaHopOwotCi0JCQkJCShyZXNfcG9vbC0+aHViYnViLT5mdW5jcy0+Z2V0X2Rj
aHViX3JlZl9mcmVxKShyZXNfcG9vbC0+aHViYnViLAotCQkJCQkJCXJlc19wb29sLT5yZWZfY2xv
Y2tzLmRjY2dfcmVmX2Nsb2NrX2luS2h6LAotCQkJCQkJCSZyZXNfcG9vbC0+cmVmX2Nsb2Nrcy5k
Y2h1Yl9yZWZfY2xvY2tfaW5LaHopOwotCQkJCX0gZWxzZSB7Ci0JCQkJCS8vIE5vdCBhbGwgQVNJ
Q3MgaGF2ZSBEQ0NHIHN3IGNvbXBvbmVudAotCQkJCQlyZXNfcG9vbC0+cmVmX2Nsb2Nrcy5kY2Nn
X3JlZl9jbG9ja19pbktoeiA9Ci0JCQkJCQkJcmVzX3Bvb2wtPnJlZl9jbG9ja3MueHRhbGluX2Ns
b2NrX2luS2h6OwotCQkJCQlyZXNfcG9vbC0+cmVmX2Nsb2Nrcy5kY2h1Yl9yZWZfY2xvY2tfaW5L
aHogPQotCQkJCQkJCXJlc19wb29sLT5yZWZfY2xvY2tzLnh0YWxpbl9jbG9ja19pbktoejsKLQkJ
CQl9Ci0JCQl9Ci0JCX0gZWxzZQotCQkJQVNTRVJUX0NSSVRJQ0FMKGZhbHNlKTsKKwlpZiAoIWRj
Yi0+ZnVuY3MtPmlzX2FjY2VsZXJhdGVkX21vZGUoZGNiKSkKIAkJZGMtPmh3c3MuZGlzYWJsZV92
Z2EoZGMtPmh3c2VxKTsKLQl9CisKKwlkYy0+aHdzcy5iaW9zX2dvbGRlbl9pbml0KGRjKTsKKwlp
ZiAoZGMtPmN0eC0+ZGNfYmlvcy0+ZndfaW5mb192YWxpZCkgeworCQlyZXNfcG9vbC0+cmVmX2Ns
b2Nrcy54dGFsaW5fY2xvY2tfaW5LaHogPQorCQkJCWRjLT5jdHgtPmRjX2Jpb3MtPmZ3X2luZm8u
cGxsX2luZm8uY3J5c3RhbF9mcmVxdWVuY3k7CisKKwkJaWYgKCFJU19GUEdBX01BWElNVVNfREMo
ZGMtPmN0eC0+ZGNlX2Vudmlyb25tZW50KSkgeworCQkJaWYgKHJlc19wb29sLT5kY2NnICYmIHJl
c19wb29sLT5odWJidWIpIHsKKworCQkJCShyZXNfcG9vbC0+ZGNjZy0+ZnVuY3MtPmdldF9kY2Nn
X3JlZl9mcmVxKShyZXNfcG9vbC0+ZGNjZywKKwkJCQkJCWRjLT5jdHgtPmRjX2Jpb3MtPmZ3X2lu
Zm8ucGxsX2luZm8uY3J5c3RhbF9mcmVxdWVuY3ksCisJCQkJCQkmcmVzX3Bvb2wtPnJlZl9jbG9j
a3MuZGNjZ19yZWZfY2xvY2tfaW5LaHopOworCisJCQkJKHJlc19wb29sLT5odWJidWItPmZ1bmNz
LT5nZXRfZGNodWJfcmVmX2ZyZXEpKHJlc19wb29sLT5odWJidWIsCisJCQkJCQlyZXNfcG9vbC0+
cmVmX2Nsb2Nrcy5kY2NnX3JlZl9jbG9ja19pbktoeiwKKwkJCQkJCSZyZXNfcG9vbC0+cmVmX2Ns
b2Nrcy5kY2h1Yl9yZWZfY2xvY2tfaW5LaHopOworCQkJfSBlbHNlIHsKKwkJCQkvLyBOb3QgYWxs
IEFTSUNzIGhhdmUgRENDRyBzdyBjb21wb25lbnQKKwkJCQlyZXNfcG9vbC0+cmVmX2Nsb2Nrcy5k
Y2NnX3JlZl9jbG9ja19pbktoeiA9CisJCQkJCQlyZXNfcG9vbC0+cmVmX2Nsb2Nrcy54dGFsaW5f
Y2xvY2tfaW5LaHo7CisJCQkJcmVzX3Bvb2wtPnJlZl9jbG9ja3MuZGNodWJfcmVmX2Nsb2NrX2lu
S2h6ID0KKwkJCQkJCXJlc19wb29sLT5yZWZfY2xvY2tzLnh0YWxpbl9jbG9ja19pbktoejsKKwkJ
CX0KKwkJfQorCX0gZWxzZQorCQlBU1NFUlRfQ1JJVElDQUwoZmFsc2UpOwogCiAJZm9yIChpID0g
MDsgaSA8IGRjLT5saW5rX2NvdW50OyBpKyspIHsKIAkJLyogUG93ZXIgdXAgQU5EIHVwZGF0ZSBp
bXBsZW1lbnRhdGlvbiBhY2NvcmRpbmcgdG8gdGhlCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
