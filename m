Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD34C908D
	for <lists+amd-gfx@lfdr.de>; Wed,  2 Oct 2019 20:16:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B0BC6E975;
	Wed,  2 Oct 2019 18:16:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730088.outbound.protection.outlook.com [40.107.73.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 289F06E196
 for <amd-gfx@lists.freedesktop.org>; Wed,  2 Oct 2019 18:16:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MMW4CQcndDgOhUiLxXNKk2oB+JIZNIVMoQJEnfPOAAQHqhbv0TykJgWCTGxb9U+fuVUPLfFHML1ULX9QNgrDqdTGhDXM+cJrDPdR9vZDOYqBOVmlHX+jhxF/jaO+zT02u6+Ppll5b0R3jrurraom37upY2I4qSgfxlbglmwSTMF3aGZkaXkN9ZL7F+x+pvuZsLtKWG/dMtBuiJ8Un1Qhl6h5yzMB8n4a3lqSfDGw4ZnNZthBOGsi3PDe5ah9xofIVRlqQ8OGIp2abSvWsvsrnVvyXKCTpfxjiVPsKj82QSDUpvMu0kYWfw6ScGBn28Or2jf5Vatp1JiKtzvMRxROHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4jj2f0liXAVGqVok1Y21G3RPv6jtBE570RjwXJ5Vktk=;
 b=Tq3JMboVL2fH672C5W0x8nHTs9f7QMEJoxxRMXGBr4eHfxpmzpAkM6I9Pff2Z2B+T7gnPs6tX70ojeH+f9Oz5nmPIgWfa3QaIL1bAn5VTqMJfh5sW3GoVkkH+4UGI60k9x1xU5KHcG8sxVsTpLWjQSbD1UDmYy6og8gHwVLz8MFugbq5l/NH6xxpYDTsPau7gDl0WptW9dTckGV0/qNkbPyc6DIzaBYuTJnG5IjsegW0ZgTmZTQGbY5J3A6OYpNP8XgZ9rQwf2q8an1MZG9/ddzx83lY9WlIU4A5yW7+WRKfj6vBr8XBP0MBTS1TBv6IEqHyPcDyuaPP++2sCJSutg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0121.namprd12.prod.outlook.com (2603:10b6:0:51::17) by
 DM6PR12MB3452.namprd12.prod.outlook.com (2603:10b6:5:3b::27) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Wed, 2 Oct 2019 18:16:45 +0000
Received: from DM3NAM03FT053.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::207) by DM3PR12CA0121.outlook.office365.com
 (2603:10b6:0:51::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.20 via Frontend
 Transport; Wed, 2 Oct 2019 18:16:45 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT053.mail.protection.outlook.com (10.152.83.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Wed, 2 Oct 2019 18:16:45 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Wed, 2 Oct 2019
 13:16:44 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 24/38] drm/amd/display: fix code to control 48mhz refclk
Date: Wed, 2 Oct 2019 14:16:19 -0400
Message-ID: <20191002181633.22805-25-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191002181633.22805-1-Bhawanpreet.Lakha@amd.com>
References: <20191002181633.22805-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(346002)(136003)(39860400002)(428003)(189003)(199004)(11346002)(16586007)(7696005)(316002)(51416003)(5660300002)(47776003)(50226002)(305945005)(8936002)(478600001)(76176011)(48376002)(2906002)(4326008)(70206006)(70586007)(6666004)(6916009)(86362001)(356004)(486006)(36756003)(336012)(53416004)(50466002)(186003)(2616005)(81156014)(81166006)(446003)(26005)(426003)(8676002)(476003)(126002)(2351001)(1076003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3452; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a5b98115-e336-409d-7d57-08d74764aeee
X-MS-TrafficTypeDiagnostic: DM6PR12MB3452:
X-Microsoft-Antispam-PRVS: <DM6PR12MB34529007C97181DE9C63D6AEF99C0@DM6PR12MB3452.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-Forefront-PRVS: 0178184651
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YDkxHou3ZfjmIBpX1v6BbfxSNZdAP0+G2Y6qXHA23A4+eJwhWeZcFw44UY9XzijewwcAt4kYYAGoZPD5UUd/X44i5v88e3ezH5xVQjcGIblGxc6Q8BxpHjUBKwNMmLGgkzz3SGAvVPbNrq3aTTypCVowiQQZ35aqoIK7Zc6BD+581HRonqY+cexkjbE2ALdB0RVAfD4gzE7HzzrFwhY3rD9wdrh8L9ZhpEsPmj2i9TAvqYWKnatsy6Dl5kI8pjNvGW0b6SFqUaX/ayDH99Hfg0Wp4cAOC8Qa/sqSYk4/evLIhBLvM7U3FtWoVQB8cI4PfOO1YSt0s2mfRuMBexqrDY4A23FYxiTFv1OUIRU8EUVvs39K1FJzHQewopjzX5Talh6KZXbFMRRG7dCdPAonVt6/dscNEPvBOX4SAbWuX7o=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2019 18:16:45.2430 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5b98115-e336-409d-7d57-08d74764aeee
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3452
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4jj2f0liXAVGqVok1Y21G3RPv6jtBE570RjwXJ5Vktk=;
 b=L9OY6rwMeLbs/j2Fs/lGcAWqbP3C/FQB5Noup5WT4bd/4YvdQHk7WSWx9EFogwVAN4OnpM0zPZPZjFwKXDi9y3PCqtirXV1rjrGK4Ks2nM9mthyEEDsRaNIy5s6V0fMiWFNF2XelONslUf0ZOwAQbeTSdNtlvU0MSU4TqGdqw7Q=
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
Cc: Eric Yang <Eric.Yang2@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRXJpYyBZYW5nIDxFcmljLllhbmcyQGFtZC5jb20+CgpbV2h5XQpUaGUgU01VIG1lc3Nh
Z2UgdG8gZW5hYmxlIHRoaXMgZmVhdHVyZSBsb29rcyBhdCBhcmd1bWVudC4gUHJldmlvdXMgY29k
ZQpkaWRuJ3Qgc2VuZCByaWdodCBhcmd1bWVudC4gVGhpcyBjaGFuZ2Ugd2lsbCBhbGxvdyB0aGUg
ZmVhdHVyZSB0byBiZQpiZSBlbmFibGVkLgoKW0hvd10KRml4ZWQgb25lIGlzc3VlIHdoZXJlIFNN
VSBtZXNzYWdlIHRvIGVuYWJsZSB0aGUgZmVhdHVyZSB3YXMgc2VudCB3aXRob3V0CnNldHRpbmcg
dGhlIHBhcmFtZXRlci4KCkNoYW5nZS1JZDogSTk0YjliMDI5MmU1MzM4YTNjOGJhZWIzYTkzMzU2
YjQ2NDVlZjE3NTcKU2lnbmVkLW9mZi1ieTogRXJpYyBZYW5nIDxFcmljLllhbmcyQGFtZC5jb20+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Nsa19tZ3IvZGNuMjEvcm5fY2xr
X21nci5jICB8IDcgKysrKy0tLQogLi4uL2FtZC9kaXNwbGF5L2RjL2Nsa19tZ3IvZGNuMjEvcm5f
Y2xrX21ncl92Ymlvc19zbXUuYyAgICB8IDQgKystLQogLi4uL2FtZC9kaXNwbGF5L2RjL2Nsa19t
Z3IvZGNuMjEvcm5fY2xrX21ncl92Ymlvc19zbXUuaCAgICB8IDIgKy0KIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9kY24yMS9kY24yMV9yZXNvdXJjZS5jICAgICAgfCAyICstCiA0IGZp
bGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY2xrX21nci9kY24yMS9ybl9jbGtfbWdy
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY2xrX21nci9kY24yMS9ybl9jbGtf
bWdyLmMKaW5kZXggYzBlNTg0MzRiZTM5Li5hMmE0YzdkZGM4NTYgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jbGtfbWdyL2RjbjIxL3JuX2Nsa19tZ3IuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY2xrX21nci9kY24yMS9ybl9jbGtfbWdy
LmMKQEAgLTY0OSw4ICs2NDksOSBAQCB2b2lkIHJuX2Nsa19tZ3JfY29uc3RydWN0KAogCQkJcHBf
c211LT5ybl9mdW5jcy5zZXRfd21fcmFuZ2VzKCZwcF9zbXUtPnJuX2Z1bmNzLnBwX3NtdSwgJnJh
bmdlcyk7CiAJfQogCi0JLyogZW5hYmxlIHBvd2VyZmVhdHVyZXMgd2hlbiBkaXNwbGF5Y291bnQg
Z29lcyB0byAwICovCi0JaWYgKCFkZWJ1Zy0+ZGlzYWJsZV80OG1oel9wd3Jkd24pCi0JCXJuX3Zi
aW9zX3NtdV9lbmFibGVfNDhtaHpfdG1kcF9yZWZjbGtfcHdyZHduKGNsa19tZ3IpOworCWlmICgh
SVNfRlBHQV9NQVhJTVVTX0RDKGN0eC0+ZGNlX2Vudmlyb25tZW50KSkgeworCQkvKiBlbmFibGUg
cG93ZXJmZWF0dXJlcyB3aGVuIGRpc3BsYXljb3VudCBnb2VzIHRvIDAgKi8KKwkJcm5fdmJpb3Nf
c211X2VuYWJsZV80OG1oel90bWRwX3JlZmNsa19wd3Jkd24oY2xrX21nciwgIWRlYnVnLT5kaXNh
YmxlXzQ4bWh6X3B3cmR3bik7CisJfQogfQogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvY2xrX21nci9kY24yMS9ybl9jbGtfbWdyX3ZiaW9zX3NtdS5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Nsa19tZ3IvZGNuMjEvcm5fY2xrX21ncl92Ymlv
c19zbXUuYwppbmRleCBmZDkxOWI4MmU5MDIuLjhlODYwZjU2N2Q1YyAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Nsa19tZ3IvZGNuMjEvcm5fY2xrX21ncl92Ymlv
c19zbXUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY2xrX21nci9kY24y
MS9ybl9jbGtfbWdyX3ZiaW9zX3NtdS5jCkBAIC0xOTAsMTIgKzE5MCwxMiBAQCB2b2lkIHJuX3Zi
aW9zX3NtdV9zZXRfZGNuX2xvd19wb3dlcl9zdGF0ZShzdHJ1Y3QgY2xrX21ncl9pbnRlcm5hbCAq
Y2xrX21nciwgZW51bQogCQlkaXNwX2NvdW50KTsKIH0KIAotdm9pZCBybl92Ymlvc19zbXVfZW5h
YmxlXzQ4bWh6X3RtZHBfcmVmY2xrX3B3cmR3bihzdHJ1Y3QgY2xrX21ncl9pbnRlcm5hbCAqY2xr
X21ncikKK3ZvaWQgcm5fdmJpb3Nfc211X2VuYWJsZV80OG1oel90bWRwX3JlZmNsa19wd3Jkd24o
c3RydWN0IGNsa19tZ3JfaW50ZXJuYWwgKmNsa19tZ3IsIGJvb2wgZW5hYmxlKQogewogCXJuX3Zi
aW9zX3NtdV9zZW5kX21zZ193aXRoX3BhcmFtKAogCQkJY2xrX21nciwKIAkJCVZCSU9TU01DX01T
R19FbmFibGVUbWRwNDhNSHpSZWZjbGtQd3JEb3duLAotCQkJMCk7CisJCQllbmFibGUpOwogfQog
CiB2b2lkIHJuX3ZiaW9zX3NtdV9lbmFibGVfcG1lX3dhKHN0cnVjdCBjbGtfbWdyX2ludGVybmFs
ICpjbGtfbWdyKQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Ns
a19tZ3IvZGNuMjEvcm5fY2xrX21ncl92Ymlvc19zbXUuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9jbGtfbWdyL2RjbjIxL3JuX2Nsa19tZ3JfdmJpb3Nfc211LmgKaW5kZXggZmUy
OTg2YTJjN2EyLi5jY2MwMTg3OWM5ZDQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9jbGtfbWdyL2RjbjIxL3JuX2Nsa19tZ3JfdmJpb3Nfc211LmgKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Nsa19tZ3IvZGNuMjEvcm5fY2xrX21ncl92Ymlv
c19zbXUuaApAQCAtMzQsNyArMzQsNyBAQCBpbnQgcm5fdmJpb3Nfc211X3NldF9taW5fZGVlcF9z
bGVlcF9kY2ZjbGsoc3RydWN0IGNsa19tZ3JfaW50ZXJuYWwgKmNsa19tZ3IsIGludAogdm9pZCBy
bl92Ymlvc19zbXVfc2V0X3BoeWNsayhzdHJ1Y3QgY2xrX21ncl9pbnRlcm5hbCAqY2xrX21nciwg
aW50IHJlcXVlc3RlZF9waHljbGtfa2h6KTsKIGludCBybl92Ymlvc19zbXVfc2V0X2RwcGNsayhz
dHJ1Y3QgY2xrX21ncl9pbnRlcm5hbCAqY2xrX21nciwgaW50IHJlcXVlc3RlZF9kcHBfa2h6KTsK
IHZvaWQgcm5fdmJpb3Nfc211X3NldF9kY25fbG93X3Bvd2VyX3N0YXRlKHN0cnVjdCBjbGtfbWdy
X2ludGVybmFsICpjbGtfbWdyLCBpbnQgZGlzcGxheV9jb3VudCk7Ci12b2lkIHJuX3ZiaW9zX3Nt
dV9lbmFibGVfNDhtaHpfdG1kcF9yZWZjbGtfcHdyZHduKHN0cnVjdCBjbGtfbWdyX2ludGVybmFs
ICpjbGtfbWdyKTsKK3ZvaWQgcm5fdmJpb3Nfc211X2VuYWJsZV80OG1oel90bWRwX3JlZmNsa19w
d3Jkd24oc3RydWN0IGNsa19tZ3JfaW50ZXJuYWwgKmNsa19tZ3IsIGJvb2wgZW5hYmxlKTsKIHZv
aWQgcm5fdmJpb3Nfc211X2VuYWJsZV9wbWVfd2Eoc3RydWN0IGNsa19tZ3JfaW50ZXJuYWwgKmNs
a19tZ3IpOwogCiAjZW5kaWYgLyogREFMX0RDX0RDTjEwX1JWMV9DTEtfTUdSX1ZCSU9TX1NNVV9I
XyAqLwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIxL2Rj
bjIxX3Jlc291cmNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjEvZGNu
MjFfcmVzb3VyY2UuYwppbmRleCBkZTE4MjE4NWZlMWYuLmJlODY0YmZkNTc5NyAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIxL2RjbjIxX3Jlc291cmNlLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIxL2RjbjIxX3Jlc291cmNl
LmMKQEAgLTgwNCw3ICs4MDQsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRjX2RlYnVnX29wdGlv
bnMgZGVidWdfZGVmYXVsdHNfZHJ2ID0gewogCQkuZGlzYWJsZV9wcGxpYl93bV9yYW5nZSA9IGZh
bHNlLAogCQkuc2NsX3Jlc2V0X2xlbmd0aDEwID0gdHJ1ZSwKIAkJLnNhbml0eV9jaGVja3MgPSB0
cnVlLAotCQkuZGlzYWJsZV80OG1oel9wd3Jkd24gPSB0cnVlLAorCQkuZGlzYWJsZV80OG1oel9w
d3Jkd24gPSBmYWxzZSwKIH07CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZGNfZGVidWdfb3B0aW9u
cyBkZWJ1Z19kZWZhdWx0c19kaWFncyA9IHsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4
