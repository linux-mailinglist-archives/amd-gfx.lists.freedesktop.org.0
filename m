Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE40D93C4
	for <lists+amd-gfx@lfdr.de>; Wed, 16 Oct 2019 16:26:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F3A06E991;
	Wed, 16 Oct 2019 14:26:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690088.outbound.protection.outlook.com [40.107.69.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38C826E991
 for <amd-gfx@lists.freedesktop.org>; Wed, 16 Oct 2019 14:26:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QHWhtHv8hgvI5ywxpXgz2PSDxdFLmoVbQG0MrnruxMgxVklcCDh3REPBZxlop5CVMaKj1gOiT/gzGFyPr0BfTPs97t70Pav6pFnlSgW1dbpDbVfE4stK0Zuge7zMdMBvwrnEdrFXz3Qq/Jn/hfKNfirVkt0mPwtzCUoZ3ffT27Lq9e/B9V3TmTUseTUEB+2tJ3bqeR0YoU3EDZTmpg+QVDEg4ymH8olJy7FD54FhPZDL9d4FYJfBM6rmfhR9mFvq13OgcVjqLUTA1J4vYRYfIU4HAcUqXz1BA1jEVRmXB+1A6d5d/VShjtqomu3ZlyxgZi1GxvEPEL5kfZC+O6OBgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X5Q0B38GKl7FuaPjL8MgqI1IzN933/tn4M2S8bGoa8g=;
 b=LOX3J0AjHfgDG5vHcqDMm0zb5uq/LxoT198K5beLfuJpo/45RLeJouP/l+VWb3wR4XGi+EzgEbaK7wCCnIZZUcPSZacMb2HPCdKLtZvHRYQldThi/ME4aVjGzGmyN5tAil6XebQl+N6PAGdyWqMUpMjjOQpxEm+43s0qpY51ggerBJKo2tM2VrEeLrOONUvR1LWirdqD9koRM64sCD0mokm6yshQKV/t0JWLNEjQ3JID9x/7BEdDWEniriU0P1FEs7gx5cBgRjJFLEFI6IoxYyjPy7t7nAjKVV8SGEbMSaFXfgn8LeqFB0tXc7WHYbvWKLEHYWkhheWJmL8q1H/D+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR12CA0067.namprd12.prod.outlook.com (2603:10b6:300:103::29)
 by CH2PR12MB4071.namprd12.prod.outlook.com (2603:10b6:610:7b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.22; Wed, 16 Oct
 2019 14:26:09 +0000
Received: from BY2NAM03FT059.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::207) by MWHPR12CA0067.outlook.office365.com
 (2603:10b6:300:103::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16 via Frontend
 Transport; Wed, 16 Oct 2019 14:26:09 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BY2NAM03FT059.mail.protection.outlook.com (10.152.85.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2367.14 via Frontend Transport; Wed, 16 Oct 2019 14:26:09 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 16 Oct
 2019 09:26:08 -0500
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 16 Oct
 2019 09:26:08 -0500
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Wed, 16 Oct 2019 09:26:07 -0500
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v3] drm/amd/display: Add MST atomic routines
Date: Wed, 16 Oct 2019 10:25:53 -0400
Message-ID: <20191016142553.7784-1-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(39860400002)(136003)(346002)(428003)(199004)(189003)(476003)(186003)(426003)(356004)(70206006)(70586007)(26005)(1076003)(48376002)(2876002)(86362001)(6666004)(47776003)(2616005)(336012)(486006)(126002)(478600001)(36756003)(2906002)(6916009)(51416003)(7696005)(54906003)(8676002)(81156014)(81166006)(16586007)(53416004)(50466002)(4326008)(50226002)(5660300002)(2351001)(316002)(14444005)(305945005)(8936002)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB4071; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 085eb675-a5ea-42ee-d79e-08d75244c9b5
X-MS-TrafficTypeDiagnostic: CH2PR12MB4071:
X-Microsoft-Antispam-PRVS: <CH2PR12MB40711F7AF77A6F0FA22754CFE4920@CH2PR12MB4071.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:250;
X-Forefront-PRVS: 0192E812EC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g0E0sj+YAP208BswCdUNKLZJjdd4g7kpDQl4fvSJOWRWJDa++UvorV7CUr+orYnHQXAr8So9ChR+yVzF6Kq0SG4VchqnIPFlTt8gMKFeSI8shERNGtx0LjV640RdQV0X/nCAzwajQRN3yVPBE6s2q7uVWxaFlzYFBKm1E4mZbnoEF0EMfzfS5uvxsKGDSOnSKgt0eMCQZ1iiI6Z6MscanPNC3LVqMZCu9qAL8gMcgt+JUKrncyg22IM6ZyN4ZNGrYKKmQuK1EKsL2NOA6UkS/A4ZSKA9vcDoQ0dzyA+mlWdiFogC7WCpqxYRfFgbUSApecVtgVdYhYdvkmu+PeAt0qCupP2RqQY3DING/F/zZ4r0YIpkvSZw7LlvBKW+guG9qHGyKZNRGLQhuN4dirh5KmZTH4R54ovFLgVD1eHqDXM=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2019 14:26:09.0304 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 085eb675-a5ea-42ee-d79e-08d75244c9b5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4071
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X5Q0B38GKl7FuaPjL8MgqI1IzN933/tn4M2S8bGoa8g=;
 b=fldvTDE1kW3x3eMOcTMNqSUUe22DkXppWyUT4sc3SU6h8qp7/bEjqhwTkB250qa5UDUNRD291bAbFdDU+bgJt7E9xjOKcJK9MJn3ZDhdRNVP3BILWt6iDNPW0whbpgG9Re5/Jj+mkrYzyal9nwATSKvfK70v4au+WXRfcP8gX1M=
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
Cc: Jerry Zuo <Jerry.Zuo@amd.com>, Mikita Lipski <mikita.lipski@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTWlraXRhIExpcHNraSA8bWlraXRhLmxpcHNraUBhbWQuY29tPgoKLSBBZGRpbmcgZW5j
b2RlciBhdG9taWMgY2hlY2sgdG8gZmluZCB2Y3BpIHNsb3RzIGZvciBhIGNvbm5lY3RvcgotIFVz
aW5nIERSTSBoZWxwZXIgZnVuY3Rpb25zIHRvIGNhbGN1bGF0ZSBQQk4KLSBBZGRpbmcgY29ubmVj
dG9yIGF0b21pYyBjaGVjayB0byByZWxlYXNlIHZjcGkgc2xvdHMgaWYgY29ubmVjdG9yCmxvc2Vz
IENSVEMKLSBDYWxjdWxhdGUgIFBCTiBhbmQgVkNQSSBzbG90cyBvbmx5IG9uY2UgZHVyaW5nIGF0
b21pYwpjaGVjayBhbmQgc3RvcmUgdGhlbSBvbiBjcnRjX3N0YXRlIHRvIGVsaW1pbmF0ZQpyZWR1
bmRhbnQgY2FsY3VsYXRpb24KLSBDYWxsIGRybV9kcF9tc3RfYXRvbWljX2NoZWNrIHRvIHZlcmlm
eSB2YWxpZGl0eSBvZiBNU1QgdG9wb2xvZ3kKZHVyaW5nIHN0YXRlIGF0b21pYyBjaGVjawoKdjI6
IHNxdWFzaGVkIHByZXZpb3VzIDMgc2VwYXJhdGUgcGF0Y2hlcywgcmVtb3ZlZCBEU0MgUEJOIGNh
bGN1bGF0aW9uLAphbmQgYWRkZWQgUEJOIGFuZCBWQ1BJIHNsb3RzIHByb3BlcnRpZXMgdG8gYW1k
Z3B1IGNvbm5lY3RvcgoKdjM6Ci0gbW92ZWQgdmNwaV9zbG90cyBhbmQgcGJuIHByb3BlcnRpZXMg
dG8gZG1fY3J0Y19zdGF0ZSBhbmQgZGNfc3RyZWFtX3N0YXRlCi0gdXBkYXRlcyBzdHJlYW0ncyB2
Y3BpX3Nsb3RzIGFuZCBwYm4gb24gY29tbWl0Ci0gc2VwYXJhdGVkIHBhdGNoIGZyb20gdGhlIERT
QyBNU1Qgc2VyaWVzIAoKQ2M6IEplcnJ5IFp1byA8SmVycnkuWnVvQGFtZC5jb20+CkNjOiBIYXJy
eSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4KQ2M6IE5pY2hvbGFzIEthemxhdXNr
YXMgPG5pY2hvbGFzLmthemxhdXNrYXNAYW1kLmNvbT4KQ2M6IEx5dWRlIFBhdWwgPGx5dWRlQHJl
ZGhhdC5jb20+ClNpZ25lZC1vZmYtYnk6IE1pa2l0YSBMaXBza2kgPG1pa2l0YS5saXBza2lAYW1k
LmNvbT4KLS0tCiAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMg
fCA1OSArKysrKysrKysrKysrKysrKystCiAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVf
ZG0vYW1kZ3B1X2RtLmggfCAgNCArKwogLi4uL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVf
ZG1faGVscGVycy5jIHwgNDIgKy0tLS0tLS0tLS0tLQogLi4uL2Rpc3BsYXkvYW1kZ3B1X2RtL2Ft
ZGdwdV9kbV9tc3RfdHlwZXMuYyAgIHwgMzIgKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2RjX3N0cmVhbS5oICAgIHwgIDMgKwogNSBmaWxlcyBjaGFuZ2VkLCA5OSBp
bnNlcnRpb25zKCspLCA0MSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwppbmRleCAxMGNjZTU4NDcxOWYuLmMzN2Mz
ODRhMzM2NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9k
bS9hbWRncHVfZG0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2Rt
L2FtZGdwdV9kbS5jCkBAIC0zODExLDYgKzM4MTEsOSBAQCBjcmVhdGVfc3RyZWFtX2Zvcl9zaW5r
KHN0cnVjdCBhbWRncHVfZG1fY29ubmVjdG9yICphY29ubmVjdG9yLAogCiAJdXBkYXRlX3N0cmVh
bV9zaWduYWwoc3RyZWFtLCBzaW5rKTsKIAorCXN0cmVhbS0+dmNwaV9zbG90cyA9IDA7CisJc3Ry
ZWFtLT5wYm4gPSAwOworCiAJaWYgKHN0cmVhbS0+c2lnbmFsID09IFNJR05BTF9UWVBFX0hETUlf
VFlQRV9BKQogCQltb2RfYnVpbGRfaGZfdnNpZl9pbmZvcGFja2V0KHN0cmVhbSwgJnN0cmVhbS0+
dnNwX2luZm9wYWNrZXQsIGZhbHNlLCBmYWxzZSk7CiAKQEAgLTM4ODksNiArMzg5Miw4IEBAIGRt
X2NydGNfZHVwbGljYXRlX3N0YXRlKHN0cnVjdCBkcm1fY3J0YyAqY3J0YykKIAlzdGF0ZS0+Y3Jj
X3NyYyA9IGN1ci0+Y3JjX3NyYzsKIAlzdGF0ZS0+Y21faGFzX2RlZ2FtbWEgPSBjdXItPmNtX2hh
c19kZWdhbW1hOwogCXN0YXRlLT5jbV9pc19kZWdhbW1hX3NyZ2IgPSBjdXItPmNtX2lzX2RlZ2Ft
bWFfc3JnYjsKKwlzdGF0ZS0+dmNwaV9zbG90cyA9IGN1ci0+dmNwaV9zbG90czsKKwlzdGF0ZS0+
cGJuID0gY3VyLT5wYm47CiAKIAkvKiBUT0RPIER1cGxpY2F0ZSBkY19zdHJlYW0gYWZ0ZXIgb2Jq
ZWN0cyBhcmUgc3RyZWFtIG9iamVjdCBpcyBmbGF0dGVuZWQgKi8KIApAQCAtNDU4Nyw2ICs0NTky
LDM4IEBAIHN0YXRpYyBpbnQgZG1fZW5jb2Rlcl9oZWxwZXJfYXRvbWljX2NoZWNrKHN0cnVjdCBk
cm1fZW5jb2RlciAqZW5jb2RlciwKIAkJCQkJICBzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKmNydGNf
c3RhdGUsCiAJCQkJCSAgc3RydWN0IGRybV9jb25uZWN0b3Jfc3RhdGUgKmNvbm5fc3RhdGUpCiB7
CisJc3RydWN0IGRybV9hdG9taWNfc3RhdGUgKnN0YXRlID0gY3J0Y19zdGF0ZS0+c3RhdGU7CisJ
c3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciA9IGNvbm5fc3RhdGUtPmNvbm5lY3RvcjsK
KwlzdHJ1Y3QgYW1kZ3B1X2RtX2Nvbm5lY3RvciAqYWNvbm5lY3RvciA9IHRvX2FtZGdwdV9kbV9j
b25uZWN0b3IoY29ubmVjdG9yKTsKKwlzdHJ1Y3QgZG1fY3J0Y19zdGF0ZSAqZG1fbmV3X2NydGNf
c3RhdGUgPSB0b19kbV9jcnRjX3N0YXRlKGNydGNfc3RhdGUpOworCWNvbnN0IHN0cnVjdCBkcm1f
ZGlzcGxheV9tb2RlICphZGp1c3RlZF9tb2RlID0gJmNydGNfc3RhdGUtPmFkanVzdGVkX21vZGU7
CisJc3RydWN0IGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyICptc3RfbWdyOworCXN0cnVjdCBkcm1f
ZHBfbXN0X3BvcnQgKm1zdF9wb3J0OworCWludCBjbG9jaywgYnBwID0gMDsKKworCWlmICghYWNv
bm5lY3Rvci0+cG9ydCB8fCAhYWNvbm5lY3Rvci0+ZGNfc2luaykKKwkJcmV0dXJuIDA7CisKKwlt
c3RfcG9ydCA9IGFjb25uZWN0b3ItPnBvcnQ7CisJbXN0X21nciA9ICZhY29ubmVjdG9yLT5tc3Rf
cG9ydC0+bXN0X21ncjsKKworCWlmICghY3J0Y19zdGF0ZS0+Y29ubmVjdG9yc19jaGFuZ2VkICYm
ICFjcnRjX3N0YXRlLT5tb2RlX2NoYW5nZWQpCisJCXJldHVybiAwOworCisJaWYoIXN0YXRlLT5k
dXBsaWNhdGVkKSB7CisJCWJwcCA9ICh1aW50OF90KWNvbm5lY3Rvci0+ZGlzcGxheV9pbmZvLmJw
YyAqIDM7CisJCWNsb2NrID0gYWRqdXN0ZWRfbW9kZS0+Y2xvY2s7CisJCWRtX25ld19jcnRjX3N0
YXRlLT5wYm4gPSBkcm1fZHBfY2FsY19wYm5fbW9kZShjbG9jaywgYnBwKTsKKwl9CisJZG1fbmV3
X2NydGNfc3RhdGUtPnZjcGlfc2xvdHMgPSBkcm1fZHBfYXRvbWljX2ZpbmRfdmNwaV9zbG90cyhz
dGF0ZSwKKwkJCQkJCQkgICAgICAgbXN0X21nciwKKwkJCQkJCQkgICAgICAgbXN0X3BvcnQsCisJ
CQkJCQkJICAgICAgIGRtX25ld19jcnRjX3N0YXRlLT5wYm4pOworCisJaWYgKGRtX25ld19jcnRj
X3N0YXRlLT52Y3BpX3Nsb3RzIDwgMCkgeworCQlEUk1fREVCVUdfQVRPTUlDKCJmYWlsZWQgZmlu
ZGluZyB2Y3BpIHNsb3RzOiAlZFxuIiwgZG1fbmV3X2NydGNfc3RhdGUtPnZjcGlfc2xvdHMpOwor
CQlyZXR1cm4gZG1fbmV3X2NydGNfc3RhdGUtPnZjcGlfc2xvdHM7CisJfQogCXJldHVybiAwOwog
fQogCkBAIC02MTI3LDYgKzYxNjQsOSBAQCBzdGF0aWMgdm9pZCBhbWRncHVfZG1fY29tbWl0X3Bs
YW5lcyhzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqc3RhdGUsCiAJCQkJYWNydGNfc3RhdGUtPnN0
cmVhbS0+b3V0X3RyYW5zZmVyX2Z1bmM7CiAJCX0KIAorCQlhY3J0Y19zdGF0ZS0+c3RyZWFtLT52
Y3BpX3Nsb3RzID0gYWNydGNfc3RhdGUtPnZjcGlfc2xvdHM7CisJCWFjcnRjX3N0YXRlLT5zdHJl
YW0tPnBibiA9IGFjcnRjX3N0YXRlLT5wYm47CisKIAkJYWNydGNfc3RhdGUtPnN0cmVhbS0+YWJt
X2xldmVsID0gYWNydGNfc3RhdGUtPmFibV9sZXZlbDsKIAkJaWYgKGFjcnRjX3N0YXRlLT5hYm1f
bGV2ZWwgIT0gZG1fb2xkX2NydGNfc3RhdGUtPmFibV9sZXZlbCkKIAkJCWJ1bmRsZS0+c3RyZWFt
X3VwZGF0ZS5hYm1fbGV2ZWwgPSAmYWNydGNfc3RhdGUtPmFibV9sZXZlbDsKQEAgLTY1MjcsNyAr
NjU2Nyw3IEBAIHN0YXRpYyB2b2lkIGFtZGdwdV9kbV9hdG9taWNfY29tbWl0X3RhaWwoc3RydWN0
IGRybV9hdG9taWNfc3RhdGUgKnN0YXRlKQogCQlzdHJ1Y3QgZGNfc3RyZWFtX3VwZGF0ZSBzdHJl
YW1fdXBkYXRlOwogCQlzdHJ1Y3QgZGNfaW5mb19wYWNrZXQgaGRyX3BhY2tldDsKIAkJc3RydWN0
IGRjX3N0cmVhbV9zdGF0dXMgKnN0YXR1cyA9IE5VTEw7Ci0JCWJvb2wgYWJtX2NoYW5nZWQsIGhk
cl9jaGFuZ2VkLCBzY2FsaW5nX2NoYW5nZWQ7CisJCWJvb2wgYWJtX2NoYW5nZWQsIGhkcl9jaGFu
Z2VkLCBzY2FsaW5nX2NoYW5nZWQsIG1zdF92Y3BpX2NoYW5nZWQ7CiAKIAkJbWVtc2V0KCZkdW1t
eV91cGRhdGVzLCAwLCBzaXplb2YoZHVtbXlfdXBkYXRlcykpOwogCQltZW1zZXQoJnN0cmVhbV91
cGRhdGUsIDAsIHNpemVvZihzdHJlYW1fdXBkYXRlKSk7CkBAIC02NTUzLDcgKzY1OTMsMTIgQEAg
c3RhdGljIHZvaWQgYW1kZ3B1X2RtX2F0b21pY19jb21taXRfdGFpbChzdHJ1Y3QgZHJtX2F0b21p
Y19zdGF0ZSAqc3RhdGUpCiAJCWhkcl9jaGFuZ2VkID0KIAkJCWlzX2hkcl9tZXRhZGF0YV9kaWZm
ZXJlbnQob2xkX2Nvbl9zdGF0ZSwgbmV3X2Nvbl9zdGF0ZSk7CiAKLQkJaWYgKCFzY2FsaW5nX2No
YW5nZWQgJiYgIWFibV9jaGFuZ2VkICYmICFoZHJfY2hhbmdlZCkKKwkJbXN0X3ZjcGlfY2hhbmdl
ZCA9IChkbV9uZXdfY3J0Y19zdGF0ZS0+dmNwaV9zbG90cyAhPQorCQkJCSAgIGRtX29sZF9jcnRj
X3N0YXRlLT52Y3BpX3Nsb3RzKSB8fAorCQkJCSAgIChkbV9uZXdfY3J0Y19zdGF0ZS0+cGJuICE9
CisJCQkJICAgZG1fb2xkX2NydGNfc3RhdGUtPnBibik7CisKKwkJaWYgKCFzY2FsaW5nX2NoYW5n
ZWQgJiYgIWFibV9jaGFuZ2VkICYmICFoZHJfY2hhbmdlZCAmJiAhbXN0X3ZjcGlfY2hhbmdlZCkK
IAkJCWNvbnRpbnVlOwogCiAJCXN0cmVhbV91cGRhdGUuc3RyZWFtID0gZG1fbmV3X2NydGNfc3Rh
dGUtPnN0cmVhbTsKQEAgLTY1NzYsNiArNjYyMSwxMSBAQCBzdGF0aWMgdm9pZCBhbWRncHVfZG1f
YXRvbWljX2NvbW1pdF90YWlsKHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSkKIAkJCXN0
cmVhbV91cGRhdGUuaGRyX3N0YXRpY19tZXRhZGF0YSA9ICZoZHJfcGFja2V0OwogCQl9CiAKKwkJ
aWYgKG1zdF92Y3BpX2NoYW5nZWQpIHsKKwkJCWRtX25ld19jcnRjX3N0YXRlLT5zdHJlYW0tPnZj
cGlfc2xvdHMgPSBkbV9uZXdfY3J0Y19zdGF0ZS0+dmNwaV9zbG90czsKKwkJCWRtX25ld19jcnRj
X3N0YXRlLT5zdHJlYW0tPnBibiA9IGRtX25ld19jcnRjX3N0YXRlLT5wYm47CisJCX0KKwogCQlz
dGF0dXMgPSBkY19zdHJlYW1fZ2V0X3N0YXR1cyhkbV9uZXdfY3J0Y19zdGF0ZS0+c3RyZWFtKTsK
IAkJV0FSTl9PTighc3RhdHVzKTsKIAkJV0FSTl9PTighc3RhdHVzLT5wbGFuZV9jb3VudCk7CkBA
IC03NjA2LDYgKzc2NTYsMTEgQEAgc3RhdGljIGludCBhbWRncHVfZG1fYXRvbWljX2NoZWNrKHN0
cnVjdCBkcm1fZGV2aWNlICpkZXYsCiAJaWYgKHJldCkKIAkJZ290byBmYWlsOwogCisJLyogUGVy
Zm9ybSB2YWxpZGF0aW9uIG9mIE1TVCB0b3BvbG9neSBpbiB0aGUgc3RhdGUqLworCXJldCA9IGRy
bV9kcF9tc3RfYXRvbWljX2NoZWNrKHN0YXRlKTsKKwlpZiAocmV0KQorCQlnb3RvIGZhaWw7CisK
IAlpZiAoc3RhdGUtPmxlZ2FjeV9jdXJzb3JfdXBkYXRlKSB7CiAJCS8qCiAJCSAqIFRoaXMgaXMg
YSBmYXN0IGN1cnNvciB1cGRhdGUgY29taW5nIGZyb20gdGhlIHBsYW5lIHVwZGF0ZQpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uaCBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmgKaW5kZXgg
YzZmZGViZWU3MTg5Li42ZGU5YThlNTgyZjEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uaApAQCAtMzM4LDYgKzMzOCwxMCBAQCBzdHJ1
Y3QgZG1fY3J0Y19zdGF0ZSB7CiAJc3RydWN0IGRjX2luZm9fcGFja2V0IHZycl9pbmZvcGFja2V0
OwogCiAJaW50IGFibV9sZXZlbDsKKworCS8qIE1TVCBzcGVjaWZpYyAqLworCWludCB2Y3BpX3Ns
b3RzOworCWludCBwYm47CiB9OwogCiAjZGVmaW5lIHRvX2RtX2NydGNfc3RhdGUoeCkgY29udGFp
bmVyX29mKHgsIHN0cnVjdCBkbV9jcnRjX3N0YXRlLCBiYXNlKQpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faGVscGVycy5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faGVscGVycy5jCmlu
ZGV4IDExZTU3ODRhYTYyYS4uMjFlMzY0YzkyZGY1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9oZWxwZXJzLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1faGVscGVycy5jCkBAIC0x
ODQsMTEgKzE4NCw3IEBAIGJvb2wgZG1faGVscGVyc19kcF9tc3Rfd3JpdGVfcGF5bG9hZF9hbGxv
Y2F0aW9uX3RhYmxlKAogCXN0cnVjdCBhbWRncHVfZG1fY29ubmVjdG9yICphY29ubmVjdG9yOwog
CXN0cnVjdCBkcm1fZHBfbXN0X3RvcG9sb2d5X21nciAqbXN0X21ncjsKIAlzdHJ1Y3QgZHJtX2Rw
X21zdF9wb3J0ICptc3RfcG9ydDsKLQlpbnQgc2xvdHMgPSAwOwogCWJvb2wgcmV0OwotCWludCBj
bG9jazsKLQlpbnQgYnBwID0gMDsKLQlpbnQgcGJuID0gMDsKIAogCWFjb25uZWN0b3IgPSAoc3Ry
dWN0IGFtZGdwdV9kbV9jb25uZWN0b3IgKilzdHJlYW0tPmRtX3N0cmVhbV9jb250ZXh0OwogCkBA
IC0yMDMsNDIgKzE5OSwxMCBAQCBib29sIGRtX2hlbHBlcnNfZHBfbXN0X3dyaXRlX3BheWxvYWRf
YWxsb2NhdGlvbl90YWJsZSgKIAltc3RfcG9ydCA9IGFjb25uZWN0b3ItPnBvcnQ7CiAKIAlpZiAo
ZW5hYmxlKSB7Ci0JCWNsb2NrID0gc3RyZWFtLT50aW1pbmcucGl4X2Nsa18xMDBoeiAvIDEwOwot
Ci0JCXN3aXRjaCAoc3RyZWFtLT50aW1pbmcuZGlzcGxheV9jb2xvcl9kZXB0aCkgewotCi0JCWNh
c2UgQ09MT1JfREVQVEhfNjY2OgotCQkJYnBwID0gNjsKLQkJCWJyZWFrOwotCQljYXNlIENPTE9S
X0RFUFRIXzg4ODoKLQkJCWJwcCA9IDg7Ci0JCQlicmVhazsKLQkJY2FzZSBDT0xPUl9ERVBUSF8x
MDEwMTA6Ci0JCQlicHAgPSAxMDsKLQkJCWJyZWFrOwotCQljYXNlIENPTE9SX0RFUFRIXzEyMTIx
MjoKLQkJCWJwcCA9IDEyOwotCQkJYnJlYWs7Ci0JCWNhc2UgQ09MT1JfREVQVEhfMTQxNDE0Ogot
CQkJYnBwID0gMTQ7Ci0JCQlicmVhazsKLQkJY2FzZSBDT0xPUl9ERVBUSF8xNjE2MTY6Ci0JCQli
cHAgPSAxNjsKLQkJCWJyZWFrOwotCQlkZWZhdWx0OgotCQkJQVNTRVJUKGJwcCAhPSAwKTsKLQkJ
CWJyZWFrOwotCQl9Ci0KLQkJYnBwID0gYnBwICogMzsKLQotCQkvKiBUT0RPIG5lZWQgdG8ga25v
dyBsaW5rIHJhdGUgKi8KLQotCQlwYm4gPSBkcm1fZHBfY2FsY19wYm5fbW9kZShjbG9jaywgYnBw
KTsKLQotCQlzbG90cyA9IGRybV9kcF9maW5kX3ZjcGlfc2xvdHMobXN0X21nciwgcGJuKTsKLQkJ
cmV0ID0gZHJtX2RwX21zdF9hbGxvY2F0ZV92Y3BpKG1zdF9tZ3IsIG1zdF9wb3J0LCBwYm4sIHNs
b3RzKTsKIAorCQlyZXQgPSBkcm1fZHBfbXN0X2FsbG9jYXRlX3ZjcGkobXN0X21nciwgbXN0X3Bv
cnQsCisJCQkJCSAgICAgICBzdHJlYW0tPnBibiwKKwkJCQkJICAgICAgIHN0cmVhbS0+dmNwaV9z
bG90cyk7CiAJCWlmICghcmV0KQogCQkJcmV0dXJuIGZhbHNlOwogCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9tc3RfdHlwZXMuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX21zdF90eXBl
cy5jCmluZGV4IDNhZjJiNDI5ZmYxYi4uN2YzY2UyOWJkMTRjIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9tc3RfdHlwZXMuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9tc3RfdHlw
ZXMuYwpAQCAtMjUwLDEwICsyNTAsNDIgQEAgZG1fbXN0X2F0b21pY19iZXN0X2VuY29kZXIoc3Ry
dWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciwKIAlyZXR1cm4gJnRvX2FtZGdwdV9kbV9jb25u
ZWN0b3IoY29ubmVjdG9yKS0+bXN0X2VuY29kZXItPmJhc2U7CiB9CiAKK3N0YXRpYyBpbnQgZG1f
ZHBfbXN0X2F0b21pY19jaGVjayhzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLAorCQkJ
CXN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSkKK3sKKwlzdHJ1Y3QgZHJtX2Nvbm5lY3Rv
cl9zdGF0ZSAqbmV3X2Nvbm5fc3RhdGUgPQorCQkJZHJtX2F0b21pY19nZXRfbmV3X2Nvbm5lY3Rv
cl9zdGF0ZShzdGF0ZSwgY29ubmVjdG9yKTsKKwlzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9zdGF0ZSAq
b2xkX2Nvbm5fc3RhdGUgPQorCQkJZHJtX2F0b21pY19nZXRfb2xkX2Nvbm5lY3Rvcl9zdGF0ZShz
dGF0ZSwgY29ubmVjdG9yKTsKKwlzdHJ1Y3QgYW1kZ3B1X2RtX2Nvbm5lY3RvciAqYWNvbm5lY3Rv
ciA9IHRvX2FtZGdwdV9kbV9jb25uZWN0b3IoY29ubmVjdG9yKTsKKwlzdHJ1Y3QgZHJtX2NydGNf
c3RhdGUgKm5ld19jcnRjX3N0YXRlOworCXN0cnVjdCBkcm1fZHBfbXN0X3RvcG9sb2d5X21nciAq
bXN0X21ncjsKKwlzdHJ1Y3QgZHJtX2RwX21zdF9wb3J0ICptc3RfcG9ydDsKKworCW1zdF9wb3J0
ID0gYWNvbm5lY3Rvci0+cG9ydDsKKwltc3RfbWdyID0gJmFjb25uZWN0b3ItPm1zdF9wb3J0LT5t
c3RfbWdyOworCisJaWYgKCFvbGRfY29ubl9zdGF0ZS0+Y3J0YykKKwkJcmV0dXJuIDA7CisKKwlp
ZiAobmV3X2Nvbm5fc3RhdGUtPmNydGMpIHsKKwkJbmV3X2NydGNfc3RhdGUgPSBkcm1fYXRvbWlj
X2dldF9vbGRfY3J0Y19zdGF0ZShzdGF0ZSwgbmV3X2Nvbm5fc3RhdGUtPmNydGMpOworCQlpZiAo
IW5ld19jcnRjX3N0YXRlIHx8CisJCSAgICAhZHJtX2F0b21pY19jcnRjX25lZWRzX21vZGVzZXQo
bmV3X2NydGNfc3RhdGUpIHx8CisJCSAgICBuZXdfY3J0Y19zdGF0ZS0+ZW5hYmxlKQorCQkJcmV0
dXJuIDA7CisJCX0KKworCXJldHVybiBkcm1fZHBfYXRvbWljX3JlbGVhc2VfdmNwaV9zbG90cyhz
dGF0ZSwKKwkJCQkJCW1zdF9tZ3IsCisJCQkJCQltc3RfcG9ydCk7Cit9CisKIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9oZWxwZXJfZnVuY3MgZG1fZHBfbXN0X2Nvbm5lY3Rvcl9o
ZWxwZXJfZnVuY3MgPSB7CiAJLmdldF9tb2RlcyA9IGRtX2RwX21zdF9nZXRfbW9kZXMsCiAJLm1v
ZGVfdmFsaWQgPSBhbWRncHVfZG1fY29ubmVjdG9yX21vZGVfdmFsaWQsCiAJLmF0b21pY19iZXN0
X2VuY29kZXIgPSBkbV9tc3RfYXRvbWljX2Jlc3RfZW5jb2RlciwKKwkuYXRvbWljX2NoZWNrID0g
ZG1fZHBfbXN0X2F0b21pY19jaGVjaywKIH07CiAKIHN0YXRpYyB2b2lkIGFtZGdwdV9kbV9lbmNv
ZGVyX2Rlc3Ryb3koc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyKQpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjX3N0cmVhbS5oIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2RjX3N0cmVhbS5oCmluZGV4IGZkYjZhZGMzNzg1Ny4uMDEwMDQxMDk2
NTA1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNfc3RyZWFt
LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjX3N0cmVhbS5oCkBAIC0y
MDgsNiArMjA4LDkgQEAgc3RydWN0IGRjX3N0cmVhbV9zdGF0ZSB7CiAJdW5zaWduZWQgaW50IG51
bV93Yl9pbmZvOwogCXN0cnVjdCBkY193cml0ZWJhY2tfaW5mbyB3cml0ZWJhY2tfaW5mb1tNQVhf
RFdCX1BJUEVTXTsKICNlbmRpZgorCisJdW5zaWduZWQgaW50IHZjcGlfc2xvdHM7CisJdW5zaWdu
ZWQgaW50IHBibjsKIAkvKiBDb21wdXRlZCBzdGF0ZSBiaXRzICovCiAJYm9vbCBtb2RlX2NoYW5n
ZWQgOiAxOwogCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeA==
