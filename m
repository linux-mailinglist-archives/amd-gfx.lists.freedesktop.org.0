Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFEB69DB6
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:21:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B860989C59;
	Mon, 15 Jul 2019 21:21:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730052.outbound.protection.outlook.com [40.107.73.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 472C489C19
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:21:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lsl7DhQOsWtuNBf9cpEoIfGU7TkvtldiOgz1wT3PXkhMseG6FlZ1KbD3b1TdKvJyIr9wUFzV+QMcMJZ5jc4A10CXIM9P3xra7RRb8V/f5lQrMtW5ym9k2YtDQbgZq3t2MG967eJANr+A4w6WDbjpR+H/VdqR4wuN8CRBq2fQcAQLQZnUDDgh1SEUnPiLIU665iUFU0z6hZ4FpRFzmmXAA4S4MQ98IVs6BKf8MjECNoouxXZyhvLNZti9JApxFsXxKK6WZpM5RPe8O8Y4f5sprNkwVBDSzCQ3wICJY/vnaVlKhX41AAMcYH+Jo+tfbXzQjbtHIYLwXy0ZrPvbxQpHJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y3RE3Ugb5Q7deINHkqnj3NqnVevyB1gw9LPkJbACdQw=;
 b=D2AwuTLcPIUwbEMmhYcaoQm9lHZThGyBehkzoVLT+0NFlNmHONLOysP2vbWQX5OjkgVZFdSmjzmfb5rZLfF6K7mZu/ggJKnOghnBbLc/fmWJxjxM8H1Y8tWnx8+SnLiOdHHXvpeF9ii/FIeF0icr92W/SC5VHZdJNHUuzi/YhcEmzZnaY4r1PM4pb0zxwGgdtfbQMPjF2DA5M8ftpo9lgMtpGfBYbaK3VqTCAHtyws1RxqxEnc7ccdGBPxbXHRRzXMV8LR6xYmmaQoHU3BVGXevssuT9jcm4DkrCXoLw1ZpKa9lkZdYAqa10ytIOM+v8vRZ+PcKDWLr9fm/wB40dsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM5PR12CA0004.namprd12.prod.outlook.com (2603:10b6:4:1::14) by
 DM5PR12MB1929.namprd12.prod.outlook.com (2603:10b6:3:106::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Mon, 15 Jul 2019 21:21:37 +0000
Received: from CO1NAM03FT028.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::206) by DM5PR12CA0004.outlook.office365.com
 (2603:10b6:4:1::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.10 via Frontend
 Transport; Mon, 15 Jul 2019 21:21:36 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT028.mail.protection.outlook.com (10.152.80.189) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 15 Jul 2019 21:21:36 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 15 Jul 2019 16:21:23 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 36/87] drm/amd/display: Remove dsc disable_ich flag
 programming.
Date: Mon, 15 Jul 2019 17:19:58 -0400
Message-ID: <20190715212049.4584-37-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715212049.4584-1-sunpeng.li@amd.com>
References: <20190715212049.4584-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(396003)(376002)(346002)(2980300002)(428003)(189003)(199004)(336012)(305945005)(2870700001)(446003)(6666004)(356004)(6916009)(2906002)(186003)(4326008)(14444005)(36756003)(26005)(53936002)(68736007)(48376002)(47776003)(5660300002)(2876002)(49486002)(486006)(1076003)(76176011)(478600001)(81166006)(81156014)(8936002)(50466002)(86362001)(51416003)(2351001)(426003)(11346002)(70206006)(54906003)(70586007)(476003)(50226002)(2616005)(126002)(316002)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1929; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 198105ec-9ef1-4dcc-4c88-08d7096a6b4a
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM5PR12MB1929; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1929:
X-Microsoft-Antispam-PRVS: <DM5PR12MB19296CF04B999E82C0DEC71B82CF0@DM5PR12MB1929.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1169;
X-Forefront-PRVS: 00997889E7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: z/+/AGKk5et6TSAKcopxr69fx6fqvp/kamYbfVX8sAyeQlD4Q2ychFPzVIgOtZmKaNOrPkJxXGakCIZ30/zk7YyFUQBcbn0bFN2OlG1LO0yJ7ieptVTAPD+TiRIa67iF7BSrvSfxsTaA9HEcZmg9UI9FhaS2ZVBnf+UYbCBuUxYcQtaUgLO/Ek3JG+SNiLfmWH/1Lsj+gw9uEbn6EZqW368iq6EQIdDc7Lo+rZ+Fy6F/PqScbhKEyu8G9VhmOn6K3l5H9eRoovd90tiWds6oeeQd5Qp90rE4zqXNqjmjSD4Np2Y3JDwMidkbw92EGvQUMiRB1sG3SNFz6DJJAGZnU/LIQF7/Mmaijs5MsfMTVTIN1MELvmHsFBZlAaZsgJeMzDGT0zrbqrY/jiGZJzldYo28WI1sKSRIAkiCykwmo2A=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2019 21:21:36.5407 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 198105ec-9ef1-4dcc-4c88-08d7096a6b4a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1929
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y3RE3Ugb5Q7deINHkqnj3NqnVevyB1gw9LPkJbACdQw=;
 b=QS4dsc6RIpLWhhDfzHLuiDKqP50ZuU3fiO0KvOd/837g+QFsUolr/kJ1ytZCskVkJZ2aA6MmtqU+e44cp9IUFFENW2Vg/J/KHG3imffQidHmwsrf+doZ+hcPiJ2foN85vGjGv+s/12i8hoZKj05HsQXlWilXKkT+9jNwNFyTPvw=
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
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRG15dHJvIExha3R5dXNoa2luIDxEbXl0cm8uTGFrdHl1c2hraW5AYW1kLmNvbT4KCkN1
cnJlbnQgZGVmYXVsdCBpcyBzdWZmaWNpZW50IGZvciBhIGZsYWcgdGhhdCBkb2VzIG5vdCBjaGFu
Z2UuCgpTaWduZWQtb2ZmLWJ5OiBEbXl0cm8gTGFrdHl1c2hraW4gPERteXRyby5MYWt0eXVzaGtp
bkBhbWQuY29tPgpSZXZpZXdlZC1ieTogQ2hhcmxlbmUgTGl1IDxDaGFybGVuZS5MaXVAYW1kLmNv
bT4KQWNrZWQtYnk6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9kc2MuYyB8IDggKysrKystLS0KIGRyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9kc2MuaCB8IDQgKystLQogMiBm
aWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2RzYy5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2RzYy5jCmluZGV4IGZmZDAw
MTRlYzNiNS4uZTg3MGNhYThkNGZhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvZGNuMjAvZGNuMjBfZHNjLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2RjbjIwL2RjbjIwX2RzYy5jCkBAIC00MzYsNyArNDM2LDcgQEAgc3RhdGljIHZvaWQg
ZHNjX2luaXRfcmVnX3ZhbHVlcyhzdHJ1Y3QgZHNjX3JlZ192YWx1ZXMgKnJlZ192YWxzKQogCXJl
Z192YWxzLT5pY2hfcmVzZXRfYXRfZW9sICAgICAgICAgICAgPSAwOwogCXJlZ192YWxzLT5hbHRl
cm5hdGVfaWNoX2VuY29kaW5nX2VuICAgPSAwOwogCXJlZ192YWxzLT5yY19idWZmZXJfbW9kZWxf
c2l6ZSAgICAgICAgPSAwOwotCXJlZ192YWxzLT5kaXNhYmxlX2ljaCAgICAgICAgICAgICAgICAg
PSAwOworCS8qcmVnX3ZhbHMtPmRpc2FibGVfaWNoICAgICAgICAgICAgICAgICA9IDA7Ki8KIAly
ZWdfdmFscy0+ZHNjX2RiZ19lbiAgICAgICAgICAgICAgICAgID0gMDsKIAogCWZvciAoaSA9IDA7
IGkgPCA0OyBpKyspCkBAIC01MTgsOSArNTE4LDExIEBAIHN0YXRpYyB2b2lkIGRzY193cml0ZV90
b19yZWdpc3RlcnMoc3RydWN0IGRpc3BsYXlfc3RyZWFtX2NvbXByZXNzb3IgKmRzYywgY29uc3QK
IAkJQUxURVJOQVRFX0lDSF9FTkNPRElOR19FTiwgcmVnX3ZhbHMtPmFsdGVybmF0ZV9pY2hfZW5j
b2RpbmdfZW4sCiAJCU5VTUJFUl9PRl9TTElDRVNfSU5fVkVSVElDQUxfRElSRUNUSU9OLCByZWdf
dmFscy0+bnVtX3NsaWNlc192IC0gMSk7CiAKLQlSRUdfU0VUXzIoRFNDQ19DT05GSUcxLCAwLAor
CVJFR19TRVQoRFNDQ19DT05GSUcxLCAwLAorCQkJRFNDQ19SQVRFX0NPTlRST0xfQlVGRkVSX01P
REVMX1NJWkUsIHJlZ192YWxzLT5yY19idWZmZXJfbW9kZWxfc2l6ZSk7CisJLypSRUdfU0VUXzIo
RFNDQ19DT05GSUcxLCAwLAogCQlEU0NDX1JBVEVfQ09OVFJPTF9CVUZGRVJfTU9ERUxfU0laRSwg
cmVnX3ZhbHMtPnJjX2J1ZmZlcl9tb2RlbF9zaXplLAotCQlEU0NDX0RJU0FCTEVfSUNILCByZWdf
dmFscy0+ZGlzYWJsZV9pY2gpOworCQlEU0NDX0RJU0FCTEVfSUNILCByZWdfdmFscy0+ZGlzYWJs
ZV9pY2gpOyovCiAKIAlSRUdfU0VUXzQoRFNDQ19JTlRFUlJVUFRfQ09OVFJPTF9TVEFUVVMsIDAs
CiAJCURTQ0NfUkFURV9DT05UUk9MX0JVRkZFUl9NT0RFTDBfT1ZFUkZMT1dfT0NDVVJSRURfSU5U
X0VOLCByZWdfdmFscy0+cmNfYnVmZmVyX21vZGVsX292ZXJmbG93X2ludF9lblswXSwKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9kc2MuaCBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9kc2MuaAppbmRleCAx
Njg4NjVhMTYyODguLjRlMmZiMzgzOTBhNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2RzYy5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9kY24yMC9kY24yMF9kc2MuaApAQCAtMTAzLDcgKzEwMyw3IEBACiAJRFNDX1NG
KERTQ0MwX0RTQ0NfQ09ORklHMCwgQUxURVJOQVRFX0lDSF9FTkNPRElOR19FTiwgbWFza19zaCks
IFwKIAlEU0NfU0YoRFNDQzBfRFNDQ19DT05GSUcwLCBOVU1CRVJfT0ZfU0xJQ0VTX0lOX1ZFUlRJ
Q0FMX0RJUkVDVElPTiwgbWFza19zaCksIFwKIAlEU0NfU0YoRFNDQzBfRFNDQ19DT05GSUcxLCBE
U0NDX1JBVEVfQ09OVFJPTF9CVUZGRVJfTU9ERUxfU0laRSwgbWFza19zaCksIFwKLQlEU0NfU0Yo
RFNDQzBfRFNDQ19DT05GSUcxLCBEU0NDX0RJU0FCTEVfSUNILCBtYXNrX3NoKSwgXAorCS8qRFND
X1NGKERTQ0MwX0RTQ0NfQ09ORklHMSwgRFNDQ19ESVNBQkxFX0lDSCwgbWFza19zaCksKi8gXAog
CURTQ19TRihEU0NDMF9EU0NDX1NUQVRVUywgRFNDQ19ET1VCTEVfQlVGRkVSX1JFR19VUERBVEVf
UEVORElORywgbWFza19zaCksIFwKIAlEU0NfU0YoRFNDQzBfRFNDQ19JTlRFUlJVUFRfQ09OVFJP
TF9TVEFUVVMsIERTQ0NfUkFURV9CVUZGRVIwX09WRVJGTE9XX09DQ1VSUkVELCBtYXNrX3NoKSwg
XAogCURTQ19TRihEU0NDMF9EU0NDX0lOVEVSUlVQVF9DT05UUk9MX1NUQVRVUywgRFNDQ19SQVRF
X0JVRkZFUjFfT1ZFUkZMT1dfT0NDVVJSRUQsIG1hc2tfc2gpLCBcCkBAIC0yNzgsNyArMjc4LDcg
QEAKIAl0eXBlIEFMVEVSTkFURV9JQ0hfRU5DT0RJTkdfRU47IFwKIAl0eXBlIE5VTUJFUl9PRl9T
TElDRVNfSU5fVkVSVElDQUxfRElSRUNUSU9OOyBcCiAJdHlwZSBEU0NDX1JBVEVfQ09OVFJPTF9C
VUZGRVJfTU9ERUxfU0laRTsgXAotCXR5cGUgRFNDQ19ESVNBQkxFX0lDSDsgXAorCS8qdHlwZSBE
U0NDX0RJU0FCTEVfSUNIOyovIFwKIAl0eXBlIERTQ0NfRE9VQkxFX0JVRkZFUl9SRUdfVVBEQVRF
X1BFTkRJTkc7IFwKIAl0eXBlIERTQ0NfUkFURV9CVUZGRVIwX09WRVJGTE9XX09DQ1VSUkVEOyBc
CiAJdHlwZSBEU0NDX1JBVEVfQlVGRkVSMV9PVkVSRkxPV19PQ0NVUlJFRDsgXAotLSAKMi4yMi4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4
IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
