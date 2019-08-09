Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30864870AA
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 06:28:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19B9E6E1B4;
	Fri,  9 Aug 2019 04:28:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780072.outbound.protection.outlook.com [40.107.78.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3237F6E1B4
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 04:28:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D7lN6J0C9nC/oUVjRhlZbOd65ZRIFEJOeL9l9vaCpEte6jpOhL4sNItOKOUhuucppfaS5TAWTEJEWNPe+/XRMSH41Ce2vISj4qoJz0+zioDx/DWXwpHkJ3o6TBE0oHEvWQZlG9Dqkg6imK1UhiCyvcPPcyq1RbiIELAy54BuTEmKKbUMwXK2hegBThu7kduJVwn1xaFoNqqAk8BedTTRuX6GjYj7w7s9FYK5IUjDKKynUPPZhGQP6mw3nkxwcQASLdHgAXZyy4KBhvI7cyrgD34azcB7Koy8A3GRoxU908VCovWAom5V/829mYuiBJ57w2zhCsRtwiux8VAOb3iVnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d5e0YX4PmhSxj0eUuEW+vIw+j2iiQgs10Wu/byTZWZ8=;
 b=Si8xADH8WezZtC4M1JkT4VT/p1KBCzY8A1YnfWUgXt2mFzL2MvWT7x3unKL8EmHGTC9ro8fwvqRPw/vWVqHHQfwqwevwN+Nt9hPpcgwo/QHPz1H5nncoSN6UNz8vuRSpYyPZq8Sw8L7zDVcOMMR3Q80EtqePZQ9GnReRGYoxwXCET/aasHgKA5PoyiJ0TsdNWQM2xNhYh4B4D389bKJGWgtfuLApsCGutsBUEuk6STIwaQj6Oc2+gXqdTlhzY3vGUBNPz0ijutTOwGdezO6nVWebenfNxH0MoVtBfqgdRH8QSTYxTQ2OZH7dv4VwUMFIZjW2zhHd5Xe0I9O3csjj7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from BN8PR12CA0035.namprd12.prod.outlook.com (2603:10b6:408:60::48)
 by MWHPR12MB1279.namprd12.prod.outlook.com (2603:10b6:300:d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.14; Fri, 9 Aug
 2019 04:28:08 +0000
Received: from BY2NAM03FT025.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::208) by BN8PR12CA0035.outlook.office365.com
 (2603:10b6:408:60::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2157.14 via Frontend
 Transport; Fri, 9 Aug 2019 04:28:08 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT025.mail.protection.outlook.com (10.152.84.232) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2157.15 via Frontend Transport; Fri, 9 Aug 2019 04:28:08 +0000
Received: from taozhou1u2.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 8 Aug 2019
 23:28:06 -0500
From: Tao Zhou <tao.zhou1@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <alexander.deucher@amd.com>,
 <hawking.zhang@amd.com>, <christian.koenig@amd.com>
Subject: [PATCH 1/2] drm/amdgpu: implement UMC 64 bits REG operations
Date: Fri, 9 Aug 2019 12:27:30 +0800
Message-ID: <20190809042731.30491-1-tao.zhou1@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(376002)(39860400002)(396003)(2980300002)(428003)(199004)(189003)(336012)(16586007)(8676002)(81156014)(316002)(53416004)(50466002)(126002)(305945005)(8936002)(53936002)(4326008)(2906002)(476003)(486006)(5660300002)(47776003)(14444005)(48376002)(26005)(110136005)(86362001)(36756003)(186003)(426003)(81166006)(1076003)(6636002)(51416003)(6666004)(2201001)(2616005)(7696005)(70206006)(356004)(478600001)(70586007)(50226002)(2101003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1279; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ff12b66-90d0-4596-4033-08d71c81fafe
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MWHPR12MB1279; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1279:
X-Microsoft-Antispam-PRVS: <MWHPR12MB127919B9CF03CAE7013933C5B0D60@MWHPR12MB1279.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1284;
X-Forefront-PRVS: 01244308DF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 4Lt9VhmbhJlQnpn1Q61dR7FBa0PbxdVJsxNSiZCUwYr1nIENAfsFJaNk0kNCtRC8OgfGAi38g5uSN9Kk57M63+rihZqMq/wjtuuNXEYair4T0m/UTu11jn1EZxmFbNujgbHS3IMrwtg6bdt1NaZN9wGSoPc+5IDK6iGaUB8KQ69PPszxlJUzXfmCsZ+hC5097O1kaXHbYl9OuvQmM+ecO6VRoWuTDw3SyyN+pt7PwDNJExTvONd+QyTzCFwqaB9ftxd42B9UEbU8ewVeq20YHjs1+QAVwgenfFMh2umub6v4Wr+zhzSzC+6tENFLFaNFt7IzllkXn31PgwB5rAjmchfVnE4c27vrAId/MC9eXwvSq2iTAhYCZoXQWMuA+GWkWFcWweo7vSPmy1If74jH2m1xmdGmuu+O6S7VdMTS9Ew=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2019 04:28:08.1868 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ff12b66-90d0-4596-4033-08d71c81fafe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1279
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d5e0YX4PmhSxj0eUuEW+vIw+j2iiQgs10Wu/byTZWZ8=;
 b=FRUs+kVr5JkmwiDuLOzLSmWPSNQbVCcV6B9aLJwPkND0ysNieo4633uvA+m0HF7Pughzo59tLaN49+xk8wpkVNsTUP23kYJcg3VTsH8UGPO2/7nDxwHtAhl78i4RxWxlDN5Oh0oFYouCzgEw3PjpuRDTMfCf9tBmBmUfd4lQt2E=
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
Cc: Tao Zhou <tao.zhou1@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

aW1wbGVtZW50IDY0IGJpdHMgb3BlcmF0aW9ucyB2aWEgMzIgYml0cyBpbnRlcmZhY2UKClNpZ25l
ZC1vZmYtYnk6IFRhbyBaaG91IDx0YW8uemhvdTFAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfdW1jLmggfCAgOSArKysrKysrKysKIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L3VtY192Nl8xLmMgICB8IDEwICsrKysrLS0tLS0KIDIgZmlsZXMgY2hhbmdl
ZCwgMTQgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdW1jLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfdW1jLmgKaW5kZXggOWVmZGQ2NjI3OWU1Li5hNjE3ZGNjOWQyNTcgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV91bWMuaAorKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdW1jLmgKQEAgLTIxLDYgKzIxLDE1IEBACiAj
aWZuZGVmIF9fQU1ER1BVX1VNQ19IX18KICNkZWZpbmUgX19BTURHUFVfVU1DX0hfXwogCisvKiBp
bXBsZW1lbnQgNjQgYml0cyBSRUcgb3BlcmF0aW9ucyB2aWEgMzIgYml0cyBpbnRlcmZhY2UgKi8K
KyNkZWZpbmUgUlJFRzY0X1VNQyhyZWcpCShSUkVHMzIocmVnKSB8IFwKKwkJCQkoKHVpbnQ2NF90
KVJSRUczMigocmVnKSArIDEpIDw8IDMyKSkKKyNkZWZpbmUgV1JFRzY0X1VNQyhyZWcsIHYpCVwK
KwlkbyB7CVwKKwkJV1JFRzMyKChyZWcpLCAodWludDMyX3QpKCh2KSAmIDB4ZmZmZmZmZmYpKTsJ
XAorCQlXUkVHMzIoKHJlZykgKyAxLCAodWludDMyX3QpKCh2KSA+PiAzMikpOwlcCisJfSB3aGls
ZSAoMCkKKwogLyoKICAqIHZvaWQgKCpmdW5jKShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwg
c3RydWN0IHJhc19lcnJfZGF0YSAqZXJyX2RhdGEsCiAgKgkJCQl1aW50MzJfdCB1bWNfcmVnX29m
ZnNldCwgdWludDMyX3QgY2hhbm5lbF9pbmRleCkKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L3VtY192Nl8xLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91bWNf
djZfMS5jCmluZGV4IDY0ZGYzN2I4NjBkZC4uODUwMmU3MzZmNzIxIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91bWNfdjZfMS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L3VtY192Nl8xLmMKQEAgLTExNiw3ICsxMTYsNyBAQCBzdGF0aWMgdm9pZCB1bWNf
djZfMV9xdWVyeV9jb3JyZWN0YWJsZV9lcnJvcl9jb3VudChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldiwKIAogCS8qIGNoZWNrIGZvciBTUkFNIGNvcnJlY3RhYmxlIGVycm9yCiAJICBNQ1VNQ19T
VEFUVVMgaXMgYSA2NCBiaXQgcmVnaXN0ZXIgKi8KLQltY191bWNfc3RhdHVzID0gUlJFRzY0KG1j
X3VtY19zdGF0dXNfYWRkciArIHVtY19yZWdfb2Zmc2V0KTsKKwltY191bWNfc3RhdHVzID0gUlJF
RzY0X1VNQyhtY191bWNfc3RhdHVzX2FkZHIgKyB1bWNfcmVnX29mZnNldCk7CiAJaWYgKFJFR19H
RVRfRklFTEQobWNfdW1jX3N0YXR1cywgTUNBX1VNQ19VTUMwX01DVU1DX1NUQVRVU1QwLCBFcnJv
ckNvZGVFeHQpID09IDYgJiYKIAkgICAgUkVHX0dFVF9GSUVMRChtY191bWNfc3RhdHVzLCBNQ0Ff
VU1DX1VNQzBfTUNVTUNfU1RBVFVTVDAsIFZhbCkgPT0gMSAmJgogCSAgICBSRUdfR0VUX0ZJRUxE
KG1jX3VtY19zdGF0dXMsIE1DQV9VTUNfVU1DMF9NQ1VNQ19TVEFUVVNUMCwgQ0VDQykgPT0gMSkK
QEAgLTEzNCw3ICsxMzQsNyBAQCBzdGF0aWMgdm9pZCB1bWNfdjZfMV9xdWVycnlfdW5jb3JyZWN0
YWJsZV9lcnJvcl9jb3VudChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldgogICAgICAgICAgICAg
ICAgIFNPQzE1X1JFR19PRkZTRVQoVU1DLCAwLCBtbU1DQV9VTUNfVU1DMF9NQ1VNQ19TVEFUVVNU
MCk7CiAKIAkvKiBjaGVjayB0aGUgTUNVTUNfU1RBVFVTICovCi0JbWNfdW1jX3N0YXR1cyA9IFJS
RUc2NChtY191bWNfc3RhdHVzX2FkZHIgKyB1bWNfcmVnX29mZnNldCk7CisJbWNfdW1jX3N0YXR1
cyA9IFJSRUc2NF9VTUMobWNfdW1jX3N0YXR1c19hZGRyICsgdW1jX3JlZ19vZmZzZXQpOwogCWlm
ICgoUkVHX0dFVF9GSUVMRChtY191bWNfc3RhdHVzLCBNQ0FfVU1DX1VNQzBfTUNVTUNfU1RBVFVT
VDAsIFZhbCkgPT0gMSkgJiYKIAkgICAgKFJFR19HRVRfRklFTEQobWNfdW1jX3N0YXR1cywgTUNB
X1VNQ19VTUMwX01DVU1DX1NUQVRVU1QwLCBEZWZlcnJlZCkgPT0gMSB8fAogCSAgICBSRUdfR0VU
X0ZJRUxEKG1jX3VtY19zdGF0dXMsIE1DQV9VTUNfVU1DMF9NQ1VNQ19TVEFUVVNUMCwgVUVDQykg
PT0gMSB8fApAQCAtMTczLDExICsxNzMsMTEgQEAgc3RhdGljIHZvaWQgdW1jX3Y2XzFfcXVlcnlf
ZXJyb3JfYWRkcmVzcyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAkvKiBza2lwIGVycm9y
IGFkZHJlc3MgcHJvY2VzcyBpZiAtRU5PTUVNICovCiAJaWYgKCFlcnJfZGF0YS0+ZXJyX2FkZHIp
IHsKIAkJLyogY2xlYXIgdW1jIHN0YXR1cyAqLwotCQlXUkVHNjQobWNfdW1jX3N0YXR1c19hZGRy
ICsgdW1jX3JlZ19vZmZzZXQsIDB4MFVMTCk7CisJCVdSRUc2NF9VTUMobWNfdW1jX3N0YXR1c19h
ZGRyICsgdW1jX3JlZ19vZmZzZXQsIDB4MFVMTCk7CiAJCXJldHVybjsKIAl9CiAKLQltY191bWNf
c3RhdHVzID0gUlJFRzY0KG1jX3VtY19zdGF0dXNfYWRkciArIHVtY19yZWdfb2Zmc2V0KTsKKwlt
Y191bWNfc3RhdHVzID0gUlJFRzY0X1VNQyhtY191bWNfc3RhdHVzX2FkZHIgKyB1bWNfcmVnX29m
ZnNldCk7CiAKIAkvKiBjYWxjdWxhdGUgZXJyb3IgYWRkcmVzcyBpZiB1ZS9jZSBlcnJvciBpcyBk
ZXRlY3RlZCAqLwogCWlmIChSRUdfR0VUX0ZJRUxEKG1jX3VtY19zdGF0dXMsIE1DQV9VTUNfVU1D
MF9NQ1VNQ19TVEFUVVNUMCwgVmFsKSA9PSAxICYmCkBAIC0yMDAsNyArMjAwLDcgQEAgc3RhdGlj
IHZvaWQgdW1jX3Y2XzFfcXVlcnlfZXJyb3JfYWRkcmVzcyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldiwKIAl9CiAKIAkvKiBjbGVhciB1bWMgc3RhdHVzICovCi0JV1JFRzY0KG1jX3VtY19zdGF0
dXNfYWRkciArIHVtY19yZWdfb2Zmc2V0LCAweDBVTEwpOworCVdSRUc2NF9VTUMobWNfdW1jX3N0
YXR1c19hZGRyICsgdW1jX3JlZ19vZmZzZXQsIDB4MFVMTCk7CiB9CiAKIHN0YXRpYyB2b2lkIHVt
Y192Nl8xX3F1ZXJ5X3Jhc19lcnJvcl9hZGRyZXNzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
LAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
