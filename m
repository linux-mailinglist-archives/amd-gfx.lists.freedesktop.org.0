Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FDB1A239
	for <lists+amd-gfx@lfdr.de>; Fri, 10 May 2019 19:20:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D787889C6B;
	Fri, 10 May 2019 17:20:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780059.outbound.protection.outlook.com [40.107.78.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13C5489994
 for <amd-gfx@lists.freedesktop.org>; Fri, 10 May 2019 17:20:30 +0000 (UTC)
Received: from DM3PR12CA0062.namprd12.prod.outlook.com (2603:10b6:0:56::30) by
 DM5PR12MB1275.namprd12.prod.outlook.com (2603:10b6:3:75::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.11; Fri, 10 May 2019 17:20:28 +0000
Received: from CO1NAM03FT005.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::201) by DM3PR12CA0062.outlook.office365.com
 (2603:10b6:0:56::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1878.21 via Frontend
 Transport; Fri, 10 May 2019 17:20:28 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT005.mail.protection.outlook.com (10.152.80.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Fri, 10 May 2019 17:20:28 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Fri, 10 May 2019
 12:20:16 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 14/16] drm/amd/display: dont set  otg offset
Date: Fri, 10 May 2019 13:19:33 -0400
Message-ID: <20190510171935.19792-15-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190510171935.19792-1-Bhawanpreet.Lakha@amd.com>
References: <20190510171935.19792-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(346002)(376002)(396003)(39860400002)(136003)(2980300002)(428003)(189003)(199004)(486006)(2616005)(77096007)(126002)(336012)(8936002)(86362001)(70206006)(476003)(68736007)(53416004)(81166006)(81156014)(7696005)(51416003)(478600001)(11346002)(76176011)(70586007)(446003)(2351001)(1076003)(186003)(50466002)(50226002)(14444005)(2906002)(5660300002)(47776003)(48376002)(426003)(36756003)(6666004)(8676002)(316002)(72206003)(305945005)(6916009)(4326008)(53936002)(16586007)(356004)(26005)(192303002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1275; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e01bceed-aedd-441f-3b75-08d6d56bcc46
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:DM5PR12MB1275; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1275:
X-Microsoft-Antispam-PRVS: <DM5PR12MB12752FF02192E1EDB4A7B20BF90C0@DM5PR12MB1275.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:345;
X-Forefront-PRVS: 0033AAD26D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: BuNVQVmLAauVU3vOLsK0ap4YgLXQWnhu0a13shrIv0AEAB76aT6zNf0IOBWVXZKpJ2XYE0gHUUL1DuskVWJCkANqTb+iTBu6O9WvMQKIRGSCagP3HZrT+dPWvZiBJmfvlWH41LP153eT5eir5yUanB9obJyoo6KlMHQenUkGGAEbTduBTkalj4B8rZnPwFMpmT/Vx+m7+Fk+s84LyqTW1fyhtxFbWLO/5q4ZLrv00b7GI5Zk3F57bUfTkfmVqRaZFJIhafPIfIczHtWUNBCPNx67nEJO40elt+jRkwPu0cufQLBgyZl4S0qztmH5nTAIUz1J4+doZMVvj099Qacmqb9Iyz5cYNww1bwmbxULDEgx4zIBFsw60w3Un5D7Zy7lxgTjewomSixoQxET6+dwGjEoLrxrPOZ0t+d3L3E4y0U=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2019 17:20:28.3080 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e01bceed-aedd-441f-3b75-08d6d56bcc46
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1275
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=neI0bkz3AK13Fzjh4JN5QNboa62MuY0hy/FsYM2p/Pc=;
 b=1VWBcAtUK4Bmopj9SMpertKQX55tu54NKu3dIZ8yQESXwTkPKvoMoiz/PYVd7ceXE4rXQ/NZu6j7CuH58krIwHXSOQWrbz+glTGMiDTsuXM3vhyu4dtq9IKt8PLoW+zBw3B9Eu2H3j35Z3w6N7wsPHOL7THhniDKiWT7gfkktoc=
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
Cc: Jun Lei <Jun.Lei@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSnVuIExlaSA8SnVuLkxlaUBhbWQuY29tPgoKbW92ZSB0aGUgdXBkYXRlIG9mIG90ZyBp
bnN0YW5jZSBvdXRzaWRlIG9mIGh3IHByb2dyYW1taW5nIGxvZ2ljLApzaW5jZSB0aGlzIGlzIHN3
IHN0YXRlLCBpdCBzaG91bGQgYWx3YXlzIGJlIHVwZGF0ZWQgYW5kIHNob3VsZApuZXZlciBiZSBv
cHRpbWl6ZWQgYXdheS4KClNpZ25lZC1vZmYtYnk6IEp1biBMZWkgPEp1bi5MZWlAYW1kLmNvbT4K
UmV2aWV3ZWQtYnk6IEVyaWMgWWFuZyA8ZXJpYy55YW5nMkBhbWQuY29tPgpBY2tlZC1ieTogQmhh
d2FucHJlZXQgTGFraGEgPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGMuYyB8IDQgLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2NvcmUvZGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMK
aW5kZXggYjdiOGU4OWY0YmU1Li4zNjg3NDU3ZjI1OGIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2NvcmUvZGMuYwpAQCAtMTE1Myw3ICsxMTUzLDYgQEAgc3RhdGljIGVudW0gZGNf
c3RhdHVzIGRjX2NvbW1pdF9zdGF0ZV9ub19jaGVjayhzdHJ1Y3QgZGMgKmRjLCBzdHJ1Y3QgZGNf
c3RhdGUgKmMKIAkvKiBQcm9ncmFtIGFsbCBwbGFuZXMgd2l0aGluIG5ldyBjb250ZXh0Ki8KIAlm
b3IgKGkgPSAwOyBpIDwgY29udGV4dC0+c3RyZWFtX2NvdW50OyBpKyspIHsKIAkJY29uc3Qgc3Ry
dWN0IGRjX2xpbmsgKmxpbmsgPSBjb250ZXh0LT5zdHJlYW1zW2ldLT5saW5rOwotCQlzdHJ1Y3Qg
ZGNfc3RyZWFtX3N0YXR1cyAqc3RhdHVzOwogCiAJCWlmICghY29udGV4dC0+c3RyZWFtc1tpXS0+
bW9kZV9jaGFuZ2VkKQogCQkJY29udGludWU7CkBAIC0xMTc4LDkgKzExNzcsNiBAQCBzdGF0aWMg
ZW51bSBkY19zdGF0dXMgZGNfY29tbWl0X3N0YXRlX25vX2NoZWNrKHN0cnVjdCBkYyAqZGMsIHN0
cnVjdCBkY19zdGF0ZSAqYwogCQkJfQogCQl9CiAKLQkJc3RhdHVzID0gZGNfc3RyZWFtX2dldF9z
dGF0dXNfZnJvbV9zdGF0ZShjb250ZXh0LCBjb250ZXh0LT5zdHJlYW1zW2ldKTsKLQkJY29udGV4
dC0+c3RyZWFtc1tpXS0+b3V0Lm90Z19vZmZzZXQgPSBzdGF0dXMtPnByaW1hcnlfb3RnX2luc3Q7
Ci0KIAkJQ09OTl9NU0dfTU9ERShsaW5rLCAieyVkeCVkLCAlZHglZEAlZEtoen0iLAogCQkJCWNv
bnRleHQtPnN0cmVhbXNbaV0tPnRpbWluZy5oX2FkZHJlc3NhYmxlLAogCQkJCWNvbnRleHQtPnN0
cmVhbXNbaV0tPnRpbWluZy52X2FkZHJlc3NhYmxlLAotLSAKMi4xNy4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
