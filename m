Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E4F7D5AA
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 08:44:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98B086E386;
	Thu,  1 Aug 2019 06:44:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740079.outbound.protection.outlook.com [40.107.74.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98D3E6E386
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 06:44:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D2o4nzoaaALkrWeDm49jPxO8qVmwEE5E7IfyjO/NoIGIGGRU/hNfXwZ4+/oL5wUEIhZj+GWz2iSNIWR29gduYRyfj9OCTuEkuefBto7qiPSCQ60XQWUaTfnZhu9Qw9G0UjWIMDlLchdHtV9ZhW1m2onkbhkHeg5qruZ5ehtiEwpsAds7fJ5h8yIJW9cj0osQ0RbuHQDToNT912YXUbtVKNlj9qh6sqVckYNx+hHiwhXdCej9U6ZgW7RuNN8HlGyzXwZcN0YQ+YoHHuVlgIX3jAdvNYRVti8/2gk9bau6VWDnLhzkRLTlW5qB5vE9KEcHC/sydzgFmmL2A9ghTfDyeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WCi1kWOM3z3I4R7EgafWJuTS51gHKipCbDYusvUzBP0=;
 b=i8ajpSp52p+pn+t+sT+DozEA7eM8UC9EbL3Nrp4E1r2PtB/P8UWHJjO2GwRSRahxBsuhu9vHfNBhS0EvL8y401GBFJurPBT/rHHM0zVaHke2w8jGyJIQQGNafIIy17xWls4x+s+/Qdprt4zfVNg0fSUsV5HdbDP6sEQmURrranlG39s7JOpxo+pFIx0ZX3efQwOso2yLbs5uhBMXkAGSGm4dLcEj9LeYvDXkMm6XGzGTWYXggAamG4TfjF17gpnWIU7Rgjbd9tC7Lcg6BmBJB6x6djeFuwgQNf4OFVcQ7ksqe+a6eaTjWjY9u8ZQ2+flIuZspNL4dSMkJ3eF8DBRcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from CY4PR12CA0034.namprd12.prod.outlook.com (2603:10b6:903:129::20)
 by MW2PR12MB2427.namprd12.prod.outlook.com (2603:10b6:907:8::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.13; Thu, 1 Aug
 2019 06:44:33 +0000
Received: from DM3NAM03FT028.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::202) by CY4PR12CA0034.outlook.office365.com
 (2603:10b6:903:129::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.14 via Frontend
 Transport; Thu, 1 Aug 2019 06:44:33 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT028.mail.protection.outlook.com (10.152.82.196) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2136.14 via Frontend Transport; Thu, 1 Aug 2019 06:44:33 +0000
Received: from taozhou1u2.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Thu, 1 Aug 2019
 01:44:31 -0500
From: Tao Zhou <tao.zhou1@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <hawking.zhang@amd.com>,
 <dennis.li@amd.com>, <guchun.chen@amd.com>, <xinhui.pan@amd.com>
Subject: [PATCH 5/6] drm/amdgpu: apply umc_for_each_channel macro to umc_6_1
Date: Thu, 1 Aug 2019 14:43:10 +0800
Message-ID: <20190801064311.7307-6-tao.zhou1@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190801064311.7307-1-tao.zhou1@amd.com>
References: <20190801064311.7307-1-tao.zhou1@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(39860400002)(396003)(136003)(2980300002)(428003)(189003)(199004)(70586007)(70206006)(76176011)(51416003)(7696005)(47776003)(2906002)(6636002)(5660300002)(478600001)(16586007)(110136005)(4326008)(36756003)(86362001)(316002)(50466002)(356004)(6666004)(11346002)(446003)(68736007)(2616005)(476003)(486006)(1076003)(426003)(2201001)(126002)(53416004)(336012)(8936002)(8676002)(50226002)(81156014)(81166006)(186003)(53936002)(48376002)(26005)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MW2PR12MB2427; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7e3c1779-f4fb-4673-9213-08d7164bb62e
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MW2PR12MB2427; 
X-MS-TrafficTypeDiagnostic: MW2PR12MB2427:
X-Microsoft-Antispam-PRVS: <MW2PR12MB24273B987EF1770DCEA2CC7DB0DE0@MW2PR12MB2427.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-Forefront-PRVS: 01165471DB
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: V9MNX9f+kFY0ts+JhPmN5Q7p5jPmHQz/hkJkF8WMKCe7gYwfi8W+dAqgRJ61lQfVHwHvZg2W+duqNDCxcig0EYUnSguOpIzhGabnU3m6wlYlVslaK9AEJEKUAOvkKZypCr7sePfXJyrsymaezzFGjr5papVQnBO0inLB0SySJfbHiGygmsJjUHe+l2n4Y6imj/loPmE2z1ohAxgtYhtbGR0HAMGbvLQfuEdJoVmpAkUU6Z7yB4Fr8CZ7hmL61drOjezDomtMpAHLKah3XsDOT63eZY1hq51CApSB2nErGVUhMWkyGTtPWhJrRHe0U3Wn3TSmEuSDh67n5st/5yvxEJ06l7li1EM8gQ0qOwB/H6VH8T5KphqfCcrHxtactk48e8PIuwfwnxlA4ilR2PVdvWCetZPGxhfDFG7fPAKe0VY=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2019 06:44:33.0047 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e3c1779-f4fb-4673-9213-08d7164bb62e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2427
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WCi1kWOM3z3I4R7EgafWJuTS51gHKipCbDYusvUzBP0=;
 b=LYhuDgTDZ1vEBPJGUCxwX5v6PUv1u+Zw6/ITlpojHyNrrXjiqx2IMDZL8MAEyYZorGT1xt44lyg8CpNBm1HAGEiEAz+2koWPw/FqZQskbNPdSN+BGaopm6XLW7a2pp5cbYVGatZvrg3s2oDF4ElvP6nfHBnu5uT32Q6MMlz/VTQ=
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

dXNlIHVtY19mb3JfZWFjaF9jaGFubmVsIHRvIG1ha2UgY29kZSBzaW1wbGVyCgpTaWduZWQtb2Zm
LWJ5OiBUYW8gWmhvdSA8dGFvLnpob3UxQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvdW1jX3Y2XzEuYyB8IDg0ICsrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDI4IGluc2VydGlvbnMoKyksIDU2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3VtY192Nl8xLmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS91bWNfdjZfMS5jCmluZGV4IDliYTAxNWQ3ZWI1Ny4uNTc0N2EwMjUyNjI0
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91bWNfdjZfMS5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3VtY192Nl8xLmMKQEAgLTE0Miw0NiArMTQyLDM5
IEBAIHN0YXRpYyB2b2lkIHVtY192Nl8xX3F1ZXJyeV91bmNvcnJlY3RhYmxlX2Vycm9yX2NvdW50
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2CiAJCSplcnJvcl9jb3VudCArPSAxOwogfQogCitz
dGF0aWMgdm9pZCB1bWNfdjZfMV9xdWVyeV9lcnJvcl9jb3VudChzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldiwKKwkJCQkJICAgc3RydWN0IHJhc19lcnJfZGF0YSAqZXJyX2RhdGEsIHVpbnQzMl90
IHVtY19yZWdfb2Zmc2V0LAorCQkJCQkgICB1aW50MzJfdCBjaGFubmVsX2luZGV4KQoreworCXVt
Y192Nl8xX3F1ZXJ5X2NvcnJlY3RhYmxlX2Vycm9yX2NvdW50KGFkZXYsIHVtY19yZWdfb2Zmc2V0
LAorCQkJCQkJICAgJihlcnJfZGF0YS0+Y2VfY291bnQpKTsKKwl1bWNfdjZfMV9xdWVycnlfdW5j
b3JyZWN0YWJsZV9lcnJvcl9jb3VudChhZGV2LCB1bWNfcmVnX29mZnNldCwKKwkJCQkJCSAgJihl
cnJfZGF0YS0+dWVfY291bnQpKTsKK30KKwogc3RhdGljIHZvaWQgdW1jX3Y2XzFfcXVlcnlfcmFz
X2Vycm9yX2NvdW50KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCQkJCQkgICB2b2lkICpy
YXNfZXJyb3Jfc3RhdHVzKQogewotCXN0cnVjdCByYXNfZXJyX2RhdGEgKmVycl9kYXRhID0gKHN0
cnVjdCByYXNfZXJyX2RhdGEgKilyYXNfZXJyb3Jfc3RhdHVzOwotCXVpbnQzMl90IHVtY19pbnN0
LCBjaGFubmVsX2luc3QsIHVtY19yZWdfb2Zmc2V0LCBtY191bWNfc3RhdHVzX2FkZHI7Ci0KLQlt
Y191bWNfc3RhdHVzX2FkZHIgPQotCQlTT0MxNV9SRUdfT0ZGU0VUKFVNQywgMCwgbW1NQ0FfVU1D
X1VNQzBfTUNVTUNfU1RBVFVTVDApOwotCi0JZm9yICh1bWNfaW5zdCA9IDA7IHVtY19pbnN0IDwg
VU1DX1Y2XzFfVU1DX0lOU1RBTkNFX05VTTsgdW1jX2luc3QrKykgewotCQkvKiBlbmFibGUgdGhl
IGluZGV4IG1vZGUgdG8gcXVlcnkgZXJvciBjb3VudCBwZXIgY2hhbm5lbCAqLwotCQl1bWNfdjZf
MV9lbmFibGVfdW1jX2luZGV4X21vZGUoYWRldiwgdW1jX2luc3QpOwotCQlmb3IgKGNoYW5uZWxf
aW5zdCA9IDA7IGNoYW5uZWxfaW5zdCA8IFVNQ19WNl8xX0NIQU5ORUxfSU5TVEFOQ0VfTlVNOyBj
aGFubmVsX2luc3QrKykgewotCQkJLyogY2FsYyB0aGUgcmVnaXN0ZXIgb2Zmc2V0IGFjY29yZGlu
ZyB0byBjaGFubmVsIGluc3RhbmNlICovCi0JCQl1bWNfcmVnX29mZnNldCA9IFVNQ19WNl8xX1BF
Ul9DSEFOTkVMX09GRlNFVCAqIGNoYW5uZWxfaW5zdDsKLQkJCXVtY192Nl8xX3F1ZXJ5X2NvcnJl
Y3RhYmxlX2Vycm9yX2NvdW50KGFkZXYsIHVtY19yZWdfb2Zmc2V0LAotCQkJCQkJCSAgICAgICAm
KGVycl9kYXRhLT5jZV9jb3VudCkpOwotCQkJdW1jX3Y2XzFfcXVlcnJ5X3VuY29ycmVjdGFibGVf
ZXJyb3JfY291bnQoYWRldiwgdW1jX3JlZ19vZmZzZXQsCi0JCQkJCQkJCSAgJihlcnJfZGF0YS0+
dWVfY291bnQpKTsKLQkJCS8qIGNsZWFyIHVtYyBzdGF0dXMgKi8KLQkJCVdSRUc2NChtY191bWNf
c3RhdHVzX2FkZHIgKyB1bWNfcmVnX29mZnNldCwgMHgwVUxMKTsKLQkJfQotCX0KLQl1bWNfdjZf
MV9kaXNhYmxlX3VtY19pbmRleF9tb2RlKGFkZXYpOworCWFtZGdwdV91bWNfZm9yX2VhY2hfY2hh
bm5lbCh1bWNfdjZfMV9xdWVyeV9lcnJvcl9jb3VudCk7CiB9CiAKIHN0YXRpYyB2b2lkIHVtY192
Nl8xX3F1ZXJ5X2Vycm9yX2FkZHJlc3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCi0JCQkJ
CSB1aW50MzJfdCB1bWNfcmVnX29mZnNldCwgdWludDMyX3QgY2hhbm5lbF9pbmRleCwKLQkJCQkJ
IHN0cnVjdCByYXNfZXJyX2RhdGEgKmVycl9kYXRhKQorCQkJCQkgc3RydWN0IHJhc19lcnJfZGF0
YSAqZXJyX2RhdGEsCisJCQkJCSB1aW50MzJfdCB1bWNfcmVnX29mZnNldCwgdWludDMyX3QgY2hh
bm5lbF9pbmRleCkKIHsKLQl1aW50MzJfdCBsc2I7CisJdWludDMyX3QgbHNiLCBtY191bWNfc3Rh
dHVzX2FkZHI7CiAJdWludDY0X3QgbWNfdW1jX3N0YXR1cywgZXJyX2FkZHI7Ci0JdWludDMyX3Qg
bWNfdW1jX3N0YXR1c19hZGRyOworCisJbWNfdW1jX3N0YXR1c19hZGRyID0KKwkJU09DMTVfUkVH
X09GRlNFVChVTUMsIDAsIG1tTUNBX1VNQ19VTUMwX01DVU1DX1NUQVRVU1QwKTsKIAogCS8qIHNr
aXAgZXJyb3IgYWRkcmVzcyBwcm9jZXNzIGlmIC1FTk9NRU0gKi8KLQlpZiAoIWVycl9kYXRhLT5l
cnJfYWRkcikKKwlpZiAoIWVycl9kYXRhLT5lcnJfYWRkcikgeworCQkvKiBjbGVhciB1bWMgc3Rh
dHVzICovCisJCVdSRUc2NChtY191bWNfc3RhdHVzX2FkZHIgKyB1bWNfcmVnX29mZnNldCwgMHgw
VUxMKTsKIAkJcmV0dXJuOworCX0KIAotCW1jX3VtY19zdGF0dXNfYWRkciA9Ci0JCVNPQzE1X1JF
R19PRkZTRVQoVU1DLCAwLCBtbU1DQV9VTUNfVU1DMF9NQ1VNQ19TVEFUVVNUMCk7CiAJbWNfdW1j
X3N0YXR1cyA9IFJSRUc2NChtY191bWNfc3RhdHVzX2FkZHIgKyB1bWNfcmVnX29mZnNldCk7CiAK
IAkvKiBjYWxjdWxhdGUgZXJyb3IgYWRkcmVzcyBpZiB1ZS9jZSBlcnJvciBpcyBkZXRlY3RlZCAq
LwpAQCAtMTk3LDQyICsxOTAsMjEgQEAgc3RhdGljIHZvaWQgdW1jX3Y2XzFfcXVlcnlfZXJyb3Jf
YWRkcmVzcyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAogCQkvKiB0cmFuc2xhdGUgdW1j
IGNoYW5uZWwgYWRkcmVzcyB0byBzb2MgcGEsIDMgcGFydHMgYXJlIGluY2x1ZGVkICovCiAJCWVy
cl9kYXRhLT5lcnJfYWRkcltlcnJfZGF0YS0+ZXJyX2FkZHJfY250XSA9Ci0JCQkJCQlBRERSX09G
XzhLQl9CTE9DSyhlcnJfYWRkcikKLQkJCQkJCXwgQUREUl9PRl8yNTZCX0JMT0NLKGNoYW5uZWxf
aW5kZXgpCi0JCQkJCQl8IE9GRlNFVF9JTl8yNTZCX0JMT0NLKGVycl9hZGRyKTsKKwkJCQkJCUFE
RFJfT0ZfOEtCX0JMT0NLKGVycl9hZGRyKSB8CisJCQkJCQlBRERSX09GXzI1NkJfQkxPQ0soY2hh
bm5lbF9pbmRleCkgfAorCQkJCQkJT0ZGU0VUX0lOXzI1NkJfQkxPQ0soZXJyX2FkZHIpOwogCiAJ
CWVycl9kYXRhLT5lcnJfYWRkcl9jbnQrKzsKIAl9CisKKwkvKiBjbGVhciB1bWMgc3RhdHVzICov
CisJV1JFRzY0KG1jX3VtY19zdGF0dXNfYWRkciArIHVtY19yZWdfb2Zmc2V0LCAweDBVTEwpOwog
fQogCiBzdGF0aWMgdm9pZCB1bWNfdjZfMV9xdWVyeV9yYXNfZXJyb3JfYWRkcmVzcyhzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldiwKIAkJCQkJICAgICB2b2lkICpyYXNfZXJyb3Jfc3RhdHVzKQog
ewotCXN0cnVjdCByYXNfZXJyX2RhdGEgKmVycl9kYXRhID0gKHN0cnVjdCByYXNfZXJyX2RhdGEg
KilyYXNfZXJyb3Jfc3RhdHVzOwotCXVpbnQzMl90IHVtY19pbnN0LCBjaGFubmVsX2luc3QsIHVt
Y19yZWdfb2Zmc2V0OwotCXVpbnQzMl90IGNoYW5uZWxfaW5kZXgsIG1jX3VtY19zdGF0dXNfYWRk
cjsKLQotCW1jX3VtY19zdGF0dXNfYWRkciA9Ci0JCVNPQzE1X1JFR19PRkZTRVQoVU1DLCAwLCBt
bU1DQV9VTUNfVU1DMF9NQ1VNQ19TVEFUVVNUMCk7Ci0KLQlmb3IgKHVtY19pbnN0ID0gMDsgdW1j
X2luc3QgPCBVTUNfVjZfMV9VTUNfSU5TVEFOQ0VfTlVNOyB1bWNfaW5zdCsrKSB7Ci0JCS8qIGVu
YWJsZSB0aGUgaW5kZXggbW9kZSB0byBxdWVyeSBlcm9yIGNvdW50IHBlciBjaGFubmVsICovCi0J
CXVtY192Nl8xX2VuYWJsZV91bWNfaW5kZXhfbW9kZShhZGV2LCB1bWNfaW5zdCk7Ci0JCWZvciAo
Y2hhbm5lbF9pbnN0ID0gMDsgY2hhbm5lbF9pbnN0IDwgVU1DX1Y2XzFfQ0hBTk5FTF9JTlNUQU5D
RV9OVU07IGNoYW5uZWxfaW5zdCsrKSB7Ci0JCQkvKiBjYWxjIHRoZSByZWdpc3RlciBvZmZzZXQg
YWNjb3JkaW5nIHRvIGNoYW5uZWwgaW5zdGFuY2UgKi8KLQkJCXVtY19yZWdfb2Zmc2V0ID0gVU1D
X1Y2XzFfUEVSX0NIQU5ORUxfT0ZGU0VUICogY2hhbm5lbF9pbnN0OwotCQkJLyogZ2V0IGNoYW5u
ZWwgaW5kZXggb2YgaW50ZXJsZWF2ZWQgbWVtb3J5ICovCi0JCQljaGFubmVsX2luZGV4ID0gdW1j
X3Y2XzFfY2hhbm5lbF9pZHhfdGJsW3VtY19pbnN0XVtjaGFubmVsX2luc3RdOwotCi0JCQl1bWNf
djZfMV9xdWVyeV9lcnJvcl9hZGRyZXNzKGFkZXYsIHVtY19yZWdfb2Zmc2V0LAotCQkJCQkJICAg
ICBjaGFubmVsX2luZGV4LCBlcnJfZGF0YSk7Ci0KLQkJCS8qIGNsZWFyIHVtYyBzdGF0dXMgKi8K
LQkJCVdSRUc2NChtY191bWNfc3RhdHVzX2FkZHIgKyB1bWNfcmVnX29mZnNldCwgMHgwVUxMKTsK
LQkJfQotCX0KLQotCXVtY192Nl8xX2Rpc2FibGVfdW1jX2luZGV4X21vZGUoYWRldik7CisJYW1k
Z3B1X3VtY19mb3JfZWFjaF9jaGFubmVsKHVtY192Nl8xX3F1ZXJ5X2Vycm9yX2FkZHJlc3MpOwog
fQogCiBzdGF0aWMgdm9pZCB1bWNfdjZfMV9yYXNfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldikKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
